from django.conf.urls import url
from . import views
urlpatterns= [
    url(r'^register/$', views.register, name='register'),
    url(r'^profile/$', views.profile, name='profile'),
    url(r'^coininfo/$', views.coininfo, name='coininfo'),
    url(r'^datlenh/$', views.datlenh, name='datlenh'),
    url(r'^sualenh/$', views.sualenh, name='sualenh'),
    url(r'^khoplenh/$', views.khoplenh, name='khoplenh'),
    url(r'^xoalenh/$', views.xoalenh, name='xoalenh'),
    url(r'^xemlenhdadat/$', views.xemlenhdadat, name='xemlenhdadat'),
    url(r'^xemlenhdangcho/$', views.xemlenhdangcho, name='xemlenhdangcho'),
    url(r'^xemlenhdakhop/$', views.xemlenhdakhop, name='xemlenhdakhop'),
]