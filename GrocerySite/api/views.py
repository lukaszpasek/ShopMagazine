from django.http import HttpResponse
from .models import TakeProduct
from rest_framework import viewsets,permissions
from .serializer import ProductSerializer,TakeProductSerializer

class TakeProductViewSet(viewsets.ModelViewSet):
    queryset = TakeProduct.objects.all()
    serializer_class = TakeProductSerializer
    permissions_classes = [permissions.IsAuthenticated]