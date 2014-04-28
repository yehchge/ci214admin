	
function sort_table(url,order,sort){

	var loc=url+'&order='+order+'&sort='+sort;
	
	document.location=loc;
	return;
}

/**
* @desc 舊的排序
*/
function sort_table_style(id,sort){
	var elem;
	if(document.getElementById) {
		var elem = document.getElementById(id);
	} else if (document.all){
		var elem = document.all[id];
	}
	
	if(sort.toUpperCase()=="DESC") elem.className = "sortable-desc";
	else elem.className = "sortable-asc";
}

/**
* @desc 新的排序
*/
function sort_table_style2(id,sort){
	var elem;
	if(document.getElementById) {
		elem = document.getElementById(id);
	} else if (document.all){
		elem = document.all[id];
	}
	if(sort.toUpperCase()=="DESC") elem.className = "sorting_desc";
	else elem.className = "sorting_asc";
}


// prepare the form when the DOM is ready 
$(document).ready(function() { 
    // popover demo
    $("a[rel=popover]")
      .popover()
      .click(function(e) {
        e.preventDefault()
      })

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
		
		$("#myModal_body").html(responseText);
		$("#myModal").modal();
		
		//responseText = responseText.replace(/<br>/ig, "\n");
		//alert(responseText);
	}
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

function getZipCodeSelector(element,ISO, Language,ZIP){
	var url = "api.country.client.php?element="+element+"&ISO="+ISO+"&Language="+Language+"&ZIP="+ZIP;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  	$("#"+element).html(html);
	  }
});
}

function getTagSelector(layout_element,target_element,component_element,parent_tag_no){
	var url = "api.tag.client.php?target_element="+target_element+"&component_element="+component_element+"&layout_element="+layout_element+"&parent_tag_no="+parent_tag_no;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  	$("#"+layout_element).html(html);
	  }
});
}

function getDocsFolderSelectorByStatus(layout_element,parent_folder_no){
	var url = "api.docsfolder.client.php?status=1&layout_element="+layout_element+"&parent_folder_no="+parent_folder_no;
	
	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  	$("#"+layout_element).html(html);
	  }
});
}

function getDocsFolderSelector(layout_element,parent_folder_no){
	var url = "api.docsfolder.client.php?layout_element="+layout_element+"&parent_folder_no="+parent_folder_no;

	$.ajax({
	  url: url,
	  cache: false,
	  success: function(html){
	  	$("#"+layout_element).html(html);
	  }
});
}

//開新視窗,並 focus 到新視窗
var newwin; 
function popup(url,width,height)
{	
	//if(width==0 || height==0)
	//	newwin=window.open(url,"Win","RESIZABLE=no, SCROLLBARS=yes, TOOLBAR=no,menubar=no,status=no ,alwaysRaised ");
	//else
	//	newwin=window.open(url,"Win","RESIZABLE=no, SCROLLBARS=yes, WIDTH=" + width + ", HEIGHT=" + height + ", TOOLBAR=no,menubar=no,status=no ,alwaysRaised ");
	window.open(url,"Win","RESIZABLE=no, SCROLLBARS=yes, WIDTH=" + width + ", HEIGHT=" + height + ", TOOLBAR=no,menubar=no,status=no ,alwaysRaised ");
    //newwin.focus();
}

function popup2(url,name,width,height)
{	
	if(width==0 || height==0)
		window.open(url,name,"RESIZABLE=yes,SCROLLBARS=yes, TOOLBAR=no,menubar=no,status=no ,alwaysRaised ");
	else
		window.open(url,name," RESIZABLE=yes,SCROLLBARS=yes, WIDTH=" + width + ", HEIGHT=" + height + ", TOOLBAR=no,menubar=no,status=no ,alwaysRaised ");
    
}				