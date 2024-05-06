<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="data" class="java.util.Date"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<jsp:include page="../head.jsp"/>
	<style type="text/css">
        table td {
            text-align: left !important;
        }
    </style>
    <style type="text/css">
    	.table-container {
		    overflow-x: auto; /* Enable horizontal scrolling */
		    max-width: 100%; /* Ensure the table container doesn't exceed the viewport */
		}
		
		table {
		    border-collapse: collapse;
		    width: 100%;
		}
		
		th {
		    padding: 8px;
		    text-align: left;
		}
		
		thead {
		    background-color: #f2f2f2;
		}
		
		thead th {
		    position: sticky;
		    top: 0;
		    z-index: 1; /* Ensure the header stays above the content */
		    background-color: #ffffff;
		}
    	
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#registros').DataTable({
            	"order": [[ 0, "asc" ]],
                "bPaginate": true,
                "bJQueryUI": false,
                "fixedHeader": true,
                "sPaginationType": "full_numbers"
            });
        });
    </script>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Producs</title>
</head>
<body>
<div>
<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
<div class="min-h-screen md:h-screen flex flex-row">
<jsp:include page="../menu.jsp" />
<div class="flex-1 bg-background flex flex-col overflow-x-hidden">
  <div class="flex flex-row py-3 px-8 md:p-8 items-center">
    <div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
      <b class="text-lg text-font-primary">Registered products control</b>
    </div>
    <jsp:include page="../exit.jsp" />
  </div>
<jsp:include page="../message.jsp"/>
<div class="mt-5 w-full flex flex-col items-center justify-center">
   					<a href="${contextPath}/products/add" onclick="showLoading();">
								<button
									class="w-44 bg-blue-light flex items-center justify-center py-4 rounded-full text-white font-bold outline-none"
									style="opacity: 1; pointer-events: all" type="submit">
									<span>Add</span>
								</button>
					</a>			
	</div>
	<br>
	 <div class="table-container">
    	<table id="registros" aria-describedby="user-management-page-heading" class="table table-striped" style="width:100%">
        			<thead>
                        <tr>
                        	<th scope="col"><span>Cod.</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Name</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Description</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Price</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>CategoryPath</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Available</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"></th>
                            <sec:authorize access="hasRole('ADMIN')">
                            	<th scope="col"></th>
                            </sec:authorize>
                        </thead>
				        <tbody>
				            <c:forEach items="${listProduct}" var="dado">
		            		  	<tr>
		            		  		<td>
		            		  		  <div style='align: center'>	
		            		  			${dado.id}
		            		  		  </div>	
		            		  		</td>
		            				<td>
		            				<div style='align: center'>
		            					${dado.name}
		            				</div>	
		            				</td>
		            				<td>
		            				   <div style='align: center'>	
		            				   ${dado.description}
		            				   </div>	
		            				</td>
		            				<td>
		            				  <div style='align: center'>
		            					${dado.price}
		            				  </div>	
		            				</td>
		            				<td>
		            				   <div style='align: center'>
		            				   	  <a title="Add New Category" href="${contextPath}/categories/add" onclick="showLoading();">
														<i class="fa fa-plus-circle" aria-hidden="true"></i>
										  </a>
										  <a title="View Category" href="${contextPath}/categories/edit?id=${dado.category.id}" onclick="showLoading();">
			            				  	<i class="fa fa-eye" aria-hidden="true"></i>
			            				  </a>	
		            				   	  <a title="Category list" href="${contextPath}/categories/list" onclick="showLoading();">
														<i class="fa fa-bars" aria-hidden="true"></i>
										  </a> 
										  <span>${dado.category.name}</span> 
		            				   </div>	
		            				</td>
		            				<td>
		            				   <div style='align: center'>
		            				   	<c:choose>
									    <c:when test="${dado.available == '0'}">
									        <font color="red"><b>INACTIVE</b></font>
									    </c:when>    
									    <c:otherwise>
									        <font color="green"><b>ACTIVE</b></font>
									    </c:otherwise>
										</c:choose>
		            				   </div>	
		            				</td>
						                  <td class="text-right">
			                                <div style="max-width:75px;text-align:center" class="flex-1 text-gray-800 font-semibold mr-6 ">
			                                    <a href="${contextPath}/products/edit?id=${dado.id}" onclick="showLoading();">
			                                        <button type="submit" class="btn btn-dark btn-sm" tabindex="0">
			                                            <i class="fa fa-pencil" aria-hidden="true"></i>
			                                            <span>Update</span>
			                                        </button>
			                                    </a>
			                                </div>
			                            	</td>
			                            <sec:authorize access="hasRole('ADMIN')">	
			                            	<td class="text-right">
			                                <div style="max-width:75px;text-align:center" class="flex-1 text-gray-800 font-semibold mr-6 ">
			                                    <a href="${contextPath}/products/delete?id=${dado.id}" onclick="return confirm('Do you want to delete this product ${dado.name} ?'); showLoading();">
			                                        <button type="submit" class="btn btn-dark btn-sm" tabindex="0">
			                                            <i class="fa fa-trash" aria-hidden="true"></i>
			                                            <span>Delete</span>
			                                        </button>
			                                    </a>
			                                </div>
			                            	</td>	
					                    </sec:authorize> 
		            			</tr>
	            		  </c:forEach>
				        </tbody>
    	</table>
	</div>
<jsp:include page="../footer.jsp"/>
</div>
</div>
</div>
</div>
</body>
</html>