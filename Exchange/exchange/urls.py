from django.conf.urls import url, include
from django.contrib import admin
from general import views
admin.autodiscover()

urlpatterns = [
	#admin quan ly
    url(r'^admin/', admin.site.urls),

    #giao dien quan ly
	url(r'^manager/', include('manager.urls')),

    #nguoi dung chua dang nhap
	url(r'^general/', include('general.urls')),

	#nguoi dung dang nhap
	url(r'^users/', include('users.urls')),

    #dang nhap
    url(r'^login/', include('login.urls')),
]