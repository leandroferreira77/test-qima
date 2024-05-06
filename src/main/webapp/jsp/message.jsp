<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ==========================
       MESSAGE - SUCCESS ${mensagem}
   =========================== -->

<c:if test="${mensagem != null}">
    <script type="text/javascript">
        $(function () {
            var sucesso = '${mensagem}';
            toastr.success(sucesso);
        });
    </script>
</c:if>

<!-- ==========================
    	MESSAGE - ERROR 
    =========================== -->
	 <c:if test="${erro != null}">
	 	<script type="text/javascript">
			 $(function() {
				 var erro = '${erro}';
				 toastr.error(erro);
			 });
	 	</script>
	 </c:if>
