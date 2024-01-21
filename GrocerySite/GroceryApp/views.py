from django.shortcuts import render
from api.models import Product, TakeProduct, Sales, Delivery
from collections import defaultdict
from django.db.models import Sum, F, FloatField
from django.db.models.functions import TruncDay, TruncMonth, TruncYear

import json
from django.http import JsonResponse
from io import BytesIO
import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
import base64



def index(request):
    data = Product.objects.all()
    eventData = TakeProduct.objects.all()[:10]
    return render(request,'index.html',{'data': data,'eventData': eventData})

def indexProdukty(request):
    data = Product.objects.all()
    return render(request,'indexProdukty.html',{'data': data})


def indexSprzedaz(request):
    period = request.GET.get('period', 'day')  # Default to daily
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
        .annotate(order_id=F('id'))
        .values('date', 'product__name', 'product__price_netto', 'product__price_brutto')
        .annotate(
            total_quantity=Sum('quantity'),
            total_netto=Sum(F('quantity') * F('product__price_netto'), output_field=FloatField()),
            total_brutto=Sum(F('quantity') * F('product__price_brutto'), output_field=FloatField())
        )
        .order_by(order_by_arg,'order_id')[:15]
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



    num_labels = 8

    if(sort_order=='asc'):
        labels = labels[:num_labels]
        total_brutto = total_brutto[:num_labels]
    else:
        labels = labels[:num_labels]
        total_brutto = total_brutto[:num_labels]





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
        'sort_by': sort_by,
        'sort_order': sort_order,
        'image_base64': image_base64,
    }

    return render(request, 'indexSprzedaz.html', context)

def indexDostawy(request):
    period = request.GET.get('period', 'day')  # Default to daily
    sort_by = request.GET.get('sort_by', 'date')  # Default to sorting by date
    sort_order = request.GET.get('sort_order', 'asc')  # Default to ascending order
    date_field = 'ordered_at'

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
        Delivery.objects
        .annotate(date=trunc_func(date_field))
        .values('date', 'product__name', 'price_netto', 'price_brutto')
        .annotate(
            total_quantity=Sum('quantity'),
            total_netto=Sum(F('quantity') * F('price_netto'), output_field=FloatField()),
            total_brutto=Sum(F('quantity') * F('price_brutto'), output_field=FloatField())
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
    plt.xlabel(f'Data ({period.capitalize()})')
    plt.ylabel('Łączna wartość zamówienia brutto[PLN]')

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
        'sort_by': sort_by,
        'sort_order': sort_order,
        'image_base64': image_base64,
    }

    return render(request, 'indexDostawy.html', context)

def indexMagazyn(request):
    data = []

    # Retrieve summary data
    summary_data = (
        TakeProduct.objects
        .values('product__name','quantity','product__unit','product__price_netto','product__price_brutto')
        .annotate(
            total_quantity=Sum('quantity'),
            total_netto=Sum(F('quantity') * F('product__price_netto'), output_field=FloatField()),
            total_brutto=Sum(F('quantity') * F('product__price_brutto'), output_field=FloatField())
        )
        .order_by('product__name')
    )
    lack_products = (
    TakeProduct.objects
    .values('product__name','quantity','product__unit','product__price_netto','product__price_brutto')
    .annotate(
        total_quantity=Sum('quantity'),
        total_netto=Sum(F('quantity') * F('product__price_netto'), output_field=FloatField()),
        total_brutto=Sum(F('quantity') * F('product__price_brutto'), output_field=FloatField())
    )
    .filter(total_quantity__lt=10)
    .order_by('total_quantity')
)

    return render(request,'indexMagazyn.html',{'data': summary_data,'lack_products': lack_products})

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


