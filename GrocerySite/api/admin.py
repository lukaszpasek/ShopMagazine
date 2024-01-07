from django.contrib import admin
from .models import Product, TakeProduct, Sales
# Register your models here.

admin.site.register(Product)
admin.site.register(TakeProduct)
admin.site.register(Sales)