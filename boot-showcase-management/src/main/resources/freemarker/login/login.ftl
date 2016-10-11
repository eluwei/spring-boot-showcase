<!DOCTYPE html>
<html>

<#include "/layout/loginLayout.ftl">

<@loginLayout title="登录"/>

<body class='login'>
	<div class="wrapper">
		<div class="login-body">
			<h2>登录LINA</h2>
			
			<form action="${rc.contextPath}/doLogin" method='post' class='form-validate' id="test">
				<#if errorMsg??>
				<span class="help-block has-error">${errorMsg}</span>
				</#if>
				<div class="form-group">
				    <!--用邮件控件的样式渲染一个用户名文本框-->
					<div class="email controls">
						<input type="text" name='username' placeholder="用户名" class='form-control'>
					</div>
				</div>
				<div class="form-group">
				    <!--用密码控件的样式来渲染一个密码密码框-->
					<div class="pw controls">
						<input type="password" name="password" placeholder="密码" class='form-control'>
					</div>
				</div>
				<div class="form-group">
				    <!--验证码框-->
					<div class="code controls">
					<input type="text" placeholder="验证码" class="form-control" id="kaptchaCode" name="kaptchaCode">
					    <!--发送/kaptchaImage请求来获得一个画出的随机数-->
						<img alt="图片无法显示" src="${rc.contextPath}/kaptchaImage" id="kaptcha"/>						
						
					</div>
				</div>
				<div class="submit">
					<div class="remember">						
						<label for="remember"><input type="checkbox" id="rememberMe"></label>&nbsp;记住密码
					</div>
					<input type="submit" value="进入系统" class='btn btn-primary'>
				</div>
			</form>
			<div class="forget">
				<a href="#">
					<span>忘记密码?</span>
				</a>
			</div>
		</div>
	</div>
	
	
	<script>
	
		
		//在页面上点击图片后会重新生成该图片并展示
		$(function() {
			$("#kaptcha").click(
					function() {
						$(this).attr(
								'src',
								'${rc.contextPath}/web/kaptchaImage?'
										+ Math.floor(Math.random() * 100))
								.fadeIn();
						$('#kaptchaCode').val('');
					});
			});
			
			
	</script>
	
</body>
</html>