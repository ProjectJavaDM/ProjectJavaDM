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
  		<link href="<c:url value='css/styleApp.css' />" rel="stylesheet"></link>
	</head>
	<body ng-app="myApp" class="ng-clook">
		<div class="generic-container" ng-controller="myCtrl as ctrl">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="textEstado">
						<img src="images/logo_everis.png" width="140px" height="140px" alt="Logo everis">
					</label>
    				<div class="col-sm-7">
        				<h2>Chequeo de Documentos</h2>
      				</div>
    			</div>
				<br/><br/><br/>
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
					 	<table data-toggle="table" class="table table-hover" >
						 	<thead class="color_everis">
						 		<tr>
						 			<th>
						 				<a href="" ng-click="orderByField='id'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					ID
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='ruta'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Ruta
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='estado'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Estado
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='aplicacion'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Aplicación
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='centro'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Centro
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='linea'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Linea
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='cliente'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Cliente
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='responsable'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Responsable
						 				</a>
						 			</th>
						 			<th>
						 				<a href="" ng-click="orderByField='nombreArchivo'; reverseSort = !reverseSort" class="tabla_thead_titles">
						 					Nombre Archivo
						 				</a>
						 			</th>
						 		</tr>
						 	</thead>
						 	<tbody>
						 		<tr ng-repeat="ro in reunionesOperativas | orderBy:orderByField:reverseSort"
						 			ng-class='{document_not_found: !ro.estado, document_found: ro.estado}'>
						 			<td>{{ro.id}}</td>
						 			<td>{{ro.ruta}}</td>
						 			<td>{{ro.estado}}</td>
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