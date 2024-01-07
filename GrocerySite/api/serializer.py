from .models import Product,TakeProduct, Sales
from rest_framework import serializers

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['name','barcode','category']

class TakeProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = TakeProduct
        fields = ['product','quantity','added_at']

class SalesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sales
        fields = ['product','quantity','sold_at']