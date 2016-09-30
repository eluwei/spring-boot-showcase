<#include "/layout/commonLayout.ftl">

<@commonLayout title="授权管理">

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>授权查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">授权管理</a></li>
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
                       				 <th>编号</th>
                       				 <th>授权关键字</th>
                      				 <th>运费</th>
									 <th>订单状态</th>
									 <th>下单人</th>
                                     <th>下单时间</th>
									 <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
		           					<#list listPermission as p>
		                                <tr class="ttgreen2" style="table-layout: fixed;">
											<td nowrap="nowrap">${p.id}</td>
											<td nowrap="nowrap">${p.licenseKey}</td>
											<td nowrap="nowrap"></td>
											<td nowrap="nowrap"></td>
											<td nowrap="nowrap"></td>
		                                    <td nowrap="nowrap"></td>
		                                    <td nowrap="nowrap">
		                                    	<a href="../permission/queryShiroPermissioById/${p.id}">修改</a>
		                                    	<a href="javascript:void(0)" onclick="deletePermission(${p.id})">删除</a>
		                                    </td>
		                    			</tr>
		                    		</#list>
								</tbody>
							</table>
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
<#include "/common/footer.ftl">
</@commonLayout>