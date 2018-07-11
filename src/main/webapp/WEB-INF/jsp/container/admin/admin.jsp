
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />
        <link type="text/css" rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/resources/css/project.css"/>" />
    </head>
    <body>
        <div class="container">
            <br><br><br>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h1> Page Admin</h1>
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px;">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h4><b>Title</b> : ${title}</h4>	
                    <h4><b>Message</b> : ${message}</h4>
                    <h4><b>Admin</b> : ${email}</h4>
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px;">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <a href="<c:url value="/logout"/>">Logout</a><br/>
                    <a href="<c:url value="/user/user-page"/>">Go to user page</a>
                </div>
            </div>
        </div>
    </body>
</html>
