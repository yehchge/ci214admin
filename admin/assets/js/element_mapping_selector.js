$(document).ready(function(){
  $("form").delegate(".component", "mousedown", function(md){
    $(".popover").hide();
	
    md.preventDefault();
    var tops = [];
    var mouseX = md.pageX;
    var mouseY = md.pageY;
    var $temp;
    var timeout;
    var $this = $(this);
    var delays = {
      main: 0,
      form: 200
    }
    var type;

    if($this.parent().parent().parent().parent().attr("id") === "components"){
      type = "main";
    } else {
      type = "form";
    }

    var delayed = setTimeout(function(){
      if(type === "main"){
        $temp = $("<form class='form-horizontal span6 ' id='temp'>").append($this.clone());
      } else {
        if($this.attr("id") !== "legend"){
          $temp = $("<form class='form-horizontal span6 ' id='temp'>").append($this);
        }
      }

      $("body").append($temp);

      $temp.css({"position" : "absolute",
                 "top"      : mouseY - ($temp.height()/2) + "px",
                 "left"     : mouseX - ($temp.width()/2) + "px",
                 "opacity"  : "0.9"}).show()

      var half_box_height = ($temp.height()/2);
      var half_box_width = ($temp.width()/2);
      var $target = $("#target");
      var tar_pos = $target.position();
      var $target_component = $("#target .component");

      $(document).delegate("body", "mousemove", function(mm){

        var mm_mouseX = mm.pageX;
        var mm_mouseY = mm.pageY;

        $temp.css({"top"      : mm_mouseY - half_box_height + "px",
          "left"      : mm_mouseX - half_box_width  + "px"});

        if ( mm_mouseX > tar_pos.left &&
          mm_mouseX < tar_pos.left + $target.width() + $temp.width()/2 &&
          mm_mouseY > tar_pos.top &&
          mm_mouseY < tar_pos.top + $target.height() + $temp.height()/2
          ){
            $("#target").css("background-color", "#fafdff");
            $target_component.css({"border-top" : "1px solid white", "border-bottom" : "none"});
            tops = $.grep($target_component, function(e){
              return ($(e).position().top -  mm_mouseY + half_box_height > 0 && $(e).attr("id") !== "legend");
            });
            if (tops.length > 0){
              $(tops[0]).css("border-top", "1px solid #22aaff");
            } else{
              if($target_component.length > 0){
                $($target_component[$target_component.length - 1]).css("border-bottom", "1px solid #22aaff");
              }
            }
          } else{
            $("#target").css("background-color", "#fff");
            $target_component.css({"border-top" : "1px solid white", "border-bottom" : "none"});
            $target.css("background-color", "#fff");
          }
      });

      $("body").delegate("#temp", "mouseup", function(mu){
        mu.preventDefault();

        var mu_mouseX = mu.pageX;
        var mu_mouseY = mu.pageY;
        var tar_pos = $target.position();

        $("#target .component").css({"border-top" : "1px solid white", "border-bottom" : "none"});

        // acting only if mouse is in right place
        if (mu_mouseX + half_box_width > tar_pos.left &&
          mu_mouseX - half_box_width < tar_pos.left + $target.width() &&
          mu_mouseY + half_box_height > tar_pos.top &&
          mu_mouseY - half_box_height < tar_pos.top + $target.height()
          ){

			
			var id = $temp.find('[element-type]').attr('id');
			
			if($('#target').find('#'+id).size() > 0) {
				$target.css("background-color", "#fff");
				$(document).undelegate("body", "mousemove");
				$("body").undelegate("#temp","mouseup");
				$("#target .component").popover({trigger: "manual"});
				$temp.remove();
				
				return;
			}
			
			$temp.attr("style", null);
            // where to add
            if(tops.length > 0){
              $($temp.html()).insertBefore(tops[0]);
            } else {
              $("#target fieldset").append($temp.html());
            }
          } else {
            // no add
            $("#target .component").css({"border-top" : "1px solid white", "border-bottom" : "none"});
            tops = [];
          }

        //clean up & add popover
        $target.css("background-color", "#fff");
        $(document).undelegate("body", "mousemove");
        $("body").undelegate("#temp","mouseup");
        $("#target .component").popover({trigger: "manual"});
        $temp.remove();
        //genSource();
      });
    }, delays[type]);

    $(document).mouseup(function () {
      clearInterval(delayed);
      return false;
    });
    $(this).mouseout(function () {
      clearInterval(delayed);
    });
  });
  
  //activate legend popover
  $("#target .component").popover({trigger: "manual"});
  //popover on click event
  $("#target").delegate(".component", "click hover", function(e){
	if(e.type == "mouseenter") {
		$(this).find('.edit').show();
	} else if(e.type == "mouseleave") {
		$(this).find('.edit').hide();
	} else {
    e.preventDefault();
    $(".popover").hide();
    $(".popover").remove();
    var $active_component = $(this);
    $active_component.popover("show");

	var valtypes = $active_component.find("[element-type]");
	
    $.each(valtypes, function(i,e){
      var valtype = $(e).attr("element-type");
	  var valID = $(e).attr("id");
	 
		

      var val;
	  
      if(valtype ==="text"){
			
		val = $(e).val();
		
		$('.popover #'+valID).val(val);
       
      } else if(valtype==="checkbox"){
        if($(e).is(":checked")){	
			$('.popover #'+valID).filter('[value="'+$(e).val()+'"]').attr("checked", true);
		}
      } else if(valtype==="option"){
		
		if($(e).find('option').is(':selected')) {		
			
			$('.popover #'+valID).find(':contains("'+$(e).find('option:selected').text()+'")').attr("selected", true);
		}
     
      }else if(valtype==="radio"){
        if($(e).is(":checked")){	
			$('.popover #'+valID).filter('[value="'+$(e).val()+'"]').attr("checked", true);
		}
      
      }else if(valtype==="textarea"){
        val = $(e).text();
		$('.popover #'+valID).val(val);

      }
    });

    $(".popover").delegate(".btn-danger", "click", function(e){
      e.preventDefault();
      $active_component.popover("hide");
    });

    $(".popover").delegate(".btn-success", "click", function(e){
      e.preventDefault();
      
	  var valtypes = $('.popover ').find("[element-type]");
	
	$.each(valtypes, function(i,e){
      var valtype = $(e).attr("element-type");
	  var valID = $(e).attr("id");
	  

	  var value = $active_component.find('#'+valID);
		
	  if(valtype==="checkbox") {

		if($(e).is(":checked")){	 
		
          $(value).filter('[value="'+$(e).val()+'"]').attr("checked", true);
        }
        else{
          $(value).filter('[value="'+$(e).val()+'"]').attr("checked", false);
        }
      } else if (valtype==="option"){
		
		if($(e).find('option').is(':selected')) {		
			
			$(value).find(':contains("'+$(e).find('option:selected').text()+'")').attr("selected", true);
		}
		
      } else if (valtype==="textarea"){
			$(value).text($(e).val());			
           
      }else if (valtype==="text"){
			$(value).attr('value', $(e).val());	
      } else if (valtype==="radio"){		  
			if($(e).is(":checked")){	
			  $(value).filter('[value="'+$(e).val()+'"]').attr("checked", true);
			}			
      }
    $active_component.popover("hide");
    });
    });
	}
  });
  
 
});
