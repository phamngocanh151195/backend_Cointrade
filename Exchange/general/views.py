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
import urllib2

@api_view(['GET'])
def xembanggiacoin(request):
	if request.META['REQUEST_METHOD'] == 'GET':
		banggia = Coin.objects.all().order_by('-time')
		serializer = CoinSerializer(banggia, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['POST'])
def xembangchitietcoin(request):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		banggia = Coin.objects.filter(typecoin=data['id']).order_by('-time')
		if banggia:
			serializer = CoinSerializer(banggia, many=True)
			return JsonResponse({'data': serializer.data, 'status': 'success'})

		return JsonResponse({'message': 'Loi', 'status': 'error'})

@api_view(['GET'])
def xemdanhsachgiaodich(request):
	if request.META['REQUEST_METHOD'] == 'GET':
		danhsachgiaodich = Exchange.objects.filter(status=False).order_by('-time')
		serializer = ExchangeSerializer(danhsachgiaodich, many=True)
		return JsonResponse({'data': serializer.data, 'status': 'success'})

@api_view(['POST'])
def capnhatbanggiacoin(request):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))

		response = urllib2.urlopen('https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XMR,USDT&tsyms=VND')
		price = json.loads(response.read())

		data['price'] = price['BTC']['VND']
		data['typecoin'] = 1
		data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

		serializer = CoinSerializer(data=data)
		if serializer.is_valid():
			serializer.save()

		data['price'] = price['ETH']['VND']
		data['typecoin'] = 2
		serializer = CoinSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
		
		data['price'] = price['XMR']['VND']
		data['typecoin'] = 3
		serializer = CoinSerializer(data=data)
		if serializer.is_valid():
			serializer.save()

		data['price'] = price['USDT']['VND']
		data['typecoin'] = 4
		serializer = CoinSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
			return JsonResponse({'status': 'success'})	
		return JsonResponse({'message': 'Loi', 'status': 'error'})
