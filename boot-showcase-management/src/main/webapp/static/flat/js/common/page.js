$(function () {
    getDateFormat($(".sdate"));
    bootbox.setDefaults({locale: "zh_CN"});
});

function getDateFormat(obj,format) {
    var f=format||'yyyy-mm-dd';
    obj.datepicker({language: 'zh-CN', format: f, autoclose: true});
}

//采用正则表达式获取地址栏参数
function getQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
$(window).resize(function () {
    scrollTopHandler();
});
$(window).scroll(function () {
	scrollTopHandler();
});

//全选
$(".checkAll").click(function () {
	var flag = $(this).prop("checked");
	$("[name=subBox]:checkbox").each(function () {
		$(this).prop("checked", flag);
	});
});

//获得当前时间,刻度为一千分一秒
var initializationTime=(new Date()).getTime();
function showTopTime()
{
    var now=new Date();
    var year=now.getFullYear();
    var month=now.getMonth()+1;
    var day=now.getDate();
    var hours=now.getHours();
    var minutes=now.getMinutes();
    var seconds=now.getSeconds();
	month=month<10?"0"+month:month;
	day=day<10?"0"+day:day;
	hours=hours<10?"0"+hours:hours;
	minutes=minutes<10?"0"+minutes:minutes;
	seconds=seconds<10?"0"+seconds:seconds;
    document.all.dateStr.innerHTML=""+year+" 年 "+month+" 月 "+day+" 日";
    document.all.timeStr.innerHTML=" "+hours+" : "+minutes+" : "+seconds+""
//一秒刷新一次显示时间
    var timeID=setTimeout(showTopTime,1000);
}
showTopTime();
