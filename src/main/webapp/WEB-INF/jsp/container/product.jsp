<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="content section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 remove-padding-bootstrap">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/resources/images/galaxy-note8.png" style="width:100%;">
                        </div>
                        <div class="item ">
                            <img src="${pageContext.request.contextPath}/resources/images/Oppo.png" style="width:100%;">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/resources/images/Sony-XZ1.png" style="width:100%;">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/resources/images/banner-Laptop.jpg" style="width:100%;">
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 10px;">
            <c:forEach var="p" items="${lst}">
                <div class="col-xs-12 col-sm-3 col-md-3 product remove-padding-bootstrap">
                    <a href="${pageContext.request.contextPath}/details/${p.productId}">
                        <p style="width: 200px">
                            <img src="${pageContext.request.contextPath}/resources/images/${p.image}" width="150" height="150" alt="">
                        </p>
                        <div style="text-align: left">
                            <h3>${p.productName}</h3>
                            <strong>$${p.price}</strong>
                        </div>
                    </a>
                    <div style="background-color: #FFF; text-align: center;">
                        <a href="${pageContext.request.contextPath}/add-to-cart/${p.productId}"><button
                                class="add-to-cart-btn btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</button></a>
                    </div>
                </div>
            </c:forEach>
        </div>             
    </div>
</section>