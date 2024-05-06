<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>QIMA-Test</title>
   
	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/qima.css">
	<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.ico">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	 <!-- ==========================
       MENSAGEM - SUCESSO ${message}
   =========================== -->

		<c:if test="${message != null}">
		    <script type="text/javascript">
		        $(function () {
		            var sucesso = '${message}';
		            toastr.success(sucesso);
		        });
		    </script>
		</c:if>

	<!-- ==========================
	    	MENSAGEM - ERRO 
	    =========================== -->
		 <c:if test="${error != null}">
		 	<script type="text/javascript">
				 $(function() {
					 var erro = '${error}';
					 toastr.error(erro);
				 });
		 	</script>
		 </c:if>
</head>
<body>
<div class="alert alert-info" align="center">
        <p><b>QIMAtech_FullStack_Interview | Developed by Leando Ferreira</b></p>
        <br>
        <p>
	        <a href="https://github.com/leandroferreira77/test-qima" target="_blank">
	        	<b>Access Code in GitHub</b>
	        </a>
        </p>
</div>
<div class="container">
                        <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 authentication-container">
                            <div class="authentication-box well"><!---->
                                 <form method="POST" action="${contextPath}/auth" class="form-signin" onsubmit="showLoading();">
                                    <a>
                                        <img class="authentication-logo" alt="" src="${contextPath}/resources/images/qima-logo.png">
                                    </a><!---->
                                    <!---->
                                    <div class="form-group" form-error=""><!---->
                                        <label for="username-email">E-mail</label>
                                        <input type="e" class="form-control" name="username" placeholder="Enter your e-mail address" required="required">
                                        <!---->
                                    </div>
                                    <div class="form-group" form-error="">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" name="password" placeholder="Enter your password" required="required" >
                                        <!---->
                                    </div>
                                    <div class="form-group">
                                    	<button class="btn btn-primary signin-button" type="submit">
                                    	<span translate="">Sign in</span>
                                    	</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        </div>
</div>
</body>
</html>