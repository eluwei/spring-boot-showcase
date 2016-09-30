<#include "/layout/commonLayout.ftl">

<@commonLayout title="订单列表"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>订单查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">订单管理</a></li>
			</ul>
		</div>
		<div class="row">

			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 查询结果

						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="btest">
							<table id="orders" class="table table-hover table-nomargin table-bordered display">
								<thead>
                   				   <tr>
                       				 <th>订单号</th>
                       				 <th>订单金额</th>
                      				 <th>运费</th>
									 <th>订单状态</th>
									 <th>下单人</th>
                                     <th>下单时间</th>
									 <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
                                <tr class="ttgreen2" style="table-layout: fixed;">
									<td nowrap="nowrap">1</td>
									<td nowrap="nowrap">2</td>
									<td nowrap="nowrap">3</td>
									<td nowrap="nowrap">4</td>
									<td nowrap="nowrap">5</td>
                                    <td nowrap="nowrap">6</td>
                                    <td nowrap="nowrap">7</td>
                    			</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
 $(function(){
	 var orderTable = $("#orders").DataTable({
     //"bPaginate": true,
     "bLengthChange": true, //改变每页显示数据数量
     "bFilter": true, //过滤功能
     "bSort": true, //排序功能
     "sPaginationType": "full_numbers",
     "processing": true,
     "serverSide": true,
	 "sServerMethod":"POST",
     ajax:{
		 "url": "orders/ajax",
		 data:function(d){

		 }
	 },
     "columns": [
         { "data": "master.orderId" },
         { "data": "master.totalMoney" },
         { "data": "master.freight"},
         {
			 "data": "master.orderStatus",
			  "render":function(data,type,row,meta){
				  var stauts=row.master.orderStatus;
				  switch (stauts) {
					  case '01': return "<p class='bg-warning'>待支付</p>";
					  case '20': return "<p class='bg-default'>审核通过</p>";
					  case '21': return "<p class='bg-danger'>审核未通过</p>";
					  case '30': return '已发货';
				  }
			  }
		 },
         { "data": "master.orderCreater"},
         { "data": "master.createdTime"},
		 {
			 "data":null,
			 "targets": -1,
			 "render":function(data,type,row,meta){

				 var id =row.master.orderId;
				 var orderStatus=row.master.orderStatus;

				 var detail="<button class='btn btn-default details'>详情</button>";

				 var verify="<button class='btn btn-warning audit' >审核</button>";
				 if(orderStatus != '01'){
                     verify='';
				 }

				 var ship="<button class='btn btn-danger ship'>出货</button>";
				 if(orderStatus != '20'){
                     ship='';
				 }
             	return detail+verify+ship;
         }
		 }
     ],
		 //fnDrawCallback ajax call back
		 //fnInitComplete only fire once
		 "fnDrawCallback":function(oSettings,json){
             buttonEnventBind();
		 }
 	});

     var _templateSettings = {
         interpolate: /\{\{(.+?)\}\}/g,
     };

	 var auditTemplate=_.template("orderId:{{master.orderId}}",_templateSettings);
	 var detailsTemplate=_.template($("script.detailTemplate").html(),_templateSettings);

	 function buttonEnventBind(){
         //发货
         $(".ship").on("click",function(){
             var data = orderTable.row( $(this).parents('tr') ).data();
			 bootbox.confirm("是否发货？",function(result){
				 if(result != true ){
				 }else{
                     $.post("${rc.contextPath}/web/orders/"+data.master.orderId+"/ship",{},function(data){
                         orderTable.ajax.reload(buttonEnventBind);
                     });
				 }
			 });
         });
         //详情
         $(".details").on("click",function(){
             var data = orderTable.row( $(this).parents('tr') ).data();
			 var orderId=data.master.orderId;
             bootbox.dialog({
				 message:detailsTemplate(data),
				 title: "订单详情:"+orderId,
				 size:"large",
				 locale:"zh_CN",
                 onEscape:true,//press esc close dialog
				 buttons:{
					 success:{
						 label:"关闭",
						 className: "btn-success",
						 callback:function(){

						 }
					 }
				 }
			 });
         });
         //审核
         $(".audit").on("click",function(){
             var data = orderTable.row( $(this).parents('tr') ).data();
			 bootbox.prompt({
				 title:"请输入审核意见:",
				 value:"订单无问题，通过审核。",
				 buttons:{
					 cancel:{
						 label:'取消',
						 callback:function(){}
					 },
                     confirm:{
                         label:'审核通过',
                                 className:'btn-success',
                                 callback:function(){}
                     }
				 },
				 callback:function(result){
					if(result){
						//审核通过
                        $.post("${rc.contextPath}/web/orders/"+data.master.orderId+"/audit",{comment:result,auditResult:'20'},function(data){
                            orderTable.ajax.reload(buttonEnventBind);
                        });
					}
				 }
			 });

         });
         console.log("init orders datatables fnInitComplete envent.");
	 }
 });

</script>

<script type="text/template" class="detailTemplate">

        <div class='panel-heading font16 bold'>订单详情</div>
        <div class='panel-body orderInfo'>
            <div class='panel'>
                <div class='panel-heading font14 bold'>
                    订单信息
                </div>
                <div class='panel-body'>
                    <div class='row'>
                        <div class='col-sm-4'>订单编号：{{master.orderId}}</div>
                        <div class='col-sm-4'>下单时间：{{master.createdTime}}</div>
                        <div class='col-sm-2'>订单备注：{{master.auditComment}}</div>
                        <div class='col-sm-2'>状态：

						<% var status=master.orderStatus; if(status == '20'){ %>
							审核通过
						<% } else if (status == '21'){ %>
                            审核未通过
						<% } else if (status == '30'){ %>
                            已发货
                        <% } else { %>
                            待支付
						<% } %>


						</div>
                    </div>
                </div>
            </div>
            <div class='panel'>
                <div class='panel-heading font14 bold'>
                    收货人信息
                </div>
                <div class='panel-body'>
                    <div class='row'>
                        <div class='col-sm-8'>收货人：{{address.name}} {{address.telephone}}</div>
                        <div class='col-sm-4'>电话：{{address.phone}}</div>
                    </div>
                    <div class='row'>
                        <div class='col-sm-8'>收货地址：{{address.province}}{{address.city}}{{address.country}}{{address.content}}</div>
                        <div class='col-sm-4'>收货人电话：{{address.telephone}}</div>
                    </div>
                </div>
            </div>
            <div class='panel'>
                <div class='panel-heading font14 bold'>
                    订单详细
                </div>
                <div class='panel-body'>
                    <div class='row'>
                        <div class='col-sm-12'>
                            <table class='table table-hover table-nomargin table-bordered'>
                                <thead>
								<tr class='title'>
                                    <th>SKU名称</th>
                                    <th>吊牌价</th>
                                    <th>卖价</th>
                                    <th>购买数量</th>
                                    <th>小计</th>
                                </tr>
                                </thead>
								<tbody>
								<% for(var idx in details) {%>
									<tr>
										<td>{{details[idx].name}} </td>
                                        <td>{{details[idx].listPrice}}</td>
                                        <td>{{details[idx].salePrice}}</td>
                                        <td>{{details[idx].buyNum}}</td>
                                        <td>{{details[idx].totalMoney}}</td>
									</tr>
								<%}%>
								</tbody>
							</table>
                        </div>
                    </div>
                    <div class='row pull-right'>
                        <div class='col-sm-12 font14 total'>
                            <div class='col-sm-12 fr clearAll'>
                                <div class='row'>
                                    <div class='col-sm-8 text-right padding0'>订单总额：</div>
                                    <div class='col-sm-4 padding-left10 red bold'>￥{{master.totalMoney}}</div>
                                </div>
                                <div class='row'>
                                    <div class='col-sm-8 text-right padding0'>运费：</div>
                                    <div class='col-sm-4 padding-left10 red bold'>￥{{master.freight}}</div>
                                </div>
                                <div class='row hr'><hr></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</script>
<#include "/common/footer.ftl">