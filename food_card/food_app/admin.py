from django.contrib import admin
from accounts.models import UserType,VolReg,DonorReg

admin.site.register(UserType)
admin.site.register(VolReg)
admin.site.register(DonorReg)

# Register your models here.
