
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <img src="resources/images/galaxy-note8.png" style="width:100%;">
                        </div>
                        <div class="item ">
                            <img src="resources/images/Oppo.png" style="width:100%;">
                        </div>
                        <div class="item">
                            <img src="resources/images/Sony-XZ1.png" style="width:100%;">
                        </div>
                        <div class="item">
                            <img src="resources/images/banner-Laptop.jpg" style="width:100%;">
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
        <div class="row" style="background: #FFF">
            <div class="col-xs-12 col-sm-12 col-md-12" style="padding-top: 20px;">
                <div class="alert alert-info">
                    <h2>${message}</h2>
                </div>
            </div>
        </div>
    </div>
</section>