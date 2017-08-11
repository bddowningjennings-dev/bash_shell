# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect

def index(request):
    return render(request, 'blogs_app/index.html')

def new(request):
    return render(request, 'blogs_app/new.html')

def create(request):
    return redirect('/blogs')

def destroy(request, number):
    return redirect('/blogs')

def show(request, number):
    return render(request, 'blogs_app/show.html', {'number' : number})

def edit(request, number):
    return render(request, 'blogs_app/edit.html', {'number' : number})