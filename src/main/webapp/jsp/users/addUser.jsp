<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="data" class="java.util.Date" />

<!DOCTYPE html>
<html lang="pt-br">
<head>
<jsp:include page="../head.jsp" />


    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <title>Create User</title>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>


    <![endif]-->

</head>
<body>
	<div>
		<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
			<div class="min-h-screen md:h-screen flex flex-row">
				
				<jsp:include page="../menu.jsp" />
				<div class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
					<div class="flex flex-row py-3 px-8 md:p-8 items-center">
						<div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
							<b class="text-lg text-font-primary">Add User</b>
						</div>
					</div>
					<jsp:include page="../message.jsp"/>
					<form:form name="login" method="POST" modelAttribute="userForm" class="flex md:flex-col flex-1  bg-white" onsubmit="showLoading();">
						<div class="flex flex-col w-full">
							<div class="p-8 bg-white rounded-lg shadow-sm">
								<div class="flex-1">
									<div class="flex justify-between">
										<div class="">
											<h1 class="text-lg font-bold mb-4">1. User data</h1>
										</div>
									</div>
									<div>
										<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
											<spring:bind path="name">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Full Name</label>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<svg stroke="currentColor" fill="none" stroke-width="2"
														viewBox="0 0 24 24" stroke-linecap="round"
														stroke-linejoin="round" height="1em" width="1em"
														xmlns="http://www.w3.org/2000/svg">
          <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
														<circle cx="12" cy="7" r="4"></circle></svg>
													<form:input type="text" placeholder="Digite o Nome completo" class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="name" required="true" oninput="handleInput(event)"/>
                            						<form:errors path="name"/>
												</div>
											</div>
											</spring:bind>
											 <spring:bind path="username">
											<div class="flex flex-col flex-1">
												<div class="flex items-center gap-3">
													<div class="mb-2">
														<label class="text-base font-semibold text-gray-500 ">E-mail</label>
													</div>
													<div class="flex items-center justify-center gap-2">
														<svg stroke="currentColor" fill="none" stroke-width="2"
															viewBox="0 0 24 24" stroke-linecap="round"
															stroke-linejoin="round" class="text-sm text-yellow-600"
															height="1em" width="1em"
															xmlns="http://www.w3.org/2000/svg">
        
													</div>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md ">
													<svg stroke="currentColor" fill="none" stroke-width="2"
														viewBox="0 0 24 24" stroke-linecap="round"
														stroke-linejoin="round" height="1em" width="1em"
														xmlns="http://www.w3.org/2000/svg">
        <circle cx="12" cy="12" r="4"></circle>
														<path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path>
      </svg>
      												<form:input type="email" class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="username" required="true"/>
						                            <form:errors path="username"/>
												</div>
											</div>
											</spring:bind>
											<spring:bind path="statusUser">
											<div class="flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Status</label>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center px-4 py-3 rounded-md ">
													<svg stroke="currentColor" fill="none" stroke-width="2"
														viewBox="0 0 24 24" stroke-linecap="round"
														stroke-linejoin="round" height="1em" width="1em"
														xmlns="http://www.w3.org/2000/svg">
          <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
														<circle cx="12" cy="7" r="4"></circle></svg>
													<form:select class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined" path="statusUser" required="true"
				                                         oninvalid="setCustomValidity('Selecione um Status para prosseguir')"
				                                         onchange="try{setCustomValidity('')}catch(e){}">
						                                <form:option value="">Selecionar</form:option>
						                                <form:option value="1">ACTIVE</form:option>
						                                <form:option value="0">INACTIVE</form:option>
						                                <form:errors path="statusUser"/>
						                            </form:select>
												</div>
											</div>
											</spring:bind>
										</div>
										<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
											
											<spring:bind path="password">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Password</label>
												</div>
												<div class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
												   <form:errors path="password"/>
                            					   <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-gray-600" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
											       <path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"></path></svg>
											       <form:input type="text" placeholder="Digite a senha de acesso" 
													class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="password" required="required" />
											        </svg>
												</div>
											</div>
											</spring:bind>
										</div>
									</div>
								</div>
							</div>
							<div
								class="mt-5 w-full flex flex-col items-center justify-center">
								<button
									class="w-44 bg-blue-light flex items-center justify-center py-4 rounded-full text-white font-bold outline-none"
									style="opacity: 1; pointer-events: all" type="submit">
									<span>Save</span>
								</button>
							</div>
						</div>
					 </form:form>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>
