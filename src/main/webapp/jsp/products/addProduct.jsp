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
<title>Add New Product</title>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <![endif]-->
    
</head>
<!-- Modal Create Category -->
						<div class="modal fade" id="modal-category" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
						    <div class="modal-dialog modal-lg" role="document">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <form id="categoryForm" name="category" method="POST" action="${contextPath}/products/addCategory" enctype="multipart/form-data" onsubmit="showLoading();">
						                <input type="hidden" name="newCategory" value="NEW">
						                <div class="modal-body">
						                    <h3 class="modal-title" id="modalLabel">Add New Category</h3>
											<div class="card jh-card">
												<div class="row">
													<div class="form-group  col-sm-6">
								                        <label for="name" class="control-label">Name</label> 
								                        <input type="text" class="form-control js-date" id="name" oninput="handleInput(event)" 
								                         name="name" required="required" placeholder="Enter the category name" />
								                    </div>
												</div>
											</div>
						                </div>
						                <div class="modal-footer">
						                    <button type="submit" class="btn btn-dark">Save</button>
						                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						                </div>
						            </form>
						        </div>
						    </div>
						</div>
<body>
	
	<div>
		<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
			<div class="min-h-screen md:h-screen flex flex-row">
				<jsp:include page="../menu.jsp" />
				<div
					class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
					<div class="flex flex-row py-3 px-8 md:p-8 items-center">
						<div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
							<b class="text-lg text-font-primary">Add product</b>
						</div>
						<jsp:include page="../exit.jsp" />
					</div>
					<form:form name="product" method="POST" modelAttribute="productForm" class="flex md:flex-col flex-1  bg-white" onsubmit="showLoading();">
					<jsp:include page="../message.jsp"/>
						<div class="flex flex-col w-full">
							<div class="p-8 bg-white rounded-lg shadow-sm">
								<div class="flex-1">
									<div class="flex justify-between">
										<div class="">
											<h1 class="text-lg font-bold mb-4">1. Product data</h1>
										</div>
									</div>
									<div>
										<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
											<spring:bind path="name">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Name</label>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
										            	<path d="M326.3 218.8c0 20.5-16.7 37.2-37.2 37.2h-70.3v-74.4h70.3c20.5 0 37.2 16.7 37.2 37.2zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-128.1-37.2c0-47.9-38.9-86.8-86.8-86.8H169.2v248h49.6v-74.4h70.3c47.9 0 86.8-38.9 86.8-86.8z"/>
										            </svg>
													<form:input type="text" placeholder="Enter the product name" 
													class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="name" required="required" oninput="handleInput(event)"/>
                            						<form:errors path="name"/>
												</div>
											</div>
											</spring:bind>
											
											<spring:bind path="price">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Price $</label>
												</div>
												<div class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
										            	<path d="M326.3 218.8c0 20.5-16.7 37.2-37.2 37.2h-70.3v-74.4h70.3c20.5 0 37.2 16.7 37.2 37.2zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-128.1-37.2c0-47.9-38.9-86.8-86.8-86.8H169.2v248h49.6v-74.4h70.3c47.9 0 86.8-38.9 86.8-86.8z"/>
										            </svg>
													<form:input type="number" step="0.01" name="vlUber" placeholder="Enter the price" 
													class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined  " path="price" />
                            						<form:errors path="price"/>
												</div>
											</div>
											</spring:bind>
											
											<spring:bind path="available">
											<div class="flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Available</label>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center px-4 py-3 rounded-md ">
													<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
										            	<path d="M326.3 218.8c0 20.5-16.7 37.2-37.2 37.2h-70.3v-74.4h70.3c20.5 0 37.2 16.7 37.2 37.2zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-128.1-37.2c0-47.9-38.9-86.8-86.8-86.8H169.2v248h49.6v-74.4h70.3c47.9 0 86.8-38.9 86.8-86.8z"/>
										            </svg>
													<form:select class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined" path="available" required="true"
				                                         oninvalid="setCustomValidity('Select a Available')"
				                                         onchange="try{setCustomValidity('')}catch(e){}">
						                                <form:option value="">Select Available</form:option>
						                                <form:option value="1">ACTIVE</form:option>
						                                <form:option value="0">INACTIVE</form:option>
						                                <form:errors path="available"/>
						                            </form:select>
												</div>
											</div>
											</spring:bind>
											
											
										</div>
										<div class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-5">
										
										<spring:bind path="description">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Description</label>
												</div>
												<div class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<form:textarea path="description" rows="4" cols="50" required="required" placeholder="Enter the description" />
										            <form:errors path="description"/>
												</div>
											</div>
											</spring:bind>
											
											<spring:bind path="category">
											<div class="flex flex-col flex-1">
												<div class="mb-2">
													<label class="text-base font-semibold text-gray-500 ">Category
													<a data-toggle="modal" data-target="#modal-category">
														<i class="fa fa-plus-circle" aria-hidden="true"></i>
													</a> 
													</label>
												</div>
												<div
													class="flex flex-row bg-transparent border border-solid border-gray-400 items-center  py-3 px-4 rounded-md  ">
													<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
									                  	<path d="M80 368H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm0-320H16A16 16 0 0 0 0 64v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16V64a16 16 0 0 0 -16-16zm0 160H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm416 176H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16zm0-320H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0 -16-16zm0 160H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16z"/>
									                </svg>
										            <form:select path="category" class="bg-transparent ml-3 align-middle h-full outline-none flex-1 w-full undefined" 
						                                         oninvalid="setCustomValidity('Select an Category')"
						                                         onchange="try{setCustomValidity('')}catch(e){}" required="required">
						                                <option value="">Select Category</option>
						                                <c:forEach items="${categories}" var="category">
						                                    <option value="${category.id}">${category.name}</option>
						                                </c:forEach>
						                            </form:select>
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
