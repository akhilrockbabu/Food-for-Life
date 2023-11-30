from django.contrib.auth.models import User
from django.shortcuts import render
from django.views.generic import TemplateView,View
from .models import DonationReg, Feedback
from accounts.models import DonorReg,UserType
from .render import Render




class DonationP(TemplateView):
    template_name = 'donor/donation.html'

    def post(self,request,*args,**kwargs):
        donation = request.POST['donation']
        id = self.request.POST['id']
        user = User.objects.get(id=id)
        details = DonorReg.objects.get(user_id=id)
        if donation != 0:
            donor = DonationReg()
            donor.donation=donation
            donor.user=user
            donor.details=details
            donor.status='pending'

            donor.save()
            return render(request,'donor/payment.html')
        

class amt(TemplateView):
    template_name = 'donor/payment.html'
    def get_context_data(self, **kwargs):
        context = super(amt, self).get_context_data(**kwargs)
        # donation = request.POST['donation']
        pp=DonorReg.objects.filter(user_id=self.request.user.id,status='pending')
        context['pp']=pp
        return context
    

class paymentdone(View):
  
   
      def dispatch(self, request, *args, **kwargs):

        # id = request.GET['id']
        # user = User.objects.get(pk=id)
        # user.last_name='1'
        # user.save()
        
        return render(request,'donor/donor_index.html',{'message':" Donation Successfull"})
        
    
  

class DonorIndex(TemplateView):
    template_name = 'donor/donor_index.html'


class Don_Don(TemplateView):
    template_name = 'donor/donation_det.html'

    def get_context_data(self, **kwargs):
        context = super(Don_Don,self).get_context_data(**kwargs)

        donations = DonationReg.objects.filter(user_id=self.request.user.id)
        context['donations'] = donations
        return context

class Don_Profile(TemplateView):
    template_name = 'donor/don_profile.html'

    def get_context_data(self, **kwargs):
        context = super(Don_Profile,self).get_context_data(**kwargs)
        context['user'] = self.request.user
        if self.request.user.is_active:
            donor = DonorReg.objects.get(user_id=self.request.user.id)
            context['donor'] =donor
        return context

    def post(self,request,*args,**kwargs):
        user = User.objects.get(id=self.request.user.id)
        donor = DonorReg.objects.get(user_id=self.request.user.id)
        if request.POST['profile'] == "profile":

            user.first_name= request.POST['name']
            user.email = request.POST['email']
            user.username = request.POST['username']
            user.save()
            donor.phone_no = request.POST['phone_no']
            donor.address = request.POST['address']
            donor.save()
            return render(request,'donor/donor_index.html',{'message':"Profile Updated"})
        else:
            user.set_password(request.POST['password'])
            user.save()
            return render(request,'donor/donor_index.html',{'message':"Password Updated"})

class Invoice(TemplateView):
    template_name = 'pdf_template.html'

    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        carg = DonationReg.objects.filter(id=id)

        return render(request, 'pdf_template.html',{'invoice':carg})
    # def get(self,request):
    #     id=request.GET['id']
    #     def get_context_data(self, **kwargs):
    #         context = super(Invoice,self).get_context_data(**kwargs)
    #
    #         invoice = DonationReg.objects.filter(id=id)
    #         context['invoice'] = invoice
    #         return context
    #     return render(request,'pdf_template.html')



class Pdf(View):

    def get(self, request):

        id = request.GET['id']
        carg = DonationReg.objects.filter(id=id)
        params = {
            'invoice': carg,
            'request': request
        }

        return Render.render('pdf_template.html', params)

class FeedBack(TemplateView):
    template_name = 'donor/donor_feedback.html'
    def post(self,request,*args,**kwargs):
        message = request.POST['feedback']
        vol = DonorReg.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = Feedback()
        feedback.message = message
        feedback.donor = vol
        feedback.user = user
        feedback.save()
        return render(request,'donor/donor_index.html',{'message':" Feedback sent"})

class ReplyFB(TemplateView):
    template_name = 'donor/feebback_table.html'
    def get_context_data(self, **kwargs):
        context = super(ReplyFB, self).get_context_data(**kwargs)
        reply = Feedback.objects.filter(donor__user_id=self.request.user.id)
        context['reply'] = reply
        return context


