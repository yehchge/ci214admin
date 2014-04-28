$(document).ready(function(){
						 
							$('.hovpdf').hover(function(){$(this).find('.go_link').stop().fadeTo(80,0.75)},function(){$(this).find('.go_link').stop().fadeTo(40,1)})
							
						
							$(document).on('click', '.page1_content_1_hs', function(event){
																					 $(this).find('.page_slide_con').slideToggle(150);
																					 
																					 if($(this).find('.p_arrow').hasClass('arrow_u'))
																					 	$(this).find('.p_arrow').removeClass('arrow_u').addClass('arrow_d');
																					 else
																					 	$(this).find('.p_arrow').removeClass('arrow_d').addClass('arrow_u');
																					 });
});
