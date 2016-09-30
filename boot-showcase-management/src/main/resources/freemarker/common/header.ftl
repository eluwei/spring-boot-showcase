
<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">中台系统</a>
			<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="左侧边栏">
				<i class="fa fa-bars"></i>
			</a>
			<ul class='main-nav'>
	
			</ul>
			<div class="user">
				<ul class="icon-nav">
					<li><span><i class="glyphicon glyphicon-user"></i></span>
						<a href="#">						    					
							<span><@shiro.principal/> </span>
						</a>
					</li>
					<li><span><i class="glyphicon glyphicon-edit"></i></span>
						<a href="${rc.contextPath}/member/userInfoRedirect">
							<span>修改资料</span>
						</a>
					</li>
					<li><span><i class="glyphicon glyphicon-power"></i></span>
						<a href="${rc.contextPath}/web/logout">
							<span>安全退出</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>