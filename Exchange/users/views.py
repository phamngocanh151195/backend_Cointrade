# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.decorators import parser_classes
from django.core.files.storage import default_storage
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
from django.conf import settings
from django.utils import timezone
import uuid, datetime
import requests
from functools import wraps
import rest_framework_jwt
from general.models import User, Coin, UserCoin, Exchange, MatchExchange, ChenhLech, TypeCoin
from general.serializers import UserSerializer, CoinSerializer, UserCoinSerializer, ExchangeSerializer, MatchExchangeSerializer, ChenhLechSerializer, TypeCoinSerializer
import json
import re
import os
import random
from login import views

@api_view(['POST'])
def register(request):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		if 'password' not in data or 'name' not in data or 'username' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		#sinh id cua user
		list_id = User.objects.all().values_list('id', flat=True)
		data['id'] = str(uuid.uuid4().get_hex().upper()[0:10])
		while data['id'] in list_id:
			data['id'] = str(uuid.uuid4().get_hex().upper()[0:10])
		
		hashed_password = generate_password_hash(data['password'], method='sha256')
		data['password']=hashed_password
		data['rank'] = 0
		ID = data['id']
		#import pdb; pdb.set_trace();
		serializer = UserSerializer(data=data)
		if serializer.is_valid():
			serializer.save()

			data = {}
			data['userid'] = ID
			data['value'] = 0
			data['coinid'] = 1
			serializer = UserCoinSerializer(data=data)
			if serializer.is_valid():
				serializer.save()

			data = {}
			data['userid'] = ID
			data['value'] = 0
			data['coinid'] = 2
			serializer = UserCoinSerializer(data=data)
			if serializer.is_valid():
				serializer.save()			

			data = {}
			data['userid'] = ID
			data['value'] = 0
			data['coinid'] = 3
			serializer = UserCoinSerializer(data=data)
			if serializer.is_valid():
				serializer.save()

			data = {}
			data['userid'] = ID
			data['value'] = 0
			data['coinid'] = 4
			serializer = UserCoinSerializer(data=data)
			if serializer.is_valid():
				serializer.save()

			return JsonResponse({'data': 'OK', 'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le nhe', 'status': 'error'})

@api_view(['GET'])
@views.token_required_user
def profile(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':
		current_user.password = ''
		serializer = UserSerializer(current_user)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_user
def coininfo(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':

		coininfo = UserCoin.objects.filter(userid=current_user.id)
		serializer = UserCoinSerializer(coininfo, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})


#kiem tra dieu kien coin du k da
@api_view(['POST'])
@views.token_required_user
def datlenh(request, current_user):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		if 'fromtypecoin' not in data or 'fromcoin' not in data or 'totypecoin' not in data or 'tocoin' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if data['fromtypecoin']	== data['totypecoin'] or data['fromcoin'] == 0 or data['tocoin'] == 0 or data['fromcoin'] == "0" or data['tocoin'] == "0":
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		#kiem tra fromcoin
		#coin con lai o tai khoan
		usrfrom = UserCoin.objects.filter(userid=current_user.id, coinid=data['fromtypecoin'])
		#coin da dung de dat lenh
		coinfalse = Exchange.objects.filter(userid=current_user.id, fromtypecoin=data['fromtypecoin'], status=0)
		total = 0
		for i in coinfalse:
			t = i.fromcoin
			total = total + t

		#import pdb; pdb.set_trace();
		#kiem tra dieu kien
		coin = float(usrfrom[0].value - total)
		if float(data['fromcoin']) > coin:
			return JsonResponse({'message': 'Du lieu khong hop le nhe', 'status': 'error'})

		data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		data['userid'] = current_user.id

		serializer = ExchangeSerializer(data=data)
		if serializer.is_valid():
			serializer.save()

			return JsonResponse({'data': 'OK', 'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

@api_view(['DELETE'])
@views.token_required_user
def xoalenh(request, current_user):
	if request.method == 'DELETE':
		data=json.loads(json.dumps(request.data))
		if 'id' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		#kiem tra lenh
		try:
			lenh = Exchange.objects.get(id=data['id'], status=False)
		except:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if lenh.userid.id == current_user.id:
			lenh.delete()
			return JsonResponse({'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

@api_view(['PUT'])
@views.token_required_user
def sualenh(request, current_user):
	if request.method == 'PUT':
		data=json.loads(json.dumps(request.data))
		
		if 'id' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if data['fromtypecoin']	== data['totypecoin'] or not data['id']:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})
		
		try:
			lenh = Exchange.objects.get(id=data['id'])
		except:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if lenh.userid.id != current_user.id:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		#kiem tra fromcoin
		usrfrom = UserCoin.objects.filter(userid=current_user.id, coinid=data['fromtypecoin'])
		if float(data['fromcoin']) > float(usrfrom[0].value):
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		data['id'] = lenh.id
		data['status']	= False
		data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		data['userid'] = current_user.id

		serializer = ExchangeSerializer(lenh, data=data)
		if serializer.is_valid():
			serializer.save()
			return JsonResponse({'data': 'OK', 'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

def laygiatienhientai():
	timetop = Coin.objects.filter().order_by('-time').order_by('-id')[:8]
	timetop = CoinSerializer(timetop, many=True).data
	gia = []
	for time in timetop:
		if time['typecoin'] == 4:
			k = time['id']
			gia.append(time)
			for t in timetop:
				if t['id'] == k-1 or t['id'] == k-1 or t['id'] == k-2 or t['id'] == k-3:
					gia.append(t)
			break

	return gia

def giatien(fromtypecoin, giahientai):
	for i in giahientai:
		if i['typecoin'] == fromtypecoin:
			return i['price']

def laytile(giahientai, fromcoin, tocoin):
	for t in giahientai:
		if t['typecoin'] == fromcoin:
			fromvalue = t['price']
			break
	for t in giahientai:
		if t['typecoin'] == tocoin:
			tovalue = t['price']
			break
	return fromvalue/tovalue

def laytilenghich(giahientai, fromcoin, tocoin):
	for t in giahientai:
		if t['typecoin'] == fromcoin:
			fromvalue = t['price']
			break
	for t in giahientai:
		if t['typecoin'] == tocoin:
			tovalue = t['price']
			break
	return tovalue/fromvalue

def loaichenhlech(total, giahientai):
	tong = []
	for t in total:
		if giatien(t['fromtypecoin'], giahientai) > giatien(t['totypecoin'], giahientai) and t['fromcoin']/t['tocoin'] <= laytile(giahientai, t['fromtypecoin'], t['totypecoin']):
			tong.append(t)

		if giatien(t['fromtypecoin'], giahientai) < giatien(t['totypecoin'], giahientai) and t['fromcoin']/t['tocoin'] >= laytilenghich(giahientai, t['fromtypecoin'], t['totypecoin']):
			tong.append(t)

	return tong

def chuyenexchange(exchangeid, tienlai, loaitienlai):
	giachenhlech = 0.01
	ex = Exchange.objects.filter(id=exchangeid)
	data = {}
	data['id'] = ex[0].id
	data['fromcoin'] = ex[0].fromcoin
	data['tocoin'] = ex[0].tocoin
	data['time'] = ex[0].time
	data['fromtypecoin'] = ex[0].fromtypecoin.id
	data['totypecoin'] = ex[0].totypecoin.id
	data['userid'] = ex[0].userid.id
	data['status'] = True
	
	serializer = ExchangeSerializer(ex[0], data=data)
	if serializer.is_valid():
		serializer.save()

	#xac dinh gia chenh lech
	chenhlech = ChenhLech.objects.filter(fromtypecoin=ex[0].fromtypecoin.id, totypecoin=ex[0].totypecoin.id)
	giachenhlech = chenhlech[0].value

	#trutien
	if ex[0].fromtypecoin == loaitienlai:

		usercoin = UserCoin.objects.filter(userid=ex[0].userid.id, coinid=ex[0].fromtypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value - float(ex[0].fromcoin)

		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

		usercoin = UserCoin.objects.filter(userid=ex[0].userid.id, coinid=ex[0].totypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value + float(float(ex[0].tocoin)*(1-giachenhlech))
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

		#admin + tienlai + 0.01 tocoin
		usercoin = UserCoin.objects.filter(userid='D4AD333121', coinid=ex[0].totypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value + float(float(ex[0].tocoin)*giachenhlech)
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

		#admin + tienlai
		usercoin = UserCoin.objects.filter(userid='D4AD333121', coinid=ex[0].fromtypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value + float(tienlai)
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

	else:
		usercoin = UserCoin.objects.filter(userid=ex[0].userid.id, coinid=ex[0].fromtypecoin.id)

		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value - float(ex[0].fromcoin)
		#import pdb; pdb.set_trace();
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

		usercoin = UserCoin.objects.filter(userid=ex[0].userid.id, coinid=ex[0].totypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value + float(float(ex[0].tocoin)*(1-giachenhlech))
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

		#admin + 0.01 tocoin
		usercoin = UserCoin.objects.filter(userid='D4AD333121', coinid=ex[0].totypecoin.id)
		data = {}
		data['id'] = usercoin[0].id
		data['userid'] = usercoin[0].userid.id
		data['coinid'] = usercoin[0].coinid.id
		data['value'] = usercoin[0].value + float(float(ex[0].tocoin)*giachenhlech)
		serializer = UserCoinSerializer(usercoin[0], data=data)
		if serializer.is_valid():
			serializer.save()

	return 0

def chuyenmatchexchange(fromexchange, toexchange):
	data = {}
	data['fromexchange'] = fromexchange
	data['toexchange'] = toexchange
	data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

	serializer = MatchExchangeSerializer(data=data)
	if serializer.is_valid():
		serializer.save()

	return 0

def checktrangthai(id):
	ex = Exchange.objects.get(id=id)
	if ex.status == True:
		return True
	else:
		return False

@api_view(['POST'])
@views.token_required_user
def khoplenh(request, current_user):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		#gia hien tai cua cac loai tien
		giahientai = laygiatienhientai()
		#return JsonResponse({'d': giahientai})

		ex = Exchange.objects.filter(status=False).order_by('time')
		serializer = ExchangeSerializer(ex, many=True)
		total = serializer.data
		total = loaichenhlech(total, giahientai)
		#return JsonResponse({'data':total, 'len': len(total)})

		listsosanh = []
		for t in total:
			for t1 in total:
				lai = 0
				if t1['id'] > t['id'] and t['userid'] != t1['userid'] and t['fromtypecoin'] == t1['totypecoin'] and t['totypecoin'] == t1['fromtypecoin'] and ((t['fromcoin'] == t1['tocoin'] and t['tocoin'] < t1['fromcoin']) or (t['tocoin'] == t1['fromcoin'] and t1['tocoin'] < t['fromcoin'])):
					if t['tocoin'] < t1['fromcoin']:
						lai = (t1['fromcoin'] - t['tocoin']) * giatien(t['fromtypecoin'], giahientai)
						tienlai = t1['fromcoin'] - t['tocoin']
						loaitienlai = t['totypecoin']

					if t1['tocoin'] < t['fromcoin']:
						lai = (t['fromcoin'] - t1['tocoin']) * giatien(t['fromtypecoin'], giahientai)
						tienlai = t['fromcoin'] - t1['tocoin']
						loaitienlai = t['fromtypecoin']

					l = {'tienlai': lai, 'from': t['id'], 'to': t1['id'], 'lai': tienlai, 'loaitienlai': loaitienlai}
					listsosanh.append(l)

		listsosanh = sorted(listsosanh) #, reverse=True
		#return JsonResponse({'data': listsosanh})

		for li in listsosanh:
			if checktrangthai(li['from']) == False and checktrangthai(li['to']) == False:
				#import pdb; pdb.set_trace();
				chuyenexchange(li['from'], li['lai'], li['loaitienlai'])
				chuyenexchange(li['to'], li['lai'], li['loaitienlai'])
				chuyenmatchexchange(li['from'],li['to'])

		return JsonResponse({'status': 'success'})

@api_view(['GET'])
@views.token_required_user
def xemlenhdadat(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':

		lenhdadat = Exchange.objects.filter(userid=current_user.id)
		serializer = ExchangeSerializer(lenhdadat, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_user
def xemlenhdangcho(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':

		lenhdangcho = Exchange.objects.filter(userid=current_user.id, status=False)
		serializer = ExchangeSerializer(lenhdangcho, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_user
def xemlenhdakhop(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':

		lenhdakhop = Exchange.objects.filter(userid=current_user.id, status=True)
		serializer = ExchangeSerializer(lenhdakhop, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})


