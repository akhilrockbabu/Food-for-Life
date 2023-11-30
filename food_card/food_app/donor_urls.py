from django.urls import path, include
from .donor_views import DonationP,DonorIndex,Don_Don,Don_Profile,Invoice,Pdf,FeedBack,ReplyFB, amt, paymentdone


urlpatterns = [
    path('',DonorIndex.as_view()),
    path('donate',DonationP.as_view()),
    path('my_donations',Don_Don.as_view()),
    path('my_profile',Don_Profile.as_view()),
    path('invoice',Invoice.as_view()),
    path('invoice_pdf',Pdf.as_view()),
    path('feedback',FeedBack.as_view()),
    path('replyfb',ReplyFB.as_view()),
    path('amt',amt.as_view()),
    path('paymentdone',paymentdone.as_view()),


    
]