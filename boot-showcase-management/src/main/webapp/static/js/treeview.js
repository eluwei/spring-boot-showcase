/*!
 * jQuery JavaScript Library v1.4.2
 * http://jquery.com/
 *
 * Copyright 2010, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2010, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Sat Feb 13 22:33:48 2010 -0500
 */

jQuery(document).ready(function(){
	jQuery('.xbjys .left_navtit').click(function() {
		jQuery('.xbjys .menu_3').slideUp('fast');	
		jQuery(this).next().slideDown('fast');
	});
	
	jQuery(".xbjys .menu_bg").trigger('click');

	jQuery(".xbjys").find(".left_navtit").click(function(){

	jQuery(".xbjys").find(".left_navtit").filter(".menu_bg").removeClass("menu_bg");
	jQuery(this).addClass("menu_bg");
	
	});


	jQuery(".xbjys").find(".menu_3").find("span").hover(
		function(){
			jQuery(this).addClass("hover-ltbg");
		},
		function(){
			jQuery(this).removeClass("hover-ltbg");
		}
	);


	jQuery(".tablist tr").each(function(i) {  
         var className = ["odd", "even"][i % 2];  
         jQuery(this).addClass(className);  
         jQuery(this).hover(  
             function() {  
                 jQuery(this).removeClass(className);  
                 jQuery(this).addClass("current");  
            },  
             function() {  
                 jQuery(this).removeClass("current");  
                 jQuery(this).addClass(className);  
             }  
         );  
    }); 

	jQuery("a.clibox").click(function(){
		jQuery(".inf_box").removeClass("none").show();
	});
	
	jQuery(".son_list dd").hide().first().show();
	jQuery(".son_list dt").first().children().children("em.partoggle").addClass("current");
	jQuery(".son_list dt").click(function(){
		jQuery(this).next("dd").slideToggle();
		jQuery(this).children().children("em.partoggle").toggleClass("current");
	});
		
});

