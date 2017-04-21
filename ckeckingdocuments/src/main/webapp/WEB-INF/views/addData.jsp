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
	<body ng-app="addDataApp" class="ng-clook">
		<div class="generic-container" ng-controller="addDataCtrl as ctrl">
			<form class="form-horizontal">
				<h2>Chequeo de Documentos</h2>
				<br/>
				<div class="container">
					<form class="form-horizontal">
						<div class="form-group">
    						 <label class="control-label col-sm-2" for="textEstado">Estado:</label>
    						 <div class="col-sm-2">
        						<input type="text" class="form-control" id="textEstado" ng-model="reunionOperativa.estado" 
        							placeholder="Digite el Estado" name="estado" disabled>
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textRuta">Ruta:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textRuta" ng-model="reunionOperativa.ruta" 
        							placeholder="Digite la ruta" name="aplicacion">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textAplicacion">Aplicación:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textAplicacion" ng-model="reunionOperativa.aplicacion" 
        							placeholder="Digite la aplicación" name="ruta">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textCentro">Centro:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textCentro" placeholder="Digite el centro">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textLinea">Linea:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textLinea" placeholder="Digite la linea">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textCliente">Cliente:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textCliente" placeholder="Digite el cliente">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textResponsable">Responsable:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textResponsable" placeholder="Digite el responsable">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textNombreArchivo">Nombre Archivo:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id=""textNombreArchivo"" placeholder="Digite el nombre del archivo">
      						</div>
    					</div>
    					<div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">
									Reset Form
                              </button>
                          </div>
                      </div>
    				</form>
				</div>
			</form>
		</div>
	</body>
</html>