from django.urls import path

from . import views

urlpatterns = [
    path('start', views.index, name="Start"),
    path('dashboard', views.indexDashboard, name="Dashboard"),
    path('produkty', views.indexProdukty, name="Produkty"),
    path('sprzedaz', views.indexSprzedaz, name="Sprzedaz"),
    path('magazyn', views.indexMagazyn, name="Magazyn"),
]
