# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
import datetime
# Create your models here.

class User(models.Model):
    id = models.CharField(max_length=20, primary_key=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100, default=None, null=True, blank=True)
    level = models.IntegerField(default=0)

    class META:
        db_table = u'user'

class TypeCoin(models.Model):
	name = models.CharField(max_length=100, unique=True)

	class META:
		db_table = u'typecoin'

class Coin(models.Model):

	typecoin = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, blank=False, null=False)
	price = models.FloatField(null=False, blank=False)
	time = models.DateTimeField()

	class META:
		db_table = u'coin'

class UserCoin(models.Model):
	
	userid = models.ForeignKey('User', on_delete=models.CASCADE, blank=False, null=False)
	coinid = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, blank=False, null=False)
	value = models.FloatField()

	class META:
		db_table = u'usercoin'

class Exchange(models.Model):

	userid = models.ForeignKey('User', on_delete=models.CASCADE, blank=False, null=False)
	fromcoin = models.FloatField()
	fromtypecoin = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	tocoin = models.FloatField()
	totypecoin = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	time = models.DateTimeField()
	status = models.BooleanField(default=False)

	class META:
		db_table = u'exchange'

class MatchExchange(models.Model):

	fromexchange = models.ForeignKey('Exchange', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	toexchange = models.ForeignKey('Exchange', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	time = models.DateTimeField()

	class META:
		db_table = u'matchexchange'

class ChenhLech(models.Model):
	
	fromtypecoin = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	totypecoin = models.ForeignKey('TypeCoin', on_delete=models.CASCADE, related_name='+', blank=False, null=False)
	value = models.FloatField(null=False, blank=False)

	class META:
		db_table = u'chenhlech'