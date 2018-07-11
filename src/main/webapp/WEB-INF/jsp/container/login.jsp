<%-- 
    Document   : login
    Created on : Aug 7, 2017, 3:52:48 PM
    Author     : AnhLe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
    <body>
        <div class="container" style="max-width: 768px;">
            <br><br><br><br>
            <c:if test="${message !=null}">
                <div class="row">
                    <div class="col-sm-offset-2 col-sm-8">
                        <div class="alert alert-danger">
                            ${message}
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
            <div id="content">
                <div class="bg-color">
                    <div class="wrapper">
                        <div class="container banner-info login-page">
                            <div class="panel background-transparent-white">
                                <div class="panel-body">
                                    <div class="row text-center logo-dec">
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <h1>Login</h1>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <form class="login-form logo-dec" action="<c:url value='j_spring_security_check' />" method='POST'>
                                            <div class="form-group">
                                                <label for="inputEmail">Email</label>
                                                <input type="email" name="email" class="form-control" id="inputEmail" 
                                                       placeholder="Email">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword">Password</label>
                                                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
                                            </div>
                                            <div class="form-group text-center">
                                                <button type="submit" class="btn btn-default">Sign in</button>
                                            </div> 
                                            <input type="hidden" name="${_csrf.parameterName}"
                                                   value="${_csrf.token}" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
    </body>
</html>
