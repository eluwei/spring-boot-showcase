<#include "/layout/commonLayout.ftl">
<@commonLayout title="资源列表"/>
<#import "/common/commonpage.ftl" as myPage/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>资源查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">管理</a></li>
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
						<div class="order_query">
                            <@myPage.page url="${rc.contextPath}/shiroResources/moreResources" searchParam="f_otherParam" callback="f_showTbody"/>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>

 $(function(){
	 searchPage('${rc.contextPath}/shiroResources/moreResources','1','f_otherParam','f_showTbody');
 });

 function f_otherParam(paramobj){
    // paramobj.name = $("#name").val();
     return true;
 }
 
 function f_showTbody(arg){
	 setPage(page.paginator.page,page.paginator.totalPages,page.paginator.totalCount);
 }
</script>

<#include "/common/footer.ftl">