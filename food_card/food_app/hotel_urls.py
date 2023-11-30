from django.urls import path, include
from .hotel_views import HotelInd,Hotel_Prof,HotelCard,MarkUsed,HotelIncome,FeedBack,ReplyFB,FoodCard,Search, payment_details


urlpatterns = [
    path('',HotelInd.as_view()),
    path('profile',Hotel_Prof.as_view()),
    path('hocard',HotelCard.as_view()),
    path('markused',MarkUsed.as_view()),
    path('income',HotelIncome.as_view()),
    path('feedback',FeedBack.as_view()),
    path('replyfb',ReplyFB.as_view()),
    path('foodcard',FoodCard.as_view()),
    path('search',Search.as_view()),
    path('payment_details',payment_details.as_view())

]