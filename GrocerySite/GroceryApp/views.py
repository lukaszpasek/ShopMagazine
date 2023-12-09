from django.shortcuts import render
from api.models import Product, TakeProduct

def index(request):
    data = Product.objects.all()
    eventData = TakeProduct.objects.all()
    return render(request,'index.html',{'data': data,'eventData': eventData})

