from django.urls import path, include
from .admin_views import AdminDon,AdminHot,AdminVol,AdminApV,AdminApD,AdminApH,ApproveView,RejectView,DonationView,\
    AdminIndex,CardReq,GenCard,RejCard,UsedCard,Recipients,PaymentHot,FeedBack, payment, bill, paymentdone

urlpatterns = [

    path('',AdminIndex.as_view()),
    path('view_don',AdminDon.as_view()),
    path('view_hot',AdminHot.as_view()),
    path('view_vol',AdminVol.as_view()),
    path('new_vol',AdminApV.as_view()),
    path('new_don',AdminApD.as_view()),
    path('new_hot',AdminApH.as_view()),
    path('approve',ApproveView.as_view()),
    path('reject',RejectView.as_view()),
    path('donations',DonationView.as_view()),
    path('gencard',CardReq.as_view()),
    path('cardgen',GenCard.as_view()),
    path('rejcard',RejCard.as_view()),
    path('usedcards',UsedCard.as_view()),
    path('recepients',Recipients.as_view()),
    path('hotelpay',PaymentHot.as_view()),
    path('feedbacks',FeedBack.as_view()),
    path('payment',payment.as_view()),
    path('bill',bill.as_view()),
    path('paymentdone',paymentdone.as_view())


]