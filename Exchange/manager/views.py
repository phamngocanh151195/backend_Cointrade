# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
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
import random
from login import views
import re

# Create your views here.
@api_view(['GET'])
@views.token_required_admin
def xemgiachenhlech(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		giachenhlech = ChenhLech.objects.all()
		serializer = ChenhLechSerializer(giachenhlech, many=True)
		data = []
		for i in serializer.data:
			k = {}
			k['id'] = i['id']
			k['namefromtypecoin'] = str(TypeCoin.objects.get(id=i['fromtypecoin']).name)
			k['nametotypecoin'] = str(TypeCoin.objects.get(id=i['totypecoin']).name)
			k['value'] = i['value']
			data.append(k)

		return JsonResponse({'data': data, 'status': 'success'})

@api_view(['POST'])
@views.token_required_admin
def chitietgiachenhlech(request, current_admin):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		try:
			giachenhlech = ChenhLech.objects.get(id=data['id'])
		except:
			return JsonResponse({'message': "Du lieu khong hop le", 'status': 'error'})

		serializer = ChenhLechSerializer(giachenhlech)
		i = serializer.data
		k = {}
		k['id'] = i['id']
		k['namefromtypecoin'] = str(TypeCoin.objects.get(id=i['fromtypecoin']).name)
		k['nametotypecoin'] = str(TypeCoin.objects.get(id=i['totypecoin']).name)
		k['value'] = i['value']

		return JsonResponse({'data': k, 'status': 'success'})

@api_view(['POST'])
@views.token_required_admin
def themgiachenhlech(request, current_admin):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))

		if 'fromtypecoin' not in data or 'totypecoin' not in data or 'value' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if data['fromtypecoin']	== data['totypecoin']:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		serializer = ChenhLechSerializer(data=data)
		if serializer.is_valid():
			try:
				serializer.save()
			except:
				return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})
					
			return JsonResponse({'data': 'OK', 'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

@api_view(['PUT'])
@views.token_required_admin
def suagiachenhlech(request, current_user):
	if request.method == 'PUT':
		data=json.loads(json.dumps(request.data))
		
		if 'id' not in data or 'value' not in data:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		try:
			lech = ChenhLech.objects.get(id=data['id'])
		except:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		data['fromtypecoin'] = lech.fromtypecoin.id
		data['totypecoin'] = lech.totypecoin.id

		match = re.match(r'^\d+\.\d+$', data['value'])
		if not match:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

		if float(data['value']) >= 0.1:
			data['value'] = str(float(data['value'])/100)

		serializer = ChenhLechSerializer(lech, data=data)
		if serializer.is_valid():
			try:
				serializer.save()
			except:
				return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})
					
			return JsonResponse({'status': 'success'})
		else:
			return JsonResponse({'message': 'Du lieu khong hop le', 'status': 'error'})

@api_view(['GET'])
@views.token_required_admin
def danhsachgiaodich(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		danhsach = Exchange.objects.all().order_by('-time')
		serializer = ExchangeSerializer(danhsach, many=True)
		data = []
		for i in serializer.data:
			k = {}
			k['id'] = i['id']
			k['fromcoin'] = i['fromcoin']
			k['namefromtypecoin'] = str(TypeCoin.objects.get(id=i['fromtypecoin']).name)
			k['tocoin'] = i['tocoin']
			k['nametotypecoin'] = str(TypeCoin.objects.get(id=i['totypecoin']).name)
			k['userid'] = i['userid']
			k['time'] = i['time']
			k['status'] = i['status']
			data.append(k)

		return JsonResponse({'data': data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_admin
def danhsachgiaodichdangcho(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		danhsach = Exchange.objects.filter(status=False).order_by('-time')
		serializer = ExchangeSerializer(danhsach, many=True)
		data = []
		for i in serializer.data:
			k = {}
			k['id'] = i['id']
			k['fromcoin'] = i['fromcoin']
			k['namefromtypecoin'] = str(TypeCoin.objects.get(id=i['fromtypecoin']).name)
			k['tocoin'] = i['tocoin']
			k['nametotypecoin'] = str(TypeCoin.objects.get(id=i['totypecoin']).name)
			k['userid'] = i['userid']
			k['time'] = i['time']
			k['status'] = i['status']
			data.append(k)
		return JsonResponse({'data': data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_admin
def danhsachgiaodichdakhop(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		danhsach = MatchExchange.objects.all().order_by('-time')
		serializer = MatchExchangeSerializer(danhsach, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_admin
def infoadmin(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		admin = User.objects.get(id='D4AD333121')
		data = {}
		data['id'] = 'D4AD333121'
		data['name'] = admin.name

		coinadmin = UserCoin.objects.filter(userid='D4AD333121')
		data['BTC'] = coinadmin[0].value
		data['ETH'] = coinadmin[1].value
		data['XMR'] = coinadmin[2].value
		data['USDT'] = coinadmin[3].value

		return JsonResponse({'data': data, 'status': 'success'})

@api_view(['GET'])
@views.token_required_admin
def infoalluser(request, current_admin):
	if request.META['REQUEST_METHOD'] == 'GET':
		user = User.objects.all()
		serializer = UserSerializer(user, many=True)
		d = []
		for i in serializer.data:
			data = {}
			data['id'] = i['id']
			data['name'] = i['name']
			coinadmin = UserCoin.objects.filter(userid=i['id']).order_by('id')
			data['BTC'] = coinadmin[0].value
			data['ETH'] = coinadmin[1].value
			data['XMR'] = coinadmin[2].value
			data['USDT'] = coinadmin[3].value
			d.append(data)

		return JsonResponse({'data': d})