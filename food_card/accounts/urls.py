from django.urls import path
from .views import pre_reg,D_reg,V_reg,LoginView,HotelView
from accounts import views


urlpatterns=[
    path('c_reg',pre_reg.as_view()),
    path('d_reg',D_reg.as_view()),
    path('vol_reg',V_reg.as_view()),
    path('h_reg',HotelView.as_view()),
    path('login',LoginView.as_view()),
    path('logout',views.logout,name='logout')
]