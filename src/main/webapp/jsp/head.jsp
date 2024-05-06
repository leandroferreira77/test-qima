<!-- Versao dia 07/04/2024 17:50 Author L.J.F Versao 0.0.36-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${contextPath}"/>
<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico" type="image/x-icon"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- CSS da aplicacao -->
<style>
    :root {
        --login-background: #252836;
        --background: #f5f5f5;
        --menu: #fff;
        --fontPrimary: #666;
        --accent: #6e44ff;
        --primary: #00ac5a;
        --primary-light: #4fe9a01f;
        --warn: #df9500;
        --warn-opacity: #df950040;
        --dangerous: #f51720;
        --dangerous-opacity: #f5172040;
        --blue-light: #00c6b2;
        --blue-opacity: #2d3192;
        --secondary: #222a47;
        --gray-medium: #9ca3af;
    }
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/4e635069e979666b.css" data-n-g="">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/loading.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/1.2.1/css/searchPanes.dataTables.min.css"/>
<link rel="stylesheet" href="https://vitalets.github.io/bootstrap-datepicker/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">


<!-- Libs JS da aplicacao -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/select/1.3.2/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/searchpanes/1.2.1/js/dataTables.searchPanes.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/additional-methods.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://igorescobar.github.io/jQuery-Mask-Plugin/js/jquery.mask.min.js"></script>  
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/loading.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    function handleInput(e) {
        var ss = e.target.selectionStart;
        var se = e.target.selectionEnd;
        e.target.value = e.target.value.toUpperCase();
        e.target.selectionStart = ss;
        e.target.selectionEnd = se;
    }
</script>
<!-- para start do loading com imagem -->
<div id="id01" class="loading-modal" style="display: none;"></div>
<c:if test="${message != null}">
		    <script type="text/javascript">
		        $(function () {
		            var sucesso = '${message}';
		            toastr.success(sucesso);
		        });
		    </script>
</c:if>