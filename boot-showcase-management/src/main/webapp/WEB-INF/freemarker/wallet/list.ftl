<#include "/layout/commonLayout.ftl">

<@commonLayout title="首页"/>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>卡包查询</h1>
			</div>
			<div class="pull-right">
				
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li><a href="#" class="breadcrumbs_home">您的位置</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="">卡包管理</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3>
							<i class="fa fa-edit"></i> 卡包查询
						</h3>
						<div class="actions">
							<a href="#" class="btn btn-mini content-slideUp"> <i
								class="fa fa-angle-down"></i>
							</a>
						</div>
					</div>
					<div class="box-content">
						<div class="col-md-6 col-md-offset-3">
							<form id="searchMemberForm" method="GET" class='form-horizontal'>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">卡包ID</label>
									<div class="col-sm-9">
										<input type="text" name="searchMemberName" class="form-control" value="XX">
									</div>
								</div>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">
										卡包密码</label>
									<div class="col-sm-9">
										<input type="text" name="searchMemberId" class="form-control" value="XX">
									</div>
								</div>
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-3">
										卡包创建日期 </label>
									<div class="col-sm-9">
										<input type="text" name="searchMemberIdNumber" class="form-control" value="#">
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
							<table class="table table-hover table-nomargin table-bordered">
								<thead>
                   				   <tr>
                       				 <th>序号</th>
                       				 <th>昵称</th>
                      				 <th>用户ID</th>
                       				 <th>最后使用日期</th>
                      				 <th>密码最后使用日期</th>
                       				 <th>创建日期</th>
                       				 <@shiro.hasRole name="dept_admin">
                       				 <th>状态</th>
                       				 </@shiro.hasRole>
                       				 <@shiro.hasPermission name="admin_read">
                       				 <th>支付密码</th>
                       				 </@shiro.hasPermission>
                       				 <th>操作</th>
                  				  </tr>
                				</thead>
								<tbody>
								
					<#if walletList?exists>
                       <#assign xh=0/>
                         <#list walletList as wallet>
                             <#assign xh=xh+1/>
                                <tr class="ttgreen2" style="table-layout: fixed;">
                                <td nowrap="nowrap">${(xh)!''}</td>
                                <td nowrap="nowrap">${(wallet.nickName)!''}</td>
                                <td nowrap="nowrap">${(wallet.userId)!''}</td>
                                <td nowrap="nowrap">${(wallet.lastUsedAt)?string("yyyy-MM-dd hh:mm:ss")!''}</td>
                                <td nowrap="nowrap">${(wallet.passwordLastModifiedAt)?string("yyyy-MM-dd hh:mm:ss")!''}</td>
                                <td nowrap="nowrap">${(wallet.createdAt)?string("yyyy-MM-dd hh:mm:ss")!''}</td>
                                <@shiro.hasRole name="dept_admin">
                                <td nowrap="nowrap">${(wallet.status)!''}</td>
                                </@shiro.hasRole>
                                <@shiro.hasPermission name="admin_read">
                                <td nowrap="nowrap">${(wallet.payPassword)!''}</td>
                                </@shiro.hasPermission>
                                <td><@shiro.hasPermission name="operator_read">
										    <a>读操作 </a> |
								    </@shiro.hasPermission>
									<@shiro.hasPermission name="operator_write">
										    <a>写操作 </a> 
								    </@shiro.hasPermission>
										</td>
                
                    </tr>
                     </#list>
                        </#if>
									
									
								</tbody>
							</table>
						</div>
						
						<#import "/common/pager.ftl" as mypage>
       					<@mypage.pager pagerBean=pager toURL="${rc.contextPath}/web/index" />
					
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#include "/common/footer.ftl">