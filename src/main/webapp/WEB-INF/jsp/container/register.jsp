<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css"/>

<div id="content">
    <div class="bg-color">
        <div class="wrapper">
            <div class="container banner-info login-page">
                <div class="panel background-transparent-white">
                    <div class="panel-body">
                        <div class="row text-center logo-dec">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <h1>Register for an Account</h1>
                            </div>
                            <div class="row ">
                                <br>
                                <form action="${pageContext.request.contextPath}/register" method="post"
                                      name="registration_form" id="registration_form" modelAttribute="user">
                                    
                                    <label for="email" class="col-sm-4 control-label">E-Mail <span style="color: red">(*)</span>: </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" id="email">
                                    </div>
                                    <br><br><br><br>
                                    <label for="phone" class="col-sm-4 control-label">Mobile Phone: <span style="color: red">(*)</span> </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="text" name="phone" pattern="[0-9]{11}" id="phone">
                                    </div>
                                    <br><br><br>
                                    <label for="name" class="col-sm-4 control-label">Name: <span style="color: red">(*)</span> </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="text" id="name" name="name" required>
                                    </div>
                                    <br><br>
                                    <label for="idCard" class="col-sm-4 control-label">Identity: <span style="color: red">(*)</span> </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="text" id="idCard" name="idCard" required>
                                    </div>
                                    <br><br>
                                    <label for="address" class="col-sm-4 control-label">Address: <span style="color: red">(*)</span> </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="text" name="address" id="address" required>
                                    </div>
                                    <br><br>
                                    <label for="password" class="col-sm-4 control-label">Password: <span style="color: red">(*)</span> </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="password" required pattern=".{6,}" title="Six or more characters" id="password" name="password" placeholder="At least 6 characters" >
                                    </div>
                                    <br><br>
                                    <label for="verify" class="col-sm-4 control-label">Verify Password:  <span style="color: red">(*)</span></label>
                                    <div class="col-sm-2">
                                        <input class="register" type="password" id="confirm_password" name="verify">
                                    </div>
                                    <br><br><br>                    
                                    <label class="col-sm-4 control-label">Terms of Service: </label>
                                    <div class="col-sm-2">
                                        <input class="register" type="checkbox" name="terms" id="terms" value="yes">Accept
                                    </div>
                                    <br><br>
                                    <input class="register" type="reset" id="reset" name="reset" value="Reset">
                                    <input class="register" type="submit" id="submit" name="submit" value="Register"><br/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>