from django.views.generic import TemplateView,View
from accounts.models import DonorReg,HotelReg,VolReg
from django.contrib.auth.models import User
from django.shortcuts import render,redirect
from .models import DonationReg, CardRegistration, CardGeneration, Feedback
from .models import UsedCards,Payment
import random


class AdminIndex(TemplateView):
    template_name = 'admin/admin_index.html'

class AdminDon(TemplateView):

    template_name = 'admin/donors_list.html'

    def get_context_data(self, **kwargs):
        context = super(AdminDon,self).get_context_data(**kwargs)

        donor = DonorReg.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['donor'] = donor
        return context

class AdminHot(TemplateView):
    template_name = 'admin/hotels_list.html'

    def get_context_data(self, **kwargs):
        context = super(AdminHot,self).get_context_data(**kwargs)

        hotels = HotelReg.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['hotels'] = hotels
        return context

class AdminVol(TemplateView):
    template_name = 'admin/vol_list.html'

    def get_context_data(self, **kwargs):
        context = super(AdminVol,self).get_context_data(**kwargs)

        vol = VolReg.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')
        context['vol'] = vol
        return context

class AdminApV(TemplateView):
    template_name = 'admin/Approve_Vol.html'

    def get_context_data(self, **kwargs):
        context = super(AdminApV,self).get_context_data(**kwargs)

        vol = VolReg.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')
        context['vol'] = vol
        return context

class AdminApD(TemplateView):
    template_name = 'admin/approve_don.html'

    def get_context_data(self, **kwargs):
        context = super(AdminApD,self).get_context_data(**kwargs)

        donor = DonorReg.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')
        context['donor'] = donor
        return context

class AdminApH(TemplateView):
    template_name = 'admin/approve_hot.html'

    def get_context_data(self, **kwargs):
        context = super(AdminApH,self).get_context_data(**kwargs)

        hotels = HotelReg.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')
        context['hotels'] = hotels
        return context

class ApproveView(View):
    def dispatch(self, request, *args, **kwargs):

        id = request.GET['id']
        user = User.objects.get(pk=id)
        user.last_name='1'
        user.save()
        return redirect(request.META['HTTP_REFERER'],{'message':" User approved"})


class RejectView(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = User.objects.get(pk=id)
        user.last_name='1'
        user.is_active='0'
        user.save()
        return redirect(request.META['HTTP_REFERER'],{'message':" User Rejected"})

class DonationView(TemplateView):
    template_name = 'admin/Donations_view.html'

    def get_context_data(self, **kwargs):
        context = super(DonationView,self).get_context_data(**kwargs)
        donations = DonationReg.objects.all()
        context['donations'] = donations
        return context

class CardReq(TemplateView):
    template_name = 'admin/card_req.html'
    def get_context_data(self, **kwargs):
        context = super(CardReq,self).get_context_data(**kwargs)
        requ = CardRegistration.objects.filter(approved=0,rejected=0)
        context['requ'] = requ
        return context

class GenCard(View):
    def dispatch(self, request, *args, **kwargs):

        id = request.GET['id']
        carg = CardRegistration.objects.get(pk=id)
        carg.approved='1'
        carg.save()
        cardgen= CardGeneration()
        r=random.randint(10000,99999)
        cardgen.cardnum=r
        cardgen.card=carg
        cardgen.save()

        return redirect(request.META['HTTP_REFERER'],{'message':"Card generated"})

class RejCard(View):
    def dispatch(self, request, *args, **kwargs):

        id = request.GET['id']
        carg = CardRegistration.objects.get(pk=id)
        carg.rejected='1'
        carg.save()

        return redirect(request.META['HTTP_REFERER'],{'message':"Card rejected"})

class UsedCard(TemplateView):
    template_name = 'admin/card_used.html'
    def get_context_data(self, **kwargs):
        context = super(UsedCard, self).get_context_data(**kwargs)
        used = UsedCards.objects.filter(status ='pending')

        total = 0
        for i in used:
            total = total + int(i.amount)
        print(total)
        context['total'] = total

        context['used'] = used
        return context

class Recipients(TemplateView):
    template_name = 'admin/card_recipients.html'
    def get_context_data(self, **kwargs):
        context = super(Recipients, self).get_context_data(**kwargs)
        recepients = CardGeneration.objects.all()
        context['rec'] = recepients
        return context

class PaymentHot(TemplateView):
    template_name = 'admin/hotel_pay.html'

    def get_context_data(self, **kwargs):
        context = super(PaymentHot, self).get_context_data(**kwargs)
        hotel = HotelReg.objects.all()
        p=UsedCards.objects.all()
        context['hotel'] = hotel
        context['p']=p
        return context
    def post(self,request,*args,**kwargs):
        income = request.POST['payment']
        hotels = request.POST['hotel']
        hote = HotelReg.objects.get(id=hotels)
        pay = Payment()
        pay.amount = income
        pay.hotel = hote
        pay.save()
        return redirect(request.META['HTTP_REFERER'],{'message':" Payment successful"})

class FeedBack(TemplateView):
    template_name = 'admin/feebback_table.html'
    def get_context_data(self, **kwargs):
        context = super(FeedBack, self).get_context_data(**kwargs)
        feedback = Feedback.objects.all()

        context['feedback'] = feedback
        return context

    def post(self,request,*args,**kwargs):
        mid=request.POST['value']
        message = Feedback.objects.get(id=mid)
        reply = request.POST['reply']
        message.reply = reply
        message.save()
        return redirect(request.META['HTTP_REFERER'],{'message':" Feedback sent"})

class payment(TemplateView):
    template_name = 'admin/payment.html'
    def post(self,request,*args,**kwargs):
        context= super(payment, self).get_context_data(**kwargs)
        hid= request.GET['id']
        hotelid = HotelReg.objects.get(id=hid)
        paym=UsedCards.object.filter(hotel_id=hotelid.id)

        context['paym'] = paym
        return context

class bill(TemplateView):
    template_name = 'admin/bill.html'
    def get_context_data(self, **kwargs):
        context = super(bill, self).get_context_data(**kwargs)
        id = self.request.GET['id']
        pp=UsedCards.objects.filter(id=id)
        context['pp']=pp
        return context
    

# class paymentdone(TemplateView):
#     template_name= 'admin/payment.html'
#     def dispatch(self,request,*args,**kwargs):
#         pid = self.request.user.id
#         pid = request.GET['id']
#         ch = UsedCards.objects.get(id=pid)
#         ch.status='paid'
#         ch.save()
#         print(ch)
#         for i in ch:
#             i.status='paid'
#             i.save()
#         return render(request,'admin/admin_index.html',{'message':" payment Successfull"})
    

# class DonationP(TemplateView):
#     template_name = 'donor/donation.html'

#     def post(self,request,*args,**kwargs):
#         donation = request.POST['donation']
#         id = self.request.POST['id']
#         user = User.objects.get(id=id)
#         details = DonorReg.objects.get(user_id=id)
#         if donation != 0:
#             donor = DonationReg()
#             donor.donation=donation
#             donor.user=user
#             donor.details=details
#             donor.save()
#             return render(request,'donor/donor_index.html',{'message':"Donation successful"})


class paymentdone(TemplateView):
    template_name = 'admin/payment.html'
    def get_context_data(self, **kwargs):
        context = super(paymentdone, self).get_context_data(**kwargs)
        id = self.request.GET['id']
        # pp=UsedCards.objects.filter(id=id)
        context['pp']=id
        return context
    def post(self,request,*args, **kwargs):
        id = request.POST['id']
        pp=UsedCards.objects.get(id=id)
        pp.status='paid'
        pp.save()
        return render(request,'admin/admin_index.html',{'message':" payment Successfull"})
