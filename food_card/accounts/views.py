from django.contrib import messages, auth
from django.contrib.auth import authenticate, login
from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.views.generic import TemplateView
from accounts.models import DonorReg,HotelReg,VolReg,UserType

class LoginView(TemplateView):
    template_name = 'login.html'

    def post(self, request, *args, **kwargs):
        username = request.POST['username']
        password= request.POST['password']
        user = authenticate(username=username,password=password)

        if user is not None:
            login(request,user)
            print('1')
            if user.last_name == '1':
                print('2')
                if user.is_superuser:
                    print('3')
                    return redirect('/admin')
                elif UserType.objects.get(user_id=user.id).type == "donor":
                    return redirect('/donor')
                elif UserType.objects.get(user_id=user.id).type == "Volunteer":
                    return redirect('/volunteer')
                else:
                    return redirect('/hotel')
            else:
                print('4')
                return render(request,'login.html',{'message':" User Account Not Authenticated"})
        else:
            print('5')
            return render(request,'login.html',{'message':"Invalid Username or Password"})



class pre_reg(TemplateView):

    template_name = 'pre_reg.html'

class D_reg(TemplateView):
    template_name = 'donor_reg.html'

    def post(self, request, *args, **kwargs):
        name = request.POST['name']
        username = request.POST['username']
        email = request.POST['email']
        phone_no = request.POST['phone_no']
        address = request.POST['address']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        try:
            if password1==password2:
                if User.objects.filter(username=username).exists():
                    messages.info(request,'username taken')
                    return redirect('register')
                elif User.objects.filter(email=email).exists():
                    messages.info(request, 'email taken')
                    return redirect('register')
                else:
                    user=User.objects.create_user(first_name=name,username=username,email=email,password=password1,last_name=0)
                    user.save()
                    usertype= UserType()
                    usertype.user = user
                    usertype.type="donor"
                    usertype.save()
                    reg = DonorReg()
                    reg.user = user
                    reg.address=address
                    reg.phone_no=phone_no
                    reg.save()
                    return redirect('/')
        except:
            messages = "Enter Another Username"
            return render(request, 'donor_reg.html', {'message': messages})


class V_reg(TemplateView):
    template_name = 'vol_reg.html'

    def post(self, request, *args, **kwargs):
        name = request.POST['name']
        username = request.POST['username']
        email = request.POST['email']
        phone_no = request.POST['phone_no']
        address = request.POST['address']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        try:
            if password1==password2:
                if User.objects.filter(username=username).exists():
                    messages.info(request,'username taken')
                    return redirect('register')
                elif User.objects.filter(email=email).exists():
                    messages.info(request, 'email taken')
                    return redirect('register')
                else:
                    user=User.objects.create_user(first_name=name,username=username,email=email,password=password1,last_name=0)
                    user.save()
                    usertype= UserType()
                    usertype.user = user
                    usertype.type="Volunteer"
                    usertype.save()
                    reg = VolReg()
                    reg.user = user
                    reg.address=address
                    reg.phone_no=phone_no
                    reg.save()
                    return redirect('/')
        except:
            messages = "Enter Another Username"
            return render(request, 'vol_reg.html', {'message': messages})


class HotelView(TemplateView):
    template_name = 'hotel_reg.html'

    def post(self, request, *args, **kwargs):
        name = request.POST['name']
        username = request.POST['username']
        email = request.POST['email']
        place = request.POST['place']
        phone_no = request.POST['phone_no']
        address = request.POST['address']
        password1 = request.POST['password1']
        password2 = request.POST['password2']

        try:
            if password1==password2:
                if User.objects.filter(username=username).exists():
                    messages.info(request,'username taken')
                    return redirect('register')
                elif User.objects.filter(email=email).exists():
                    messages.info(request, 'email taken')
                    return redirect('register')
                else:
                    user=User.objects.create_user(first_name=name,username=username,email=email,password=password1,last_name=0)
                    user.save()
                    usertype= UserType()
                    usertype.user = user
                    usertype.type="Hotel"
                    usertype.save()
                    reg = HotelReg()
                    reg.user = user
                    reg.address=address
                    reg.phone_no=phone_no
                    reg.address=address
                    reg.save()
                    return redirect('/')
        except:
            messages = "Enter Another Username"
            return render(request, 'vol_reg.html', {'message': messages})




def logout(request):
    auth.logout(request)
    return redirect('/')
