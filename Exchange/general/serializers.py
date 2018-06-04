from __future__ import unicode_literals
from rest_framework import serializers
from django.db import models
from .models import User, Coin, UserCoin, Exchange, MatchExchange, ChenhLech, TypeCoin


class UserSerializer(serializers.ModelSerializer):

	class Meta:
		model = User
		fields = '__all__'

class CoinSerializer(serializers.ModelSerializer):

	class Meta:
		model = Coin
		fields = '__all__'

class TypeCoinSerializer(serializers.ModelSerializer):

	class Meta:
		model = TypeCoin
		fields = '__all__'

class UserCoinSerializer(serializers.ModelSerializer):

	class Meta:
		model = UserCoin
		fields = '__all__'

class ExchangeSerializer(serializers.ModelSerializer):

	class Meta:
		model = Exchange
		fields = '__all__'

class MatchExchangeSerializer(serializers.ModelSerializer):

	class Meta:
		model = MatchExchange
		fields = '__all__'

class ChenhLechSerializer(serializers.ModelSerializer):

	class Meta:
		model = ChenhLech
		fields = '__all__'