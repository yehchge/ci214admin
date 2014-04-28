$(document).ready(function(){
							
							
							$('.index_newlink').hover(function(){$(this).find('.hand').stop().animate({bottom:-10},100)},function(){$(this).find('.hand').stop().animate({bottom:-34},30)})
							
							//$('#visual').parallax("50%", 0.1);
						   
							$('.hover_img').hover(function(){$(this).find('img').fadeTo(40,0.85)},function(){$(this).find('img').fadeTo(50,1)})
							
							$('.logo_click').bind ('click', function (e){
								
								if ($(this).parent().find('.login:visible').size() == 0){
									e.stopPropagation();
									$('.logo_click').addClass('active');
								}
								else{
									$('.logo_click').removeClass('active');
									}
								
								
								$(this).parent().find('.login').slideToggle(180);
									e.preventDefault();
							});
							
							
							$('.login').bind('click', function (e) {
								e.stopPropagation();
							});
							
							$('body').bind('click', function () {
								$('#logo .login').slideUp(180);
								$('.logo_click').removeClass('active');
							});
							
							
							$('.login_btn .item').hover(function(){$(this).find('.social_ico').fadeTo(50,0);$(this).find('.link').fadeTo(30,1);},function(){$(this).find('.social_ico').fadeTo(30,1);$(this).find('.link').fadeTo(50,0);});
						   
							$('.cloud').each(function() {
								$(this).jqFloat({
									width:Math.floor((Math.random()*2)+5)*250, // random 0-9 * 100
									height:15,
									speed:24000
									//speed:Math.floor(Math.random()*10) + 5000
								});
							});	
							
							
});
