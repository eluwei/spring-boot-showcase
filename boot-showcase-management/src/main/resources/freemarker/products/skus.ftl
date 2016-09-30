<#include "/layout/commonLayout.ftl">

<@commonLayout title="SKU"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>SKU管理</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">SKU管理</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> SKU管理
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> <i
								class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="col-md-6 col-md-offset-3">
							<form id="searchMemberForm" method="GET" class='form-horizontal' action="#">
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">产品名</label>
									<div class="col-sm-9">
										${product.name}
									</div>
								</div>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">
										产品描述</label>
									<div class="col-sm-9">
										${product.description}
									</div>
								</div>


								<div class="form-actions">

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> SKU
							<input id="bNewSku" class="btn btn-primary" type="button" value="新增SKU" />
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="btest">
							<table id="skuTable" class="table table-hover table-nomargin table-bordered display">
								<thead>
                   				   <tr>
                       				 	<th>id</th>
                       				 	<th>SKU名称</th>
                      				 	<th>吊牌价</th>
									    <th>卖价</th>
                                        <th>库存</th>
									    <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
                                <tr class="ttgreen2" style="table-layout: fixed;">
                                	<td nowrap="nowrap">1</td>
                                	<td nowrap="nowrap">2</td>
									<td nowrap="nowrap">3</td>
                                    <td nowrap="nowrap">1</td>
                                    <td nowrap="nowrap">3</td>
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


<!-- Modal -->
<div class="modal fade" id="editSku" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增/更新</h4>
            </div>
            <form id="editSkuForm" method="post" class='form-horizontal' action="${rc.contextPath}/web/products/${productId}/sku">
            <div class="modal-body">
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">SKU名</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control required " value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">
                            吊牌价</label>
                        <div class="col-sm-9">
                            <input type="text" id="listPrice" name="listPrice" class="form-control required number" value="">
                        </div>
                    </div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">
							卖价</label>
						<div class="col-sm-9">
							<input type="text" id="salePrice" name="salePrice" class="form-control required number" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">
							库存</label>
						<div class="col-sm-9">
							<input type="text" id="stockLevel" name="stockLevel" class="form-control required digits" value="">
						</div>
					</div>
                <div class="form-group">
                    <label for="textfield" class="control-label col-sm-3">
                        </label>
                    <div class="col-sm-9">
                        <input type="hidden" id="productId" name="productId" class="form-control" value="">
                        <input type="hidden" id="id" name="id" class="form-control" value="">
                    </div>
                </div>
                    <div class="form-actions">

                    </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="id" name="id" class="form-control" value="">
                <button type="cancel" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
 $(function(){
	 $("#skuTable").dataTable({
     "bPaginate": false,
     "bLengthChange": false, //改变每页显示数据数量
     "bFilter": false, //过滤功能
     "bSort": false, //排序功能
     "sPaginationType": "full_numbers",
     "ajax":{
		 "url": "skus/ajax",
		 "dataSrc": ""
	 },
     "columns": [
         { "data": "id" },
         { "data": "name" },
         { "data": "listPrice"},
         { "data": "salePrice"},
         { "data": "stockLevel"},
         {
			 "data": null,
			 "render": function(data,type,row,meta){
				 var id=row.id;
                 var deleteSku="<a class='btn btn-danger' href='javascript:void(0)' onclick='javascript:deleteSku("+id+")'>删除</a>";
				 var updateSku="<a class='btn btn-default' href='javascript:void(0)' onclick='javascript:updateSku("+id+")'>更新</a>";
				 return deleteSku+updateSku;
             }
		 }
     ]
 	});
     $("#bNewSku").on("click",function(){
         updateSku();
     });
     $("#editSkuForm").validate({
         submitHandler : function(form){
             $(form).ajaxSubmit({
                 dataType:"json",
                 //contentType:"application/json",
                 success:function(data){
                     $("#editSku").modal("hide");
                     reload();
                 }
             });
         }
     });
 });

 function reload(){
     $('#skuTable').DataTable().ajax.reload();
 }
 function deleteSku(id){
     $.post("${rc.contextPath}/web/products/${productId}/sku/"+id+"/delete",{},function(data){
         reload();
     });
 }
 function updateSku(id){
     //undefined id means new sku
     if(id == undefined){
         $("#editSkuForm")[0].reset();
         $("#id").val(-1);
     }else{
         $.getJSON("${rc.contextPath}/web/products/${productId}/sku/"+id,{},function(data){
             $.each(data,function(key,val){
                 $("#"+key).val(val);
             });
         });
     }
     $("#editSku").modal();
     reload();
 }
</script>
<#include "/common/footer.ftl">