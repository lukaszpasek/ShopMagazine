from django.urls import path

from . import views

urlpatterns = [
    path('start', views.index, name="Start"),
    path('dashboard', views.indexDashboard, name="Dashboard"),
]
