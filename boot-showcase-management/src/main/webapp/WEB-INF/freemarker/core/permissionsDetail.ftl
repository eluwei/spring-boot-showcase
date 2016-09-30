<#include "/layout/commonLayout.ftl">

<@commonLayout title="授权修改"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>授权修改</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">授权修改</a></li>
				<li><a href="../toPermissionPage">返回列表</a></li>
			</ul>
		</div>
		<div class="row">
        <div class='panel-body orderInfo'>
            <div class='panel'>
                <div class='panel-body'>
                    <div class='row' style="margin: 0 auto;">
			                        编号：<input type="text" value="${detail.id}"> <br><br><br>
						
						授权关键字：<input type="text" name="licenseKey" value="${detail.licenseKey}"/>
                    </div>
                </div>
            </div>
            
        </div>
			
		</div>
	</div>
</div>
<script type="text/javascript">
	function deletePermission(Id){
		$.get("../permission/deleteShiroPermission/"+Id+"",{},function(data){
            window.location.reload();
        });
	}
</script>
