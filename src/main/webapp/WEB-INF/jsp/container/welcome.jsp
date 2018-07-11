<%-- 
    Document   : welcome
    Created on : Jun 26, 2018, 11:24:38 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content">
    <div class="bg-color">
        <div class="wrapper">
            <div class="container banner-info login-page">
                <div class="panel background-transparent-white">
                    <div class="panel-body">
                        <div class="row text-center logo-dec">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <h1>Welcome ${name}</h1>
                                <h3>Registration Successful</h3>
                                <br>
                                <h4> Click <a href="${pageContext.request.contextPath}/login">Here</a>  to Login </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
