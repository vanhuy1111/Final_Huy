<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<style>
    th{background-color:#B9BABC; color:darkred}
    td{font-weight: bolder;}
    label,input{margin-bottom: 10px;}
    form label{text-align: right;}
</style>
<section class="content section-padding">
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <div class="container">
        <div class="row" style="background: #FFF">
            <div class="col-xs-12 col-sm-12 col-md-12" 
                 style="text-align: center; color: darkred">
                <h2>Check Out</h2>
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
                                </tr>
                                <c:forEach var="orderDetail" items="${orderEntity.listOrderDetail}">
                                    <tr>
                                        <td style="text-align: center; width:150px">
                                            <img src="${pageContext.request.contextPath}/resources/images/${orderDetail.getProduct().getImage()}" width="100%" height="150px"/></td>
                                        <td>${orderDetail.getProduct().getProductName()}</td>
                                        <td>${orderDetail.getProduct().getProductDetail()}</td>
                                        <td style="color: darkred;">$${orderDetail.getProduct().getPrice()}</td>
                                        <td>${orderDetail.quantity}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div style="text-align: right">
                            <p><span style="color: darkred;font-weight: bold;">Total Amount: </span>$${orderEntity.totalPrice}</p>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 remove-padding-bootstrap" style="padding-bottom: 20px">
                            <h3>Customer Information</h3>
                            <f:form action="checkout" method="post" modelAttribute="customer">
                                <div class="form-group">
                                    <label>Name <span style="color: red">(*)</span>: </label>
                                    <input type="text" class="form-control" id="name" name="customerName" value="${user.name}" required>
                                </div>
                                <div class="form-group">
                                    <label>Id Card <span style="color: red">(*)</span>: </label>
                                    <input type="text" value="${user.idCard}" maxlength="11" class="form-control" pattern="[0-9]{9,15}" name="idCard" required >
                                </div>
                                <div class="form-group">
                                    <label>Phone <span style="color: red">(*)</span>: </label>
                                    <input type="text" value="${user.phone}"  maxlength="11" class="form-control" pattern="[0-9]{10,12}" id="phone" name="phone"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email<span style="color: red">(*)</span>: </label>
                                    <input class="form-control" value="${user.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" type="text" 
                                           name="email" id="email" required >
                                </div>
                                <div class="form-group">
                                    <label>Address <span style="color: red">(*)</span>: </label>
                                    <input class="form-control" value="${user.address}" required type="text" 
                                           name="address" placeholder="Enter a valid email address">
                                </div>
                                <button class="btn btn-default" type="button" onclick="location.href = '${pageContext.request.contextPath}/product'">Continue Shopping</button>
                                <button class="btn btn-info" type="reset">Reset</button>
                                <input class="btn btn-success" type="submit" id="submit" name="submit" value="Submit">
                            </f:form>
                        </div>
                    </c:if>
                    <c:if test="${orderEntity.listOrderDetail==null || fn:length(orderEntity.listOrderDetail)<=0}" >
                        <h4 id="h4">Your cart empty!<br/> Add more products to show <a id="here" href="<c:url value="/product"/>">here</a>.</h4>
                        </c:if>
                    </c:if>
                    <c:if test="${orderEntity==null}" >
                    <h4 id="h4">Your cart empty!<br/> Add more products to show <a id="here" href="<c:url value="/product"/>">here</a>.</h4>
                    </c:if>
            </div>
        </div>
    </div>
</section>
