<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="data" class="java.util.Date" />

<!DOCTYPE html>
<html lang="pt-br">
<head>
<jsp:include page="../head.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<c:if test="${exists != null}">
					<script type="text/javascript">
							 $(function() {
								 var erro = '${exists}';
								 toastr.error(erro);
							 });
					</script>
</c:if>
<c:if test="${newCategory != null}">
					<script type="text/javascript">
							 $(function() {
								 var sucesso = '${newCategory}';
								 toastr.success(sucesso);
							 });
					</script>
</c:if>
<title>Add New Category</title>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <![endif]-->
</head>
<body>
	<div>
		<div
			class="page-container flex h-full md:min-h-screen flex-col bg-page ">
			<div class="min-h-screen md:h-screen flex flex-row">
				<jsp:include page="../message.jsp" />
				<jsp:include page="../menu.jsp" />
				<div
					class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
					<div class="flex flex-row py-3 px-8 md:p-8 items-center">
						<div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
							<b class="text-lg text-font-primary">Add Category</b>
						</div>
					</div>
					
					<form:form name="category" method="POST" modelAttribute="categoryForm" class="flex md:flex-col flex-1  bg-white" onsubmit="showLoading();">
						<div class="flex flex-col w-full">
							<div class="p-8 bg-white rounded-lg shadow-sm">
								<div class="flex-1">
									<div class="flex justify-between">
										<div class="">
											<h1 class="text-lg font-bold mb-4">1. Category data</h1>
										</div>
									</div>
									<div>
										<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
											<spring:bind path="name">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Category Name</label>
												</div>
												<div class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
									                  	<path d="M80 368H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm0-320H16A16 16 0 0 0 0 64v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16V64a16 16 0 0 0 -16-16zm0 160H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm416 176H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16zm0-320H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0 -16-16zm0 160H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16z"/>
									                </svg>
													<form:input type="text" placeholder="Enter the category name" 
													class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="name" required="required" oninput="handleInput(event)"/>
                            						<form:errors path="name"/>
												</div>
											</div>
											</spring:bind>
										</div>
									</div>
								</div>
							</div>
							<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
								<div class="flex flex-col flex-1">
								<a href="javascript:history.back();" onclick="showLoading();">
								 <button
									class="w-44 bg-primary flex flex items-center justify-center py-4 rounded-full text-white font-bold outline-none"
									style="opacity: 1; pointer-events: all" type="button">
									<span>Back</span>
								 </button>
								</a>
								</div>
								<div class="flex flex-col flex-1">
								<button
									class="w-44 bg-blue-light flex items-center justify-center py-4 rounded-full text-white font-bold outline-none"
									style="opacity: 1; pointer-events: all" type="submit">
									<span>Save</span>
								</button>	
								</div>
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
