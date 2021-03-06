<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <form class="navbar-form navbar-left" action="/search?searchTerm=searchTerm.value" method="GET">
                <div class="form-group">
                    <input type="text" class="form-control" name="searchTerm" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${ sessionScope.user != null}">
                <li><a href="/ads/create"><span class="glyphicon glyphicon-tag"></span> Create A New Ad</a></li>
                <li><a href="/profile"><span class="glyphicon glyphicon-user"></span> View Profile</a></li>
                <li><a href="/logout">Logout <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a>
                </li>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <li><a href="/register">Register <span class="glyphicon glyphicon-list-alt"
                                                       aria-hidden="true"></span></a>
                </li>
                <li><a href="/login">Login <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
            </c:if>
        </ul>
    </div>
</nav>
