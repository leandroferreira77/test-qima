<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.ico">
    <title>QIMA-Menu</title>
    <style>
    :root {
        --login-background: #252836;
        --background: #f5f5f5;
        --menu: #fff;
        --fontPrimary: #666;
        --accent: #6e44ff;
        --primary: #00ac5a;
        --primary-opacity: #00ac5a47;
        --primary-light: #4fe9a01f;
        --warn: #df9500;
        --warn-opacity: #df950040;
        --dangerous: #f51720;
        --dangerous-opacity: #f5172040;
        --blue-light: #422774;
        --blue-opacity: #00c6b240;
        --secondary: #222a47;
        --gray-medium: #9ca3af;
    }
    </style>
    <link rel="stylesheet" href="${contextPath}/resources/css/4e635069e979666b.css" data-n-g="">
    <link rel="stylesheet" href="${contextPath}/resources/css/loading.css">
    <script src="${contextPath}/resources/js/loading.js"></script>
</head>
<body>
  <div>
    <div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
      <div class="min-h-screen md:h-screen flex flex-row">
      <div class="w-64 shadow-xl bg-menu md:translate-x-0 fixed md:static h-full z-10 left-0 transform transition-all duration-300 ease-in-out -translate-x-full">
      <div class="px-8">
      <div class="flex flex-row mt-6 items-center justify-center text-font-primary">
      <div class="flex flex-col">
        <img src="${contextPath}/resources/images/qima-logo.png"  width="80" height="81" /> 
        <label class="font-semibold mt-5">Hello, <font color="#000"><b><c:out value="${sessionScope.userScopeSession.name}" /></b></font></label>
      </div>
    </div>
    </div>
    <div class="w-full mt-8">
      <div>
      <ul>
        <li class="px-8 h-12 hover:text-primary transition-all duration-100 ease-in-out flex flex-row items-center relative text-base transparent text-font-primary">
        <a href="${contextPath}/home" class="flex flex-row items-center w-full h-full" onclick="showLoading();">
          <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                  <path d="M496 384H64V80c0-8.8-7.2-16-16-16H16C7.2 64 0 71.2 0 80v336c0 17.7 14.3 32 32 32h464c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zM464 96H345.9c-21.4 0-32.1 25.9-17 41l32.4 32.4L288 242.8l-73.4-73.4c-12.5-12.5-32.8-12.5-45.3 0l-68.7 68.7c-6.3 6.3-6.3 16.4 0 22.6l22.6 22.6c6.3 6.3 16.4 6.3 22.6 0L192 237.3l73.4 73.4c12.5 12.5 32.8 12.5 45.3 0l96-96 32.4 32.4c15.1 15.1 41 4.4 41-17V112c0-8.8-7.2-16-16-16z"/>
                  </svg>
        <span class="ml-4">Dashboard</span></a>
         </li>
         <sec:authorize access="hasRole('ADMIN')">
         <li class="px-8 h-12 hover:text-primary transition-all duration-100 ease-in-out flex flex-row items-center relative text-base transparent text-font-primary">
          <a href="${contextPath}/users/list" class="flex flex-row items-center w-full h-full" onclick="showLoading();">
            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
          	<path d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z"/></svg>
          <span class="ml-4">Users</span>
         </a>
         </li>
         </sec:authorize>
        <li class="px-8 h-12 hover:text-primary transition-all duration-100 ease-in-out flex flex-row items-center relative text-base transparent text-font-primary">
   			<div class="w-1 absolute bg-primary h-full left-0"></div>
          	<a href="${contextPath}/categories/list" class="flex flex-row items-center w-full h-full" onclick="showLoading();">
	            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                  	<path d="M80 368H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm0-320H16A16 16 0 0 0 0 64v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16V64a16 16 0 0 0 -16-16zm0 160H16a16 16 0 0 0 -16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0 -16-16zm416 176H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16zm0-320H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0 -16-16zm0 160H176a16 16 0 0 0 -16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0 -16-16z"/>
                </svg>
            <span class="ml-4">Categories</span>
          	</a>
        </li>      
        <li class="px-8 h-12 hover:text-primary transition-all duration-100 ease-in-out flex flex-row items-center relative text-base transparent text-font-primary">
   			<div class="w-1 absolute bg-primary h-full left-0"></div>
          	<a href="${contextPath}/products/list" class="flex flex-row items-center w-full h-full" onclick="showLoading();">
	            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
	            	<path d="M326.3 218.8c0 20.5-16.7 37.2-37.2 37.2h-70.3v-74.4h70.3c20.5 0 37.2 16.7 37.2 37.2zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-128.1-37.2c0-47.9-38.9-86.8-86.8-86.8H169.2v248h49.6v-74.4h70.3c47.9 0 86.8-38.9 86.8-86.8z"/>
	            </svg>
            <span class="ml-4">Products</span>
          	</a>
        </li>
        </ul>
       </div>
       <div>
      </ul>
      </div>
    </div>
    </div>
</div>
</div>
</div>
</body>
</html>
