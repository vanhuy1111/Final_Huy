<%-- 
    Document   : home
    Created on : Aug 1, 2017, 5:05:50 PM
    Author     : AnhLe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo Security</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h1>Information User</h1>
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px;">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h4><b>Title</b> : ${title}</h4>	
                    <h4><b>Message</b> : ${message}</h4>
                    <h4><b>User</b> : ${email}</h4>
                    <h4><b>Name</b> : ${user.name}</h4>
                    <h4><b>Address</b> : ${user.address}</h4>
                    <h4><b>Phone</b> : ${user.phone}</h4>
                    
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px;">
                <!--                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                                    <a href="<c:url value="/home"/>">come back home</a>
                                </div>-->
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <a href="<c:url value="/logout"/>">Logout</a><br/>
                    <a href="<c:url value="/admin/admin-page"/>">Go to admin page</a>
                </div>
            </div> 
        </div>
    </body>
</html>
