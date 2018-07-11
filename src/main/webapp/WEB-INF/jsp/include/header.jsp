<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
    <header id="main-header">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand fs-logo" href="${pageContext.request.contextPath}/home"><span class="logo-dec">Shop One</span></a>

                    <div class="fs-search">
                        <form action="${pageContext.request.contextPath}/search" method="post">
                            <input class="fs-stxt" type="text" name="searchText" placeholder="Search Product" maxlength="50">
                            <button type="submit" class="search-button"><i class="ficon f-search"></i></button>
                            <div class="fs-sresult" style="display : block !important">
                                <div class="fs-sremain">
                                    <ul></ul>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<c:url value="/home"/>">Home</a></li>
<!--                        <li><a href="<c:url value="/product"/>">Product</a></li>-->
                        <li><a href="<c:url value="/about"/>">About</a></li>
                        <li><a href="<c:url value="/cart"/>">Cart</a></li>
                            <sec:authorize access='!isAuthenticated()'>
                            <li><a href="<c:url value="/login"/>">Login</a></li>
                            <li><a href="<c:url value="/register"/>">Sign up</a></li>
                            </sec:authorize>
                            <sec:authorize access='isAuthenticated()'>                    
                            <li><sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <a href="<c:url value="/admin/admin-page"/>"><sec:authentication property='principal.email'/></a>
                                </sec:authorize>
                                <sec:authorize access="hasRole('ROLE_USER')">
                                    <a href="<c:url value="/user/user-page"/>"><sec:authentication property='principal.email'/></a>
                                </sec:authorize> <a href="<c:url value="/logout"/>">&nbsp;&nbsp;<i class="fa fa-user-o"></i>Logout</a></li>
                            </sec:authorize>
                    </ul>
                </div>
            </div>

        </nav>                  
    </header>
</div>