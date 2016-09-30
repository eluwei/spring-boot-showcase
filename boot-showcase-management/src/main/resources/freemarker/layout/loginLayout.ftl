<#macro loginLayout title charset="utf-8" lang="zh-CN">
<head>
	<meta charset="utf-8">
	<title>${title}</title>

<!-- Bootstrap -->
	<link rel="stylesheet" href="${rc.contextPath}/flat/css/bootstrap.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/jquery-ui/jquery-ui.min.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/flat/css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/flat/css/themes.css">
	<!-- Overwrite CSS -->
	<link rel="stylesheet" href="${rc.contextPath}/flat/css/common.css">


	<!-- jQuery -->
	<script src="${rc.contextPath}/flat/js/jquery.min.js"></script>
	<!-- jQuery UI -->
	<script src="${rc.contextPath}/flat/js/plugins/jquery-ui/jquery-ui.js"></script>
	<!-- Bootstrap -->
	<script src="${rc.contextPath}/flat/js/bootstrap.min.js"></script>
	<!-- Bootbox -->
	<script src="${rc.contextPath}/flat/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- jquery.form -->
	<script src="${rc.contextPath}/flat/js/plugins/form/jquery.form.min.js"></script>
	<!-- Validation -->
	<script src="${rc.contextPath}/flat/js/plugins/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/flat/js/plugins/validation/additional-methods.min.js"></script>
	
	<!-- Theme framework -->
	<script src="${rc.contextPath}/flat/js/widget.min.js"></script>
	<!-- Theme scripts -->
	<script src="${rc.contextPath}/flat/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${rc.contextPath}/flat/js/demonstration.min.js"></script>

	<!--[if lte IE 9]>
		<script src="${rc.contextPath}/flat/js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->


	<!-- Favicon -->
	<link rel="shortcut icon" href="${rc.contextPath}/flat/img/favicon.ico" />

</head>

</#macro>
