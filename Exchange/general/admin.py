# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from .models import User, Coin, UserCoin, Exchange, MatchExchange, ChenhLech, TypeCoin

admin.site.register(Coin)
admin.site.register(User)
admin.site.register(UserCoin)
admin.site.register(Exchange)
admin.site.register(MatchExchange)
admin.site.register(ChenhLech)
admin.site.register(TypeCoin)