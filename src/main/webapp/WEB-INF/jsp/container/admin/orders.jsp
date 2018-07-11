<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" style="max-width: 768px;">
    <div class="row text-center">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <h1>Orders</h1>
        </div>
    </div>
    <c:if test="${message !=null}">
        <div class="row">
            <div class="col-sm-offset-2 col-sm-8">
                <div class="alert alert-danger">
                    ${message}
                </div>
            </div>
        </div>
    </c:if>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>                            
                        <th>Date</th>
                        <th>User</th>
                        <th>Price</th>
                        <th>Action</th>                           
                    </tr>                        
                    <tr>
                        <td>1</td>
                        <td>22-03-2018</td>
                        <td>email@sample.com</td>
                        <td>999.99$</td>
                        <td><a href="#">View Details</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>27-05-2018</td>
                        <td>email2@sample.com</td>
                        <td>888.99$</td>
                        <td><a href="#">View Details</a></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>26-04-2018</td>
                        <td>email3@sample.com</td>
                        <td>678.99$</td>
                        <td><a href="#">View Details</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
