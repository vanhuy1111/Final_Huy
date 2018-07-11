<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="content section-padding">
    <div class="container">
        <div class="row" style="background: #FFF">
            <div class="col-xs-12 col-sm-4 col-md-4 product remove-padding-bootstrap" style="padding-top: 30px;">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="${pageContext.request.contextPath}/resources/images/${p.image}" alt="" width="100%" >
                    </div>

                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-6 remove-padding-bootstrap" style="margin-left: 50px;">
                <div class="product-details">
                    <h2 class="product-name" style="color: teal">${p.productName}</h2>
                    <div class="product-rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <a class="review-link" >Voted</a>
                    </div>
                    <p><h3 class="product-price">$${p.price}</h3></p>
                    <p>${p.productDescription}</p>
                    <br>
                    <div class="add-to-cart">
                        <a href="${pageContext.request.contextPath}/add-to-cart/${p.productId}"><button
                                class="add-to-cart-btn btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</button></a>
                    </div>
                    <div>
                        <h3 style="color: teal"> Product Details </h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p style="line-height: 2.5em;">${p.productDetail}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>