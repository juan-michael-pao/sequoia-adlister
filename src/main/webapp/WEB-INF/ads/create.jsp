<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h1 style="text-align: center">Create a new Ad</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <form action="/ads/create" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" value="${sessionScope.oldInput.title == null ? "": sessionScope.oldInput.title}">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" type="text">${sessionScope.oldInput.description == null ? "": sessionScope.oldInput.description}</textarea>
                </div>

                <div class="form-group">
                    <input type="checkbox" name="category" value="1">Electronics<br>
                    <input type="checkbox" name="category" value="2"> Clothing<br>
                    <input type="checkbox" name="category" value="3"> Furniture<br>
                    <input type="checkbox" name="category" value="service"> Service<br>
                    <input type="checkbox" name="category" value="babies_toys"> Babies_toys<br>
                    <input type="checkbox" name="category" value="appliances"> Appliances<br>
                    <input type="checkbox" name="category" value="garden_patio"> Garden_patio<br>
                    <input type="checkbox" name="category" value="automotive"> Automotive<br>
                    <input type="checkbox" name="category" value="farm_animals"> Farm_animals<br>
                    <input type="checkbox" name="category" value="home"> Home<br>
                    <input type="checkbox" name="category" value="other"> Other<br>
                </div>
                <input type="submit" class="btn btn-block btn-primary">
            </form>
        </div>
    </div>


</div>
</body>
</html>
