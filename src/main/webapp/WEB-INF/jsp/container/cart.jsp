<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section class="content section-padding">
    <div class="container">
        <div class="row" style="background: #FFF">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <h2 style="text-align: center; color: darkred; padding: 20px">Your Shopping Cart</h2>
            </div>
        </div>
        <div class="row" style="background: #FFF">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <c:if test="${orderEntity!=null}" >
                    <c:if test="${orderEntity.listOrderDetail!=null && fn:length(orderEntity.listOrderDetail)>0}" >
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Detail</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="orderDetail" items="${orderEntity.listOrderDetail}">
                                    <tr>
                                        <td style="text-align: center; width:150px">
                                            <img src="${pageContext.request.contextPath}/resources/images/${orderDetail.getProduct().getImage()}" width="100%" height="150px"/></td>
                                        <td>${orderDetail.getProduct().getProductName()}</td>
                                        <td>${orderDetail.getProduct().getProductDetail()}</td>
                                        <td style="color: darkred;">$${orderDetail.getProduct().getPrice()}</td>
                                        <td style="width: 25%">
                                            <form action = "${pageContext.request.contextPath}/update/${orderDetail.product.productId}" method="post">
                                                <input type="text" name="quantity" style="padding-left: 5px" value=${orderDetail.quantity}>
                                                <input type="hidden" name ="productId" value=${orderDetail.product.productId}>
                                                <input type="hidden" name = "action" value="update">
                                                <input type="submit" class="btn btn-success" value = "Update"></input>
                                            </form>
                                        </td>
                                        <td style="width: 80px">
                                            <button class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath}/delete/${orderDetail.product.productId}'">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div style="text-align: right">
                            <p><span style="color: darkred;font-weight: bold;">Total Amount: </span>$${orderEntity.totalPrice}</p>
                        </div>
                        <div style="padding-bottom: 10px">
                            <button class="btn btn-default" 
                                    onclick="location.href = '${pageContext.request.contextPath}/product'">Continue Shopping</button>

                            <button class="btn btn-primary" 
                                    onclick="location.href = '${pageContext.request.contextPath}/checkout'">Check Out</button>     
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${orderEntity==null}" >
                    <h4 id="h4">Your cart empty!<br/> Add more products to show <a id="here" href="<c:url value="/product"/>">here</a>.</h4>
                    </c:if>
            </div>
        </div>
    </div>
</section>