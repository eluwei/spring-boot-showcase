<#macro commonLayout title charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>${title}</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/bootstrap.css">
<!-- jQuery UI -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/jquery-ui/jquery-ui.min.css">
    <!-- dataTables -->
    <link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/datatable/TableTools.css">
<!-- datepicker -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/datepicker/datepicker.css">
    <!-- ztree -->
    <link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/ztree/zTreeStyle.css">
<!-- Theme CSS -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/style.css">
<!-- Color CSS -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/themes.css">
<!-- Overwrite CSS -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/common.css">

<!-- jQuery -->
<script src="${rc.contextPath}/flat/js/jquery.min.js"></script>
<!-- Nice Scroll -->
<script src="${rc.contextPath}/flat/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
<!-- plupload -->
<script src="${rc.contextPath}/flat/js/plugins/plupload/plupload.full.min.js"></script>
<!-- jQuery UI -->
<script src="${rc.contextPath}/flat/js/plugins/jquery-ui/jquery-ui.js"></script>
<!-- date CSS -->
<link rel="stylesheet" href="${rc.contextPath}/flat/css/plugins/datepicker/datepicker.css">
<!-- Bootstrap -->
<script src="${rc.contextPath}/flat/js/bootstrap.js"></script>
<!-- slimScroll -->
<script src="${rc.contextPath}/flat/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Bootbox -->
<script src="${rc.contextPath}/flat/js/plugins/bootbox/jquery.bootbox.js"></script>
<!-- jquery.form -->
<script src="${rc.contextPath}/flat/js/plugins/form/jquery.form.min.js"></script>
<!-- Validation -->
<script src="${rc.contextPath}/flat/js/plugins/validation/jquery.validate.min.js"></script>
<script src="${rc.contextPath}/flat/js/plugins/validation/additional-methods.min.js"></script>
<script src="${rc.contextPath}/flat/js/plugins/validation/messages_zh.js"></script>

   <!-- New DataTables -->
    <script src="${rc.contextPath}/flat/js/plugins/momentjs/jquery.moment.min.js"></script>
    <script src="${rc.contextPath}/flat/js/plugins/momentjs/moment-range.min.js"></script>
    <!-- underscorejs -->
    <script src="${rc.contextPath}/flat/js/plugins/underscore/underscore-min.js"></script>

    <script src="${rc.contextPath}/flat/js/plugins/datatables/jquery.dataTables.min.js"></script>
    <!--<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
    <script src="${rc.contextPath}/flat/js/plugins/datatables/extensions/dataTables.tableTools.min.js"></script>
    <script src="${rc.contextPath}/flat/js/plugins/datatables/extensions/dataTables.fixedColumns.min.js"></script>
    <script src="${rc.contextPath}/flat/js/plugins/datatables/extensions/dataTables.fixedHeader.min.js"></script>
    <script src="${rc.contextPath}/flat/js/plugins/datatables/extensions/dataTables.scroller.min.js"></script>
<!-- Theme framework -->
<script src="${rc.contextPath}/flat/js/widget.min.js"></script>
<!-- Theme scripts -->
<script src="${rc.contextPath}/flat/js/application.min.js"></script>
<!-- Just for demonstration -->
<script src="${rc.contextPath}/flat/js/demonstration.min.js"></script>
<!-- date -->
<script src="${rc.contextPath}/flat/js/plugins/my97datepicker/WdatePicker.js"></script>
<script src="${rc.contextPath}/flat/js/plugins/datepicker/bootstrap-datepicker.js" charset="UTF-8"></script>
<script src="${rc.contextPath}/flat/js/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"  charset= "UTF-8"></script>
    <script src="${rc.contextPath}/flat/js/plugins/ztree/jquery.ztree.all-3.5.min.js"  charset= "UTF-8"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${rc.contextPath}/flat/js/html5shiv.min.js"></script>
  <script src="${rc.contextPath}/flat/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<#include "/common/header.ftl">
<#include "/common/left.ftl">
<#nested/>

</body>
</html>
</#macro>