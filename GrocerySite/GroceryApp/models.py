from django.db import models


class Product(models.Model):
    product_name = models.CharField(max_length=200)


class TakeProduct(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0)
    pub_date = models.DateTimeField("date published")