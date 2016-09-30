<#include "/layout/commonLayout.ftl">

<@commonLayout title="分类管理"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>分类管理</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">分类管理</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 分类管理
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> <i
								class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="col-md-3">
                            <a href="#" id="createRootCategory" class="btn btn-primary btn-sm" title="新增根分类">
								<span class="glyphicon glyphicon-plus"></span>
							</a>
                            <a href="#" id="createSubCategory" class="btn btn-primary btn-sm" title="新增子分类">
								<span class="glyphicon glyphicon-move"></span>
							</a>
                            <a href="#" id="deleteCategory" class="btn btn-primary btn-sm" title="删除分类">
								<span class="glyphicon glyphicon-remove"></span>
							</a>
                            <ul id="treeDemo" class="ztree"></ul>
						</div>
						<div class="col-md-6">
							<form id="categoryForm" method="POST" class='form-horizontal' action="${rc.contextPath}/web/categories/update">
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">分类名</label>
									<div class="col-sm-9">
                                        <input type="text" id="categoryName" name="categoryName" class="form-control required" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">
										分类描述</label>
									<div class="col-sm-9">
                                        <input type="text" id="descriptions" name="descriptions" class="form-control required" value="">
									</div>
								</div>


								<div class="form-actions">
                                    <input id="parentCategoryId" name="parentCategoryId" type="hidden" value=""/>
                                    <input id="categoryId" name="categoryId" type="hidden" value=""/>
									<input id="op" name="op" value="u" type="hidden"/>
                                    <button type="cancel" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">保存</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


<!-- Modal -->

<script>
$(function () {
    var ctx="${rc.contextPath}";
    var setting = {
        data: {
			key:{
				name: "categoryName"
			},
            simpleData: {
                enable: true,
				idKey:"categoryId",
				pIdKey:"parentCategoryId"
            }
        },
        callback: {
            onClick: onClick
        }

    };

    var url=ctx+"/web/categories/tree.json";
    $("#createRootCategory").on("click",function(){
		$("#categoryForm")[0].reset();
		$("#parentCategoryId").val("");
		$("#categoryId").val("");
		$("#op").val("c");
    });
	$("#createSubCategory").on("click",function(){
        $("#categoryForm")[0].reset();
		$("#parentCategoryId").val(selectedNode["categoryId"]);
        $("#categoryId").val("");
        $("#op").val("c");
	});
    $("#deleteCategory").on("click",function(){
        $("#op").val("d");
		$.post(ctx+"/web/categories/update",{categoryId:selectedNode["categoryId"],op:"d"},function(data){
            zTree.removeChildNodes(selectedNode);
			zTree.removeNode(selectedNode);
            selectedNode="";
            $("#categoryForm")[0].reset();
		});
	});
    function onClick(e, treeId, treeNode) {
        selectedNode=treeNode;
        $("#op").val("u");
		$.each(treeNode, function (key,val) {
			$("#"+key).val(val);
        })
    }
    var zTree,selectedNode;
    $.getJSON(url,function(zNodes){
        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            zTree = $.fn.zTree.getZTreeObj("treeDemo");
        });
    });
    $("#categoryForm").validate({
        submitHandler : function(form){
            $(form).ajaxSubmit({
                dataType:"json",
                //contentType:"application/json",
                success:function(data){
					var op=$("#op").val();
					if(op == 'c'){
						var pId=$("#parentCategoryId").val();
						if(pId == ''){
                            zTree.addNodes(null,-1,data);
						}else{
                            zTree.addNodes(selectedNode,-1,data);
						}
					}else if(op =='u'){
                        $.each(data,function(key,val){
                            selectedNode[key]=data[key];
                        });
                        zTree.updateNode(selectedNode);
					}
                }
            });
        }
    });
});
</script>
<#include "/common/footer.ftl">