// JavaScript Document
function inital(flag){
	jQuery('.closed').click(function () {		
		jQuery('.dialog_box').hide();	
		jQuery('html').css({"overflow":"scroll",'overflow-y':'auto','overflow-x':'auto'});		
		return false;
	});
	
	if(flag==null || flag==''){
		
	}
	else{
		jQuery('html').css({"overflow":"scroll",'overflow-y':'auto','overflow-x':'auto'});		
		jQuery('.dialog_box').show();	
	}
}