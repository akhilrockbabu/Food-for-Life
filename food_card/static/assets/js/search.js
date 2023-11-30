$(document).ready(function(){"use strict";animation()
$.each($('.row'),function(){var c=$(this).attr("data-color");$(this).css("background",c)});var input=$('#search-wrap input');var sw=$('#search-wrap');var tw=$('.tags-wrap');var sr=$('#search-results');$('#search-btn').click(function(){sw.addClass('active');input.focus()});$('#content-wrap, #li-4').click(function(){fcollapse(sw,tw)
input.val("");nsearch(sr)});input.keyup(function(e){tw.addClass('active');if($(this).val().length==0){tw.removeClass('active');nsearch(sr)}
if(e.keyCode==13){fsearch(input,sr,tw)}
if(e.keyCode==8){nsearch(sr)}});$('.tags-wrap ul li').click(function(){var txt=$(this).text();input.val(txt);input.focus()});$('#li-3').click(function(){fsearch(input,sr,tw)});var count=0;$(window).scroll(function(event){var scrolled=$(this).scrollTop();if(scrolled>count){count++;$('#nav-wrap').addClass('active')}
else{count--;$('#nav-wrap').removeClass('active')}
count=scrolled;if(count==0){animation()
$('#first-row i').removeClass('active')}else{$('h1 ,h2').removeClass('animationActive');$('#first-row i').addClass('active')}
if(count==200){fcollapse(sw,tw)}});var mob=$('#menu-mob');mob.click(function(){$(this).toggleClass('active');$('#nav-wrap ul li').toggleClass('mob')});function animation(){$('h1').addClass('animationActive');var count=0;var limit=10;var interval=setInterval(function(){count++;if(count===limit){clearInterval(interval);$('h2').addClass('animationActive')}},50)}
function fcollapse(sw,tw){sw.removeClass('active');tw.removeClass('active')}
function fsearch(input,sr,tw){var r=input.val();$('.tags-wrap ul').css('display','none');sr.html('Sorry, 0 results were found for: <span> "'+r+'"</span>');tw.addClass('active')}
function nsearch(sr){sr.html('');$('.tags-wrap ul').css('display','inline-block')}})