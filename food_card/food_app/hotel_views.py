from django.contrib import messages
from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from django.views.generic.base import View

from accounts.models import HotelReg,UserType
from .models import CardGeneration,UsedCards,Payment,Feedback

class HotelInd(TemplateView):
    template_name = 'hotel/hotel_index.html'

class Hotel_Prof(TemplateView):
    template_name = 'hotel/hotel_profile.html'

    def get_context_data(self, **kwargs):
        context = super(Hotel_Prof,self).get_context_data(**kwargs)
        context['user'] = self.request.user
        if self.request.user.is_active:
            HotelP = HotelReg.objects.get(user_id=self.request.user.id)
            context['HotelP'] =HotelP
        return context

    def post(self,request,*args,**kwargs):
        user = User.objects.get(id=self.request.user.id)
        Hotel = HotelReg.objects.get(user_id=self.request.user.id)
        if request.POST['profile'] == "profile":

            user.first_name= request.POST['name']
            user.email = request.POST['email']
            user.username = request.POST['username']
            user.save()
            Hotel.phone_no = request.POST['phone_no']
            Hotel.address = request.POST['address']
            Hotel.save()
            return render(request,'hotel/hotel_index.html',{'message':"Profile Updated"})
        else:
            user.set_password(request.POST['password'])
            user.save()
            return render(request,'hotel/hotel_index.html',{'message':"Password Updated"})

class HotelCard(TemplateView):
    template_name = 'hotel/hotelcard.html'

    def get_context_data(self, **kwargs):
        context = super(HotelCard, self).get_context_data(**kwargs)
        requ = CardGeneration.objects.filter(used=0)
        context['requ'] = requ
        return context



class MarkUsed(View):
    def dispatch(self, request, *args, **kwargs):
        cid = request.GET['id']
        card = CardGeneration.objects.get(id=cid)
        hotel = HotelReg.objects.get(user_id=self.request.user.id)
        used = UsedCards()
        used.status='pending'
        used.card = card
        used.amount='50'
        used.hotel = hotel
        used.save()
        return redirect(request.META['HTTP_REFERER'],{'message':"Card approved"})

class HotelIncome(TemplateView):
    template_name = 'hotel/hotel_income.html'
    def get_context_data(self, **kwargs):
        context = super(HotelIncome, self).get_context_data(**kwargs)
        income = Payment.objects.filter(hotel__user__id=self.request.user.id)
        print(income)
        context['income'] = income
        return context

class FeedBack(TemplateView):
    template_name = 'hotel/hotel_feedback.html'
    def post(self,request,*args,**kwargs):
        message = request.POST['feedback']
        vol = HotelReg.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = Feedback()
        feedback.message = message
        feedback.hotel = vol
        feedback.user = user
        feedback.save()
        return render(request,'hotel/hotel_index.html',{'message':" Feedback sent"})

class ReplyFB(TemplateView):
    template_name = 'hotel/feebback_table.html'
    def get_context_data(self, **kwargs):
        context = super(ReplyFB, self).get_context_data(**kwargs)
        reply = Feedback.objects.filter(hotel__user_id=self.request.user.id)
        context['reply'] = reply
        return context

class FoodCard(TemplateView):
    template_name = 'hotel/hotel_card.html'

class Search(TemplateView):
    template_name = 'hotel/hotel_sear.html'

    def post(self,request,*args,**kwargs):
        cnum = request.POST['search']
        card = CardGeneration.objects.filter(cardnum=cnum)
        return render(request,'hotel/hotel_search.html',{'requ':card})


class payment_details(TemplateView):
    template_name = 'hotel/hotel_income.html'
    def get_context_data(self, **kwargs):
        context = super(payment_details, self).get_context_data(**kwargs)
        vol = HotelReg.objects.get(user_id=self.request.user.id)
        pp=UsedCards.objects.filter(hotel_id=vol.id,status='paid')
        context['pp']=pp
        return context



