from django.urls import path, include
from .volunteer_views import VolIndex,Vol_Profile,VolCardReg,Recipients,RecNotApproved,FeedBack,ReplyFB,FoodCard


urlpatterns = [
    path('',VolIndex.as_view()),
    path('profile',Vol_Profile.as_view()),
    path('card',VolCardReg.as_view()),
    path('recipients',Recipients.as_view()),
    path('recinotappr',RecNotApproved.as_view()),
    path('feedback',FeedBack.as_view()),
    path('replyfb',ReplyFB.as_view()),
    path('view',FoodCard.as_view())

]