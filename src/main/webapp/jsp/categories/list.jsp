<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <script type="text/javascript">
        $(document).ready(function () {
            oTable = $('#registros').dataTable({
                "bPaginate": true,
                "bJQueryUI": false,
                "sPaginationType": "full_numbers"
            });
        });
    </script>
    <script>
        function setaDadosModal(valor) {
            document.getElementById('id').value = valor;
        }
    </script>
    <script type="text/javascript">
        hideLoading();
    </script>
</head>
<body>
<div>
<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
<div class="min-h-screen md:h-screen flex flex-row">
<jsp:include page="../menu.jsp" />
<div class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
  <div class="flex flex-row py-3 px-8 md:p-8 items-center">
    <div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
      <b class="text-lg text-font-primary">Registered categories control</b>
    </div>
    <jsp:include page="../exit.jsp" />
  </div>
<jsp:include page="../message.jsp"/>  
<sec:authorize access="hasRole('ADMIN') or hasRole('USER')">
  <div class="overflow-x-auto">
   <div class="w-full" style="min-width:1100px">
   <div class="mt-5 w-full flex flex-col items-center justify-center">
   					<a href="${contextPath}/categories/add" onclick="showLoading();">
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
                            <th align="left"><span>Cod</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th align="left"><span>Category Name</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <sec:authorize access="hasRole('ADMIN')">
                            	<th scope="col"></th>
                            </sec:authorize>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listCategory}" var="dado">
		            		  	<tr>
		            		  		<td align="justify">
		            		  		  	${dado.id}	
		            		  		</td>
		            				<td align="justify">	
		            					${dado.name}
		            				</td>
		            				<sec:authorize access="hasRole('ADMIN')">
						                  <td class="text-right">
			                                <div style="max-width:75px;text-align:center" class="flex-1 text-gray-800 font-semibold mr-6 ">
			                                    <a href="${contextPath}/categories/edit?id=${dado.id}" onclick="showLoading();">
			                                        <button type="submit" class="btn btn-dark btn-sm" tabindex="0">
			                                            <i class="fa fa-pencil" aria-hidden="true"></i>
			                                            <span>Update</span>
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
            </div>
          </div>      
</sec:authorize>
<jsp:include page="../footer.jsp"/>
</div>
</div>
</div>
</div>
</body>
</html>