$(document).ready(function(){
		
		$("#nav-toggle").click(
			function() {
				
				$("#section-nav").slideToggle(500); 
			});

		
	});
	
// prepare the form when the DOM is ready 
$(document).ready(function() { 
    
    // bind to the form's submit event 
    $('#myForm').submit(function(e) { 
         e.stopPropagation();

		var res = this.getAttribute('action').split("?");
		if(res.length > 1)
			var action = this.getAttribute('action')+'&js_valid=1&time='+Math.floor(Math.random()*10000);
		else
			var action = this.getAttribute('action')+'?js_valid=1&time='+Math.floor(Math.random()*10000);
		
		var options = { 
	        target:        '#msg_warn',   // target element(s) to be updated with server response 
	        beforeSubmit:  showRequest,  // pre-submit callback 
	        success:       showResponse,  // post-submit callback 
	 
	        // other available options: 
			url:       action         // override for form's 'action' attribute 
	        //type:      type        // 'get' or 'post', override for form's 'method' attribute 
	        //dataType:  null        // 'xml', 'script', or 'json' (expected server response type) 
	        //clearForm: true        // clear all form fields after successful submit 
	        //resetForm: true        // reset the form after successful submit 
	 
	        // $.ajax options can be used here too, for example: 
	        //timeout:   3000 
	    }; 
		
		
		// inside event callbacks 'this' is the DOM element so we first 
        // wrap it in a jQuery object and then invoke ajaxSubmit 
        $(this).ajaxSubmit(options); 
		
        // !!! Important !!! 
        // always return false to prevent standard browser submit and page navigation 
        return false; 
    }); 
}); 
 
// pre-submit callback 
function showRequest(formData, jqForm, options) { 
    // formData is an array; here we use $.param to convert it to a string to display it 
    // but the form plugin does this for you automatically when it submits the data 
    //var queryString = $.param(formData); 
 
    // jqForm is a jQuery object encapsulating the form element.  To access the 
    // DOM element for the form do this: 
    // var formElement = jqForm[0]; 
 
    //alert('About to submit: \n\n' + queryString); 
	$('input').attr("disabled", true);
	
    // here we could return false to prevent the form from being submitted; 
    // returning anything other than false will allow the form submit to continue 
    return true; 
} 
 
// post-submit callback 
function showResponse(responseText, statusText)  { 
    // for normal html responses, the first argument to the success callback 
    // is the XMLHttpRequest object's responseText property 
 
    // if the ajaxSubmit method was passed an Options Object with the dataType 
    // property set to 'xml' then the first argument to the success callback 
    // is the XMLHttpRequest object's responseXML property 
 
    // if the ajaxSubmit method was passed an Options Object with the dataType 
    // property set to 'json' then the first argument to the success callback 
    // is the json data object returned by the server 
 
    //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText + 
    //    '\n\nThe output div should have already been updated with the responseText.'); 
	
	$('input').attr("disabled", false);
	
	if(responseText.length == 0){
		$("#myForm").unbind('submit');
		//$("#myForm").trigger("submit");
		$("#myForm").submit();
	}else{
		
		$("#msg_warn").show();
		responseText = responseText.replace(/<br>/ig, "\n");
		alert(responseText);
	}
} 


function delBasket(type,index){
	var url = "getBasket.php?func=del&index="+index+"&type="+type;
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	    $("#"+type+"_basket_data").html(html);
		
		
	  }
});
}

function addBasket(type,id,index){
	
	
	if(index>-1)	
		var url = "getBasket.php?func=edit&type="+type+"&id="+id+"&index="+index;
	else
		var url = "getBasket.php?func=add&type="+type+"&id="+id;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
		if(html.length){
			alert(html);
		}else{
			
			getBasket(type);
			if(index>-1){
				tb_remove();
			}
			
		}	
	  }
});
}

function addTeamFlights(flights_code,flights_day){
	
	
	var url = "getTeamFlights.php?func=add&flights_code="+flights_code+"&flights_day="+flights_day;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
		if(html.length){
			alert(html);
		}else{
			
			getTeamFlights();
			
		}	
	  }
});
}

function delTeamFlights(index){
	var url = "getTeamFlights.php?func=del&index="+index;
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	    $("#flights_data").html(html);
		
		
	  }
});
}

function getTeamFlights(){
	var url = "getTeamFlights.php";
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  
		$("#flights_data").html(html);
	  }
});
}	

function getBasket(type,index){
	var url = "getBasket.php?index="+index+"&type="+type;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  
		$("#"+type+"_basket_data").html(html);
	  }
});
}	

function selectAll(container_id){
		
	var rows = document.getElementById(container_id).getElementsByTagName('tr');
   
	var checkbox;
	
	for ( var i = 0; i < rows.length; i++ ) {
		
		checkbox = rows[i].getElementsByTagName( 'input' )[0];

		if ( checkbox && checkbox.type == 'checkbox' ) {
			if ( checkbox.disabled == false ) {
				checkbox.checked = true;
				
			}
		}
	}

	return true;
}
function unSelectAll(container_id){
	var rows = document.getElementById(container_id).getElementsByTagName('tr');
	var checkbox;

	for ( var i = 0; i < rows.length; i++ ) {

		checkbox = rows[i].getElementsByTagName( 'input' )[0];

		if ( checkbox && checkbox.type == 'checkbox' ) {
			
			checkbox.checked = false;
		   
		}
	}

	return true;
}

function selectMusicTool(){
	var url = "selectMusicTool.php";
	$.ajax({
		url: url,
		cache: false,
		success: function(html){
			document.getElementById("music_tool_data").innerHTML = html;
		}
	});
}

function addMusicTool(){
	var url = "selectMusicTool.php?func=add";
	$.ajax({
		url: url,
		cache: false,
		success: function(html){
			document.getElementById("music_tool_data").innerHTML = html;
		}
	});
}

function editMusicTool(id,music_tool,ability){
	var url = "selectMusicTool.php?func=edit&id="+id+"&music_tool="+music_tool+"&ability="+ability;
	$.ajax({
		url: url,
		cache: false,
		success: function(html){
			document.getElementById("music_tool_data").innerHTML = html;
		}
	});
}

function delMusicTool(id){
	var url = "selectMusicTool.php?func=del&id="+id;
	$.ajax({
		  url: url,
		  cache: false,
		  success: function(html){
			document.getElementById("music_tool_data").innerHTML = html;
		  }
	});
}

function selectSingerTeam(){
	var url = "selectSingerTeam.php";
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
		document.getElementById("singer_team_data").innerHTML = html;
	  }
});
}

function addSingerTeam(){
	var url = "selectSingerTeam.php?func=add";
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
		document.getElementById("singer_team_data").innerHTML = html;
	  }
});
}

function delSingerTeam(id){
	var url = "selectSingerTeam.php?func=del&id="+id;
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
		document.getElementById("singer_team_data").innerHTML = html;
	  }
});
}


				