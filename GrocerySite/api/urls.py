from django.urls import path,include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('takeproduct',views.TakeProductViewSet)

urlpatterns = [
    path('',include(router.urls)),
    path('api-auth/', include('rest_framework.urls'))
]