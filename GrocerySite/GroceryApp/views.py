from django.shortcuts import render
from api.models import Product, TakeProduct
from collections import defaultdict

import json
from django.http import JsonResponse

def index(request):
    data = Product.objects.all()
    eventData = TakeProduct.objects.all()[:10]
    return render(request,'index.html',{'data': data,'eventData': eventData})

def indexDashboard(request):
    labels = []
    data = []

    queryset = TakeProduct.objects.all()

    category_sums = defaultdict(int)

    # Iteruj przez produkty w queryset i sumuj ilości dla każdej kategorii
    for product in queryset:
        category_sums[product.product.category] += product.quantity

    labels = list(category_sums.keys())
    data = list(category_sums.values())

    # Przekształć etykiety i dane na strukturę JSON
    labels_json = json.dumps(labels)
    data_json = json.dumps(data)

    return render(request, 'indexDashboard.html', {'labels': labels_json, 'data': data_json})


