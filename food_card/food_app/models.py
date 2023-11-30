from django.contrib.auth.models import User
from django.db import models
from accounts.models import DonorReg,VolReg,HotelReg,UserType
import media

class DonationReg(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    details = models.ForeignKey(DonorReg,on_delete=models.CASCADE,null=True)
    donation = models.IntegerField(null=True)
    time = models.TimeField(auto_now=True)
    date = models.DateField(auto_now=True)
    # status = models.CharField(max_length=40,null=True)


class CardRegistration(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    volun = models.ForeignKey(VolReg,on_delete=models.CASCADE)
    name = models.CharField(max_length=50,null=True)
    photo = models.ImageField('images/',null=True)
    address = models.CharField(max_length=50)
    aadhar = models.CharField(max_length=40,null=True)
    date=models.DateTimeField(null=True,auto_now=True)
    approved=models.BooleanField(default=0,null=True)
    rejected=models.BooleanField(default=0,null=True)

class CardGeneration(models.Model):
    card=models.ForeignKey(CardRegistration,on_delete=models.CASCADE)
    cardnum=models.CharField(max_length=10,default=0)
    date=models.DateTimeField(auto_now=True,null=True)
    used = models.BooleanField(default=0)

class UsedCards(models.Model):
    card = models.ForeignKey(CardGeneration,on_delete=models.CASCADE)
    hotel = models.ForeignKey(HotelReg,on_delete=models.CASCADE)
    time = models.TimeField(auto_now=True)
    date = models.DateField(auto_now=True)
    amount=models.CharField(max_length=30,null=True)
    status=models.CharField(max_length=30,null=True)
class Payment(models.Model):
    hotel = models.ForeignKey(HotelReg,on_delete=models.CASCADE)
    amount = models.CharField(max_length=30,null=True)
    date = models.DateField(auto_now=True,null=True)
    time = models.TimeField(auto_now=True,null=True)

class Feedback(models.Model):

    hotel = models.ForeignKey(HotelReg,on_delete=models.CASCADE, null=True)
    volunteer = models.ForeignKey(VolReg,on_delete=models.CASCADE,null=True)
    donor = models.ForeignKey(DonorReg,on_delete=models.CASCADE,null=True)
    user = models.ForeignKey(UserType,on_delete=models.CASCADE,null=True)
    message = models.CharField(max_length=1000,null=True)
    reply = models.CharField(max_length=1000,null=True)
    date = models.DateTimeField(auto_now=True)

