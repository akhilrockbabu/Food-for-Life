from django.contrib import messages
from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from .models import DonationReg
from accounts.models import VolReg,UserType
from .models import CardRegistration,CardGeneration,Feedback
import media

class VolIndex(TemplateView):
    template_name = 'volunteers/vol_index.html'

class Vol_Profile(TemplateView):
    template_name = 'volunteers/vol_profile.html'

    def get_context_data(self, **kwargs):
        context = super(Vol_Profile,self).get_context_data(**kwargs)
        context['user'] = self.request.user
        if self.request.user.is_active:
            volpro = VolReg.objects.get(user_id=self.request.user.id)
            context['volpro'] =volpro
        return context

    def post(self,request,*args,**kwargs):
        user = User.objects.get(id=self.request.user.id)
        volp = VolReg.objects.get(user_id=self.request.user.id)
        if request.POST['profile'] == "profile":

            user.first_name= request.POST['name']
            user.email = request.POST['email']
            user.username = request.POST['username']
            user.save()
            volp.phone_no = request.POST['phone_no']
            volp.address = request.POST['address']
            volp.save()
            return render(request,'volunteers/vol_index.html',{'message':"Profile Updated"})
        else:
            user.set_password(request.POST['password'])
            user.save()
            return render(request,'volunteers/vol_index.html',{'message':"Password Updated"})

class VolCardReg(TemplateView):
    template_name = 'volunteers/vol_card.html'

    def post(self,request,*args,**kwargs):
        name=request.POST['name']
        address=request.POST['address']
        aadhar=request.POST['aadhar']
        image=request.FILES['image']
        fil=FileSystemStorage()
        files=fil.save(image.name,image)
        user = User.objects.get(id=self.request.user.id)
        vol = VolReg.objects.get(user_id=self.request.user.id)

        card = CardRegistration()
        card.name=name
        card.address=address
        card.aadhar=aadhar
        card.photo=files
        card.user=user
        card.volun=vol
        card.save()
        return render(request,'volunteers/vol_index.html',{'message':"Request successful"})

class Recipients(TemplateView):
    template_name = 'volunteers/vol_recipients.html'
    def get_context_data(self, **kwargs):
        context = super(Recipients, self).get_context_data(**kwargs)
        recipients = CardGeneration.objects.filter(card__volun__user__id=self.request.user.id)
        context['rec'] = recipients
        return context

class RecNotApproved(TemplateView):
    template_name = 'volunteers/vol_notapproved.html'

    def get_context_data(self, **kwargs):
        context = super(RecNotApproved, self).get_context_data(**kwargs)
        rec = CardRegistration.objects.filter(approved=0)
        context['rec'] = rec
        return context

class FeedBack(TemplateView):
    template_name = 'volunteers/vol_feedback.html'
    def post(self,request,*args,**kwargs):
        message = request.POST['feedback']
        vol = VolReg.objects.get(user_id=self.request.user.id)
        user = UserType.objects.get(user_id=self.request.user.id)
        feedback = Feedback()
        feedback.message = message
        feedback.volunteer = vol
        feedback.user = user
        feedback.save()
        return render(request,'volunteers/vol_index.html',{'message':" Feedback sent"})

class ReplyFB(TemplateView):
    template_name = 'volunteers/feebback_table.html'
    def get_context_data(self, **kwargs):
        context = super(ReplyFB, self).get_context_data(**kwargs)
        reply = Feedback.objects.filter(volunteer__user_id=self.request.user.id)
        context['reply'] = reply
        return context

class FoodCard(TemplateView):
    template_name = 'volunteers/vol-apcard.html'

    def dispatch(self, request, *args, **kwargs):
        cid = request.GET['id']
        card = CardGeneration.objects.filter(id=cid)
        print(card)
        return render(request,'volunteers/vol-apcard.html',{'card':card})


