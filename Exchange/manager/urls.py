from django.conf.urls import url
from . import views
urlpatterns= [
    url(r'^xemgiachenhlech/$', views.xemgiachenhlech, name='xemgiachenhlech'),
    url(r'^themgiachenhlech/$', views.themgiachenhlech, name='themgiachenhlech'),
    url(r'^suagiachenhlech/$', views.suagiachenhlech, name='suagiachenhlech'),
    url(r'^chitietgiachenhlech/$', views.chitietgiachenhlech, name='chitietgiachenhlech'),
    url(r'^danhsachgiaodich/$', views.danhsachgiaodich, name='danhsachgiaodich'),
    url(r'^danhsachgiaodichdangcho/$', views.danhsachgiaodichdangcho, name='danhsachgiaodichdangcho'),
    url(r'^danhsachgiaodichdakhop/$', views.danhsachgiaodichdakhop, name='danhsachgiaodichdakhop'),
    url(r'^infoadmin/$', views.infoadmin, name='infoadmin'),
    url(r'^infoalluser/$', views.infoalluser, name='infoalluser'),
]