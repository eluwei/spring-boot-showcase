	function contentformat(len){
		var link = jQuery(".alink");
		var leng  = link.length;
		for(var i = 0;i<leng;i++){
			var html = link[i].innerHTML;
			if(html.length>len){
				html = html.substr(0,len);
				link[i].innerHTML=html+"...";
			}
		}
	}
	
	function contentInit(){
		var bgColor="";
        jQuery(".usermanage tr").not(jQuery(".ttgreen")).children("td").hover(
            function(){
                bgColor=jQuery(this).parent("tr").css("background-color");
                jQuery(this).parent("tr").css("background-color","#B7E0F2");
            },
            function(){
                jQuery(this).parent("tr").css("background-color",bgColor);
            }
        );
        
        jQuery(".usermanage tr:even").css("background","#ECF0EE");
	}