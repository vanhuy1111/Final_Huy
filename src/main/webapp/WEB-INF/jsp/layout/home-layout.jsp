<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><tiles:insertAttribute name="title" ignore="true" /></title>  
        <!-- Style -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300|Raleway:300,400,900,700italic,700,300,600">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jquery.bxslider.css"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/webjars/font-awesome/4.7.0/css/font-awesome.min.css"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/animate.css"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>"/>

        <!-- java script -->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.easing.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"/>" type="text/javascript" ></script>
        <script src="<c:url value="/resources/js/jquery.bxslider.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/registerconfirm.js"/>"></script>
    </head>
    <body>
         <sec:authorize access="hasRole('ROLE_ADMIN')">
            <tiles:insertAttribute name="admheader" />
        </sec:authorize>
        <sec:authorize access="!hasRole('ROLE_ADMIN')">
            <tiles:insertAttribute name="admheader" />
        </sec:authorize>
        
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="body" />
        <div style="clear:both">
            <tiles:insertAttribute name="footer" />
        </div>  
    </body>
</html>
