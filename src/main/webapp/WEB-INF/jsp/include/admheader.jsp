<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            
            <ul class="header-links pull-right">
                    <sec:authorize access='isAuthenticated()'>                    
                    <li><sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="<c:url value="/admin/"/>"><sec:authentication property='principal.email'/></a>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_USER')">
                            <a href="<c:url value="/user/"/>"><sec:authentication property='principal.email'/></a>
                        </sec:authorize> <a href="<c:url value="/logout"/>">&nbsp;&nbsp;<i class="fa fa-user-o"></i>Logout</a></li>
                    </sec:authorize>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="<c:url value="/"/>" class="logo">
                            <img src="${pageContext.request.contextPath}/resources/img/logo1.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->
                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">                        <!-- Wishlist -->
                        

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
