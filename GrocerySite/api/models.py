from django.db import models

# Create your models here.
class Product(models.Model):
        name = models.CharField(max_length=100)
        unit = models.CharField(max_length=100)
        price_netto = models.FloatField()
        price_brutto = models.FloatField()
        barcode = models.CharField(max_length=100)
        category = models.CharField(max_length=100)
        def __str__(self):
            return self.name
        
class TakeProduct(models.Model):
        product = models.ForeignKey(Product, on_delete=models.CASCADE)
        quantity = models.IntegerField()
        added_at = models.DateTimeField(auto_now_add=True)
        def __str__(self):
            return self.product.name
