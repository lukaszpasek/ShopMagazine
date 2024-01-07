from django.shortcuts import render
from api.models import Product, TakeProduct, Sales
from collections import defaultdict
from django.db.models import Sum, F, FloatField
from django.db.models.functions import TruncDay, TruncMonth, TruncYear

import json
from django.http import JsonResponse
from io import BytesIO
import matplotlib.pyplot as plt
import base64



def index(request):
    data = Product.objects.all()
    eventData = TakeProduct.objects.all()[:10]
    return render(request,'index.html',{'data': data,'eventData': eventData})

def indexProdukty(request):
    data = Product.objects.all()
    eventData = TakeProduct.objects.all()[:10]
    return render(request,'indexProdukty.html',{'data': data,'eventData': eventData})


def indexSprzedaz(request):
    period = request.GET.get('period', 'day')  # Default to daily
    group_by_product = request.GET.get('group_by_product', False)
    sort_by = request.GET.get('sort_by', 'date')  # Default to sorting by date
    sort_order = request.GET.get('sort_order', 'asc')  # Default to ascending order
    date_field = 'sold_at'

    if period == 'day':
        trunc_func = TruncDay
    elif period == 'month':
        trunc_func = TruncMonth
    elif period == 'year':
        trunc_func = TruncYear
    else:
        trunc_func = TruncDay  # Default to daily

    # Define the field to sort by
    if sort_by not in ['date', 'product__name', 'total_quantity', 'total_brutto', 'total_netto']:
        sort_by = 'date'

    # Define the sort order
    if sort_order not in ['asc', 'desc']:
        sort_order = 'asc'

    # Determine the order_by argument based on sort_order
    order_by_arg = f"{'' if sort_order == 'asc' else '-'}{sort_by}"

    # Retrieve summary data
    summary_data = (
        Sales.objects
        .annotate(date=trunc_func(date_field))
        .values('date', 'product__name', 'product__price_netto', 'product__price_brutto')
        .annotate(
            total_quantity=Sum('quantity'),
            total_netto=Sum(F('quantity') * F('product__price_netto'), output_field=FloatField()),
            total_brutto=Sum(F('quantity') * F('product__price_brutto'), output_field=FloatField())
        )
        .order_by(order_by_arg, 'product__name')
    )

    # Generate bar chart
    plt.figure(figsize=(10, 6))
    if period == 'day':
        labels = [item['date'].strftime('%Y-%m-%d') for item in summary_data]
    elif period == 'month':
        labels = [item['date'].strftime('%Y-%m') for item in summary_data]
    elif period == 'year':
        labels = [item['date'].strftime('%Y') for item in summary_data]

    total_brutto = [item['total_brutto'] for item in summary_data]

    labels = labels[::-1]
    total_brutto = total_brutto[::-1]


    num_labels = min(len(labels), 7)


    labels = labels[:num_labels][::-1]
    total_brutto = total_brutto[:num_labels][::-1]

    plt.bar(labels, total_brutto, color='skyblue')
    plt.title(f'Sprzedaż brutto[PLN] w czasie z uwzględnieniem {period}')
    plt.xlabel(f'Data ({period.capitalize()})')
    plt.ylabel('Sprzedaż brutto[PLN]')

    # Save the plot to a BytesIO object
    image_stream = BytesIO()
    plt.savefig(image_stream, format='png')
    plt.close()

    # Encode the image to base64
    image_base64 = base64.b64encode(image_stream.getvalue()).decode('utf-8')

    # Pass the base64-encoded image to the context
    context = {
        'sales_summary_data': summary_data,
        'period': period,
        'group_by_product': group_by_product,
        'sort_by': sort_by,
        'sort_order': sort_order,
        'image_base64': image_base64,
    }

    return render(request, 'indexSprzedaz.html', context)

def indexMagazyn(request):
    labels = []
    data = []

    queryset = TakeProduct.objects.all()

    category_sums = defaultdict(int)

    # Iteruj przez produkty w queryset i sumuj ilości dla każdej kategorii
    for product in queryset:
        if product.product.category is not None:
            category_sums[product.product.category] += product.quantity
        else:
            category_sums["Brak danych"] += product.quantity

    
    labels = list(category_sums.keys())
    data = list(category_sums.values())

    # Przekształć etykiety i dane na strukturę JSON
    labels_json = json.dumps(labels)
    data_json = json.dumps(data)

    return render(request, 'indexMagazyn.html', {'labels': labels_json, 'data': data_json})

def indexDashboard(request):
    labels = []
    data = []

    queryset = TakeProduct.objects.all()

    category_sums = defaultdict(int)

    # Iteruj przez produkty w queryset i sumuj ilości dla każdej kategorii
    for product in queryset:
        if product.product.category is not None:
            category_sums[product.product.category] += product.quantity
        else:
            category_sums["Brak danych"] += product.quantity

    
    labels = list(category_sums.keys())
    data = list(category_sums.values())

    # Przekształć etykiety i dane na strukturę JSON
    labels_json = json.dumps(labels)
    data_json = json.dumps(data)

    return render(request, 'indexDashboard.html', {'labels': labels_json, 'data': data_json})


