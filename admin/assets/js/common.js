$(document).ready(function() {
						  cloudmove();
						   $(window).bind("resize", resizeWindow);
						   function resizeWindow( e ) { cloudmove(); boxfontsizefix(); }	
						   
						   boxfontsizefix();
						   $("#breadCrumb").jBreadCrumb();
						   
						   
						   
 });
function boxfontsizefix(){
		
	
		$('.herobox').each(function(){
								
			var boxsize = $(this).width();
								
				$(this).find('.mhero_box_head').css({'font-size': boxsize * 2 +'%'});
				$(this).find('.mhero_box_con').css({'font-size': boxsize * 4.5 +'%'});
				$(this).find('.hero_box_head').css({'font-size': boxsize * 2 +'%'});
				$(this).find('.hero_box_con').css({'font-size': boxsize * 4.5 +'%'});
								
		});
}
function cloudmove(){
	
	  var widthsize = $('#main').width();
	  if (widthsize <= 757)
	  {
		if($('.header_area1 .main_menu').hasClass('fltrt')){$('.header_area1 .main_menu').removeClass('fltrt').addClass('fltlft');}
		if($('.header_area2 .menu').hasClass('fltrt')){$('.header_area2 .menu').removeClass('fltrt').addClass('fltlft');}
		$('.header_area3 .con').hide();
		$('.menu h1').css({'font-size':'12px','padding':'0 8px'});	
		$('.header_area2 .menu').css({'line-height':'30px','text-align':'right','margin-top':'12px'});
		
		$("#con_l").hide();
		
		$("#con_r").css("width",widthsize);
		
		
	  }
	  else if (widthsize < 1000)
	  {	
	  	if($('.header_area1 .main_menu').hasClass('fltrt')){$('.header_area1 .main_menu').removeClass('fltrt').addClass('fltlft');}
		if($('.header_area2 .menu').hasClass('fltlft')){$('.header_area2 .menu').removeClass('fltrt').addClass('fltrt');}
		$('.header_area3 .con').hide();
	  	$('.menu h1').css({'font-size':'12px','padding':'0 8px'});	
		$('.header_area2 .menu').css({'line-height':'42px','text-align':'left','margin-top':'0'});
		$("#con_l").hide();
		$("#con_r").css("width",widthsize);
		
	  }
	  else if(widthsize >= 1600)
	  {
		if($('.header_area1 .main_menu').hasClass('fltlft')){$('.header_area1 .main_menu').removeClass('fltlft').addClass('fltrt');}
		if($('.header_area2 .menu').hasClass('fltlft')){$('.header_area2 .menu').removeClass('fltrt').addClass('fltrt');}
		$('.header_area3 .con').show().css({'font-size':'150%'});
		$('.menu h1').css({'font-size':'16px','padding':'0 20px'});		
		$('.header_area2 .menu').css({'line-height':'42px','text-align':'left','margin-top':'0'});
	    //davidkao
		$("#con_l").css("width",370);
		//$("#con_l").css("width",0);		
	   
		var theDiv = $("#con_l");
		var totalWidth = theDiv.width();
		totalWidth += parseInt(theDiv.css("padding-left"), 10) + parseInt(theDiv.css("padding-right"), 10); //Total Padding Width
	  	$("#con_l").show();
	  	$("#con_r").css("width",widthsize-totalWidth);
		
	   }
	  
	  else
	  {
		if($('.header_area1 .main_menu').hasClass('fltlft')){$('.header_area1 .main_menu').removeClass('fltlft').addClass('fltrt');}
		if($('.header_area2 .menu').hasClass('fltlft')){$('.header_area2 .menu').removeClass('fltrt').addClass('fltrt');}
		$('.header_area3 .con').show().css({'font-size':'132%'});;
		$('.menu h1').css({'font-size':'15px','padding':'0 15px'});		
		$('.header_area2 .menu').css({'line-height':'42px','text-align':'left','margin-top':'0'});
		//davidkao
		 $("#con_l").css("width",270);
		//$("#con_l").css("width",0);
		
		var theDiv = $("#con_l");
		var totalWidth = theDiv.width();
		totalWidth += parseInt(theDiv.css("padding-left"), 10) + parseInt(theDiv.css("padding-right"), 10); //Total Padding Width
	  	$("#con_l").show();
	  	$("#con_r").css("width",widthsize-totalWidth-10);
		
	  }
};

