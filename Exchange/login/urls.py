from django.conf.urls import url
from . import views
urlpatterns= [
    #/login/
    url(r'^admin/$', views.login_admin, name='login_admin'),
    url(r'^user/$', views.login_user, name='login_user'),
]