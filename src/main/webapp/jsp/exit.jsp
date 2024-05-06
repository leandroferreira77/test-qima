<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<button class="outline-none flex gap-2 font-semibold items-center">
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<a title="Sign out" class="dropdown-item" onclick="document.forms['logoutForm'].submit()" onclick="showLoading();">	
		<svg stroke="currentColor" fill="none" stroke-width="2"
								viewBox="0 0 24 24" stroke-linecap="round"
								stroke-linejoin="round" height="20" width="20"
								xmlns="http://www.w3.org/2000/svg">
			<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
			<polyline points="16 17 21 12 16 7"></polyline>
			<line x1="21" y1="12" x2="9" y2="12"></line>
		</svg>
	</a>
</c:if>
</button>