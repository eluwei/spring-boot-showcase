<#include "/layout/commonLayout.ftl">

<@commonLayout title="后台用户管理"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>用户查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">用户管理</a></li>
			</ul>
		</div>
		<div class="row">

			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 查询结果
							<input id="bNewAdminUser" class="btn btn-primary" type="button" value="新增用户" />
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> 
								<i class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="btest">
							<table id="adminUsers" class="table table-hover table-nomargin table-bordered display">
								<thead>
                   				   <tr>
                       				 <th>id</th>
                       				 <th>用户名</th>
									 <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
                                <tr class="ttgreen2" style="table-layout: fixed;">
                                <td nowrap="nowrap">1</td>
                                <td nowrap="nowrap">who are u?</td>
								<td nowrap="nowrap">crud</td>
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
<div class="modal fade" id="editAdminUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增/更新</h4>
            </div>
            <form id="productForm" method="post" class='form-horizontal' action="${rc.contextPath}/admin/users">
            <div class="modal-body">
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">登录名</label>
                        <div class="col-sm-9">
                            <input type="text" id="userName" name="userName" class="form-control required " value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textfield" class="control-label col-sm-3">
                            密码</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" name="password" class="form-control required" value="">
                        </div>
                    </div>
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-3">
							确认密码</label>
						<div class="col-sm-9">
							<input type="password" id="confirmPassword" name="confirmPassword" class="form-control required" value="">
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

	 var adminUsersTable = $("#adminUsers").dataTable({
     //"bPaginate": true,
     "bLengthChange": true, //改变每页显示数据数量
     "bFilter": true, //过滤功能
     "bSort": true, //排序功能
     "sPaginationType": "full_numbers",
     "processing": true,
     "serverSide": true,
		 "sServerMethod":"POST",
     ajax:{
		 "url": "${rc.contextPath}/admin/users/ajax",
		 data:function(d){

		 }
	 },
     "columns": [
         { "data": "id" },
         { "data": "userName" },
		 {
			 "data":null,
			 "render":function(data,type,row,meta){
				 var id=row.id;
                 var updatePassword="<a class='btn btn-default' href='javascript:void(0)' onclick='javascript:update("+id+")'>改密</a>";
             return updatePassword;
         }
		 }
     ]
 	});

     $("#bNewAdminUser").on("click",function(){
         var properties=["id","userName","password","confirmPassword"];
         var newData={id:-1,userName:"",password:"",confirmPassword:""};
         $.each(properties,function(idx,val){
             $("#"+val).val(newData[val]);
         });
         $("#editAdminUser").modal();
     });
     $("#productForm").validate({
		 submitHandler : function(form){
			 $(form).ajaxSubmit({
                 dataType:"json",
                 //contentType:"application/json",
                 success:function(data){
                     if(data.procCode == 200){
                         //alert("新增、更新成功！");
                         $("#editAdminUser").modal("hide");
                         $('#adminUsers').DataTable().ajax.reload();
                     }else{
                         bootbox.alert(data.message);
                     }

                 }
             });
		 }
	 });

 });
	 function update(id){
		 console.log("update "+ id);
		 var properties=["id","userName"];
		 $.getJSON("${rc.contextPath}/admin/users/"+id,{},function(data){
			 $.each(properties,function(idx,val){
				$("#"+val).val(data[val]);
			 });
		 });
		 $("#editAdminUser").modal();

	 }
</script>
<#include "/common/footer.ftl">