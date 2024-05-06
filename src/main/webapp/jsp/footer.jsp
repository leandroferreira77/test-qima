<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="data" class="java.util.Date"/>
    <div class="footer" align="center">
        <p>Copyright © <fmt:formatDate value="${data}" type="both" pattern="yyyy" dateStyle="full"/> | Developed by L.J.F | V-0.0.1</p>
    </div>
