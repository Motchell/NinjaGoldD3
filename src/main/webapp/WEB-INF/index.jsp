<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>${titulo}</title>
</head>
<body>
	<div class="container">
	    <h1 class="mt-5 mb-4">Ninja Gold Game</h1>
	    <h2>Tu oro: ${gold}</h2>
	    <div class="row mt-4">
	        <div class="col-sm-3">
	            <div class="card text-center">
	                <div class="card-body">
	                    <h5 class="card-title">Granja</h5>
	                    <p class="card-text">Gana 10-20 de oro</p>
	                    <form action="/play" method="post">
	                        <input type="hidden" name="place" value="farm"/>
	                        <button type="submit" class="btn btn-primary">Ir a la granja</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-3">
	            <div class="card text-center">
	                <div class="card-body">
	                    <h5 class="card-title">Cueva</h5>
	                    <p class="card-text">Gana 5-10 de oro</p>
	                    <form action="/play" method="post">
	                        <input type="hidden" name="place" value="cave"/>
	                        <button type="submit" class="btn btn-primary">Explorar cueva</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-3">
	            <div class="card text-center">
	                <div class="card-body">
	                    <h5 class="card-title">Casa</h5>
	                    <p class="card-text">Gana 2-5 de oro</p>
	                    <form action="/play" method="post">
	                        <input type="hidden" name="place" value="house"/>
	                        <button type="submit" class="btn btn-primary">Visitar casa</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-3">
	            <div class="card text-center">
	                <div class="card-body">
	                    <h5 class="card-title">Casino</h5>
	                    <p class="card-text">Gana o pierde 50 de oro</p>
	                    <form action="/play" method="post">
	                        <input type="hidden" name="place" value="casino"/>
	                        <button type="submit" class="btn btn-danger">Apostar!</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <div class="row mt-4">
	        <div class="col-12">
	            <div class="card">
	                <div class="card-header">Activities</div>
	                <div class="card-body" style="background-color: black; color: white; height: 200px; overflow-y: scroll;">
	                    <c:forEach var="activity" items="${activities}">
	                        <p>${activity}</p>
	                    </c:forEach>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	</div>
</body>
</html>