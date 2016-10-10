
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
						<a href="#" title="修改资料">
							<span><@shiro.principal/> </span>
						</a>
					</li>
					<li><span><i class="glyphicon glyphicon-edit"></i></span>
						<a id="changePassword" href="javascript:void(0)">
							<span>修改密码</span>
						</a>
					</li>
					<li><span><i class="glyphicon glyphicon-power"></i></span>
						<a href="${rc.contextPath}/logout">
							<span>安全退出</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
<script type="application/javascript">
	<!-- 修改密码 -->
	$(function(){
			$("#changePassword").on("click",function(){
                var _templateSettings = {
                    interpolate: /\{\{(.+?)\}\}/g,
                };
                var _changePassordTemplate=_.template($("script._changePassordForm").html(),_templateSettings);
                bootbox.dialog({
                    message:_changePassordTemplate({password:''}),
                    title: "修改密码",
                    size:"large",
                    locale:"zh_CN",
                    onEscape:true,//press esc close dialog
                    buttons:{
                        success:{
                            label:"保存",
                            className: "btn-success",
                            callback:function(){
                                $("#_chPwdForm").validate({
                                    submitHandler : function(form){
                                        $(form).ajaxSubmit({
                                            dataType:"json",
                                            //contentType:"application/json",
                                            success:function(data){
                                                if(data.procCode == 200){
                                                    bootbox.alert(data.message,function(){
                                                        bootbox.hideAll();
                                                    });
													return true;
                                                }else{
                                                    bootbox.alert("密码输入有误！！");
													return false;
                                                }

                                            }
                                        });
                                    }
                                });
                                $("#_chPwdForm").submit();
								return false;
                            }

                        },
						cancel:{
                            label:"关闭",
                            className: "btn-cancel",
                            callback:function(){

                            }
						}
                    }
                });
			});
    });
</script>
<script type="text/template" class="_changePassordForm">
	<form id="_chPwdForm" class="form-horizontal" role="form" method="post" action="${rc.contextPath}/password">
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="_oldPassword" class="control-label">密码:</label>
                </div>
                <div class="col-sm-10">
                  <input type="password" class="form-control required" id="_oldPassword" placeholder="原密码" name="oldPassword" value="{{password}}">
                </div>
              </div>
        <div class="form-group">
            <div class="col-sm-2">
                <label for="_password" class="control-label">新密码:</label>
            </div>
            <div class="col-sm-10">
                <input type="password" class="form-control required" id="_password" placeholder="新密码" name="password" value="{{password}}">
            </div>
        </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="_confirmPassword" class="control-label">确认密码:</label>
                </div>
                <div class="col-sm-10">
                  <input type="password" equalTo="#_password" class="form-control required" id="_confirmPassword" placeholder="再输一次" name="confirmPassword" value="{{password}}">
                </div>
              </div>
    </form>
</script>
