<#include "/layout/commonLayout.ftl">

<@commonLayout title="产品"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>产品查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">产品管理</a></li>
			</ul>
		</div>
		<div class="row">
			<!-- comment search form, use datatables search instead
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 产品查询
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
										<input type="text" name="productName" class="form-control" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">
										产品描述</label>
									<div class="col-sm-9">
										<input type="text" name="prductDesc" class="form-control" value="">
									</div>
								</div>


								<div class="form-actions">
									<button type="submit" class="btn btn-primary">搜 索</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			-->
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 查询结果
							<input id="bNewProduct" class="btn btn-primary" type="button" value="新增产品" />
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="btest">
							<table id="products" class="table table-hover table-nomargin table-bordered display">
								<thead>
                   				   <tr>
                       				 <th>id</th>
                       				 <th>产品名</th>
                      				 <th>产品描述</th>
									   <th>详细描述</th>
									   <th>状态</th>
									   <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
                                <tr class="ttgreen2" style="table-layout: fixed;">
                                <td nowrap="nowrap">1</td>
                                <td nowrap="nowrap">2</td>
                                    <td nowrap="nowrap">3</td>
									<td nowrap="nowrap">4</td>
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
<div class="modal fade" id="editProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增/更新</h4>
            </div>
            <form id="productForm" method="post" class='form-horizontal' action="${rc.contextPath}/web/products">
            <div class="modal-body">
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">产品名</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control required " value="">
                        </div>
                    </div>
                <div class="form-group">
                    <label for="textfield" class="control-label col-sm-3">所属分类</label>
                    <div class="col-sm-9">
						<select name="parentCategoryId" id="parentCategoryId" class="form-control required" value="">
							<#list categories as category>
							    <option value="${category.categoryId}">${category.categoryName}</option>
							</#list>
						</select>
                    </div>
                </div>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">
                            产品描述</label>
                        <div class="col-sm-9">
                            <input type="text" id="description" name="description" class="form-control required" value="">
                        </div>
                    </div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">
							详细描述</label>
						<div class="col-sm-9">
							<input type="text" id="longDescription" name="longDescription" class="form-control required" value="">
						</div>
					</div>
				<!--
                <div class="form-group">
                    <label for="textfield" class="control-label col-sm-3">
                        所属分类</label>
                    <div class="col-sm-9">
                        <input type="text" id="parentCategoryId" name="parentCategoryId" class="form-control" value="">
                    </div>
                </div>
                -->
                <div class="form-group">
                    <label for="textfield" class="control-label col-sm-3">
                        <!--是否上架 --></label>
                    <div class="col-sm-9">
                        <input type="hidden" id="onShelf" name="onShelf" class="form-control" value="">
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

	 var productTable = $("#products").dataTable({
     //"bPaginate": true,
     "bLengthChange": true, //改变每页显示数据数量
     "bFilter": true, //过滤功能
     "bSort": true, //排序功能
     "sPaginationType": "full_numbers",
     "processing": true,
     "serverSide": true,
		 "sServerMethod":"POST",
     ajax:{
		 "url": "products/ajax",
		 data:function(d){

		 }
	 },
     "columns": [
         { "data": "id" },
         { "data": "name" },
         { "data": "description"},
         { "data": "longDescription"},
		 {
			 "data": null,
			 "render": function(data,type,row,meta){
				 var text="<p class='bg-warning'>已下架<p>";
				 if(row.onShelf){
					 text="<p class='bg-primary'>已上架<p>";
				 }
				 return text;
             },
			 "sortable":false
		 },
		 {
			 "data":null,
			 "render":function(data,type,row,meta){
				 var id =row.id;
				 var mgrSku="<a class='btn btn-default' href='javascript:void(0)' onclick='javascript:mgrSku("+id+")'>SKU</a>";
                 var putOn="";
				 var pullOff="";
				 if(row.onShelf){
                     pullOff="<a class='btn btn-warning' href='javascript:void(0)' onclick='javascript:pullOff("+id+")'>下架</a>";
				 }else{
                     putOn="<a class='btn btn-danger' href='javascript:void(0)' onclick='javascript:putOn("+id+")'>上架</a>";
				 }
                 var update="<a class='btn btn-default' href='javascript:void(0)' onclick='javascript:update("+id+")'>更新</a>";
             return mgrSku+update+putOn+pullOff;
         }
		 }
     ]
 	});

     $("#bNewProduct").on("click",function(){
         var properties=["id","name","description","longDescription","parentCategoryId","onShelf"];
         ["id","name","description","longDescription","parentCategoryId","onShelf"];
         var newData={id:-1,name:"",description:"",longDescription:"",parentCategoryId:"",onShelf:""};
         $.each(properties,function(idx,val){
             $("#"+val).val(newData[val]);
         });
         $("#editProduct").modal();
     });
     $("#productForm").validate({
		 submitHandler : function(form){
			 $(form).ajaxSubmit({
                 dataType:"json",
                 //contentType:"application/json",
                 success:function(data){
                     if(data.procCode == 200){
                         //alert("新增、更新成功！");
                         $("#editProduct").modal("hide");
                         $('#products').DataTable().ajax.reload();
                     }else{
                         alert("失败了。");
                     }

                 }
             });
		 }
	 });

 });
	function mgrSku(id){
		console.log("mgr sku "+ id);
		window.location.href="${rc.contextPath}/web/products/"+id+"/skus"
	}

	 function putOn(id){
		 console.log("put on "+ id);
		 $.post("${rc.contextPath}/web/products/"+id+"/on",{},function(data){
             $('#products').DataTable().ajax.reload();
		 });
	 }

	 function pullOff(id){
		 console.log("pull off "+ id);
         $.post("${rc.contextPath}/web/products/"+id+"/off",{},function(data){
             $('#products').DataTable().ajax.reload();
         });
	 }

	 function update(id){
		 console.log("update "+ id);
		 var properties=["id","name","description","longDescription","parentCategoryId","onShelf"];
		 $.getJSON("${rc.contextPath}/web/products/"+id,{},function(data){
			 $.each(properties,function(idx,val){
				$("#"+val).val(data[val]);
			 });
		 });
		 $("#editProduct").modal();

	 }
</script>
<#include "/common/footer.ftl">