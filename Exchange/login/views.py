# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
import uuid, datetime
from functools import wraps
import rest_framework_jwt
from general.models import User
from general.serializers import UserSerializer

#admin
def token_required_admin(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_admin = User.objects.get(id=data['id'], level=1)

            if not current_admin:
                return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)
        except:
            return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)
        return f(request, current_admin, *args, **kwargs)

    return decorated

@api_view(['POST'])
def login_admin(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)

    try:
        user = User.objects.get(username=auth['username'])
    except User.DoesNotExist:
        return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)

    if check_password_hash(user.password, auth['password']) and user.level==1:
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=3600), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8'), 'status': 'success'})

    return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)


#nguoi dung
def token_required_user(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_user = User.objects.get(id=data['id'], level=0)

            if not current_user:
                return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)
        except:
            return JsonResponse({'message': 'Token khong hop le', 'status': 'error'}, status=200)
        return f(request, current_user, *args, **kwargs)

    return decorated

@api_view(['POST'])
def login_user(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)

    try:
        user = User.objects.get(username=auth['username'])
    except User.DoesNotExist:
        return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)

    if check_password_hash(user.password, auth['password']) and user.level==0:
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=3600), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8'), 'status': 'success'})

    return JsonResponse({'message': 'Khong the dang nhap', 'status': 'error'}, status=200)