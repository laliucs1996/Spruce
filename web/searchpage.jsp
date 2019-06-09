<%-- 
    Document   : searchpage
    Created on : Apr 21, 2018, 5:42:42 PM
    Author     : Stanl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spruce</title>
    </head>
    <body>
        <h1>
            MOVIES:
        </h1>
            <c:forEach items="${requestScope.movieSearchResults}" var="result">
                <div><c:out value="${result.title}"></c:out></div>
            </c:forEach>
        <h1>
            TV:
        </h1>
            <c:forEach items="${requestScope.tvSearchResults}" var="result">
                <div><c:out value="${result.name}"></c:out></div>
            </c:forEach>
    </body>
</html>
