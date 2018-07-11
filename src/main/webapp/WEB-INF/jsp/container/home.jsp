<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <%@include file="admin/admhome.jsp" %>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_ADMIN')">
    <%@include file="myhome.jsp" %>
</sec:authorize>