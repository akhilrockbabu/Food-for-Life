from django.db import models
from django.contrib.auth.models import User


class UserType(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    type = models.CharField(max_length=50)


class DonorReg(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    phone_no = models.CharField(null=True,max_length=50)
    address = models.CharField(max_length=50)


class VolReg(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    phone_no = models.CharField(null=True,max_length=50)
    address = models.CharField(max_length=50)


class HotelReg(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    phone_no = models.CharField(null=True,max_length=50)
    address = models.CharField(max_length=50)
    place = models.CharField(max_length=50,null=True)

class donor_reg(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    phone_no = models.CharField(null=True,max_length=50)
    address = models.CharField(max_length=50)


