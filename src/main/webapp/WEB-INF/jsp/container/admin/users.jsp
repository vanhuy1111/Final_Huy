<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" style="max-width: 768px;">
    <div class="row text-center">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <h1>Users</h1>
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
                        <th>Email</th>
                        <th>Password</th>
                        <th>Action</th>                            
                    </tr>
                    <c:forEach var="u" items="${lst}">
                        <tr>
                            <td>${u.id}</td>                                                              
                            <td>${u.email}</td>
                            <td><strong>${u.password.length()}!</strong></td>
                            <td>
                                <a href="#">Edit</a>
                                <a href="#">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
