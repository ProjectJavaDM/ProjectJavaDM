<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Chequeo de documentos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
		
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  	  		
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		
  		<script src="<c:url value='js/app.js'/>"></script>
	</head>
	<body ng-app="myApp" class="ng-clook">
		<div class="generic-container" ng-controller="myCtrl as ctrl">
			<form name="myForm" class="form-horizontal">
				<h2>Chequeo de Documentos</h2>
				<br/>
				<ul class="nav nav-pills">
					<li class="active">
						<a data-toggle="pill" href="#semanal" ng-click="changePeriocidad(1)">
							Semanal
						</a>
					</li>
					<li>
						<a data-toggle="pill" href="#quincenal" ng-click="changePeriocidad(2)">
							quincenal
						</a>
					</li>
					<li>
						<a data-toggle="pill" href="#mensual" ng-click="changePeriocidad(3)">
							Mensual
						</a>
					</li>
				</ul>
				
				<div class="tab-content panel panel-default">
					 <div id="semanal" class="tab-pane fade in active">
					 	<div class="panel-heading">
					 		<span class="lead">
					 			Información de Reuniones Operativas - Semanal
					 		</span>
					 	</div>
					 </div>
					 <div id="quincenal" class="tab-pane fade">
					 	<div class="panel-heading">
					 		<span class="lead">
					 			Información de Reuniones Operativas - Quincenal
					 		</span>
					 	</div>
					 </div>
					 <div id="mensual" class="tab-pane fade">
					 	<div class="panel-heading">
					 		<span class="lead">
					 			Información de Reuniones Operativas - Mensual
					 		</span>
					 	</div>
					 </div>
					 <div class="tablecontainer">
					 	<table class="table table-hover">
						 	<thead>
						 		<tr>
						 			<th>Estado</th>
						 			<th>Ruta</th>
						 			<th>Aplicación</th>
						 			<th>Centro</th>
						 			<th>Linea</th>
						 			<th>Cliente</th>
						 			<th>Responsable</th>
						 			<th>Nombre_Archivo</th>
						 		</tr>
						 	</thead>
						 	<tbody>
						 		<tr ng-repeat="ro in reunionesOperativas">
						 			<td>{{ro.estado}}</td>
						 			<td>{{ro.ruta}}</td>
						 			<td>{{ro.aplicacion}}</td>
						 			<td>{{ro.centro}}</td>
						 			<td>{{ro.linea}}</td>
						 			<td>{{ro.cliente}}</td>
						 			<td>{{ro.responsable}}</td>
						 			<td>{{ro.nombreArchivo}}</td>
						 		</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br/><br/>
				<button type="button" class="btn btn-primary pull-right" ng-click="checkingDocuments()">
					Chequear Información
				</button>
			</form>
		</div>
	</body>
</html>