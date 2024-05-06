<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="data" class="java.util.Date"/>
<jsp:include page="../head.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <style type="text/css">
        table td {
            text-align: left !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            oTable = $('#registros').dataTable({
            	"order": [[ 0, "desc" ]],
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
<sec:authorize access="hasRole('ADMIN')">
<div>
<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
<div class="min-h-screen md:h-screen flex flex-row">
<jsp:include page="../menu.jsp" />
<div class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
  <div class="flex flex-row py-3 px-8 md:p-8 items-center">
    <div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
      <b class="text-lg text-font-primary">Registered users control</b>
    </div>
    <jsp:include page="../exit.jsp" />
  </div>
<jsp:include page="../message.jsp"/>
	<br>
    <div class="container-fluid">
        <div class="card jh-card">
            <div class="centro">
                <div class="table-responsive">
                    <table id="registros" aria-describedby="user-management-page-heading" class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col"><span>Cod.</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Name</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>E-mail</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"><span>Status</span>
                                <i class="fa fa-sort" aria-hidden="true"></i>
                            </th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listUsers}" var="dado">
                            <tr>
                                <td>
                                    <div style='align: center'>
                                    	<a href="${contextPath}/users/edit?id=${dado.id}">${dado.id}</a>
                                    </div>
                                    
                                </td>
                                <td>
                                	<div style='align: center'>
                                		${dado.name}
                                	</div>	
                                </td>
                                <td>
                                	<div style='align: center'>
                                		${dado.username}
                                	</div>
                                </td>
                                <td>
                                    <div align="center">	
                                	<c:choose>
									    <c:when test="${dado.statusUser == '0'}">
									        <font color="red"><b>INACTIVE</b></font>
									    </c:when>    
									    <c:otherwise>
									        <font color="green"><b>ACTIVE</b></font>
									    </c:otherwise>
									</c:choose>
									</div>
                                </td>
                                <td class="text-right">
                                    <div class="btn-group">
                                    <a href="${contextPath}/users/edit?id=${dado.id}" onclick="showLoading();">
			                          <button type="submit" class="btn btn-dark btn-sm" tabindex="0">
			                                            <i class="fa fa-pencil" aria-hidden="true"></i>
			                                            <span>Update</span>
			                           </button>
			                        </a>
                                   </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="../footer.jsp"/>
</div>
</div>
</div>
</div>
</sec:authorize>
</body>
</html>