from django.conf.urls import url
from . import views
urlpatterns= [
    url(r'^xembanggiacoin/$', views.xembanggiacoin, name='xembanggiacoin'),
    url(r'^xembangchitietcoin/$', views.xembangchitietcoin, name='xembangchitietcoin'),
    url(r'^xemdanhsachgiaodich/$', views.xemdanhsachgiaodich, name='xemdanhsachgiaodich'),
    url(r'^capnhatbanggiacoin/$', views.capnhatbanggiacoin, name='capnhatbanggiacoin'),
]