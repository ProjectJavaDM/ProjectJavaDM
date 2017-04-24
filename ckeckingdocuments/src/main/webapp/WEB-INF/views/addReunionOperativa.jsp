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
	<body ng-app="addDataApp" class="ng-clook">
		<div class="generic-container" ng-controller="addDataCtrl as ctrl">
			<input type="hidden" id="id" name="id">
			
			
			<form class="form-horizontal">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="textEstado">
							<img src="images/logo_everis.png" width="140px" height="140px" alt="Logo everis">
						</label>
	    				<div class="col-sm-7">
	        				<h2 class="color_letra_everis">Chequeo de Documento - Agregar Información</h2>
	      				</div>
	    			</div>
	    		</form>
				<br/>
				<div class="container">
					<form class="form-horizontal">
						<div class="form-group">
    						 <label class="control-label col-sm-2" for="textEstado">Estado:</label>
    						 <div class="col-sm-2">
        						<input type="text" class="form-control" id="textEstado" ng-model="reunionOperativa.estado" 
        							placeholder="Digite el Estado" name="estado" disabled required>
        						 <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="estado.$error.required">El estado es requerido</span>
								</div>
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textRuta">Ruta:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textRuta" ng-model="reunionOperativa.ruta" 
        							placeholder="Digite la ruta" name="aplicacion" required>
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
        						<input type="text" class="form-control" id="textCentro" ng-model="reunionOperativa.centro" 
        							placeholder="Digite el centro" name="centro">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textLinea">Linea:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textLinea" ng-model="reunionOperativa.linea" 
        							placeholder="Digite la linea" name="linea">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textCliente">Cliente:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textCliente" ng-model="reunionOperativa.cliente"  
        							placeholder="Digite el cliente" name="cliente">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textResponsable">Responsable:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textResponsable" ng-model="reunionOperativa.responsable" 
        							placeholder="Digite el responsable" name="responsable">
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textNombreArchivo">Nombre Archivo:</label>
    						 <div class="col-sm-10">
        						<input type="text" class="form-control" id="textNombreArchivo" ng-model="reunionOperativa.nombreArchivo"  
        							placeholder="Digite el nombre del archivo" name="nombreArchivo" required>
        						<div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="nombreArchivo.$error.required">El Nombre de archivo es requerido</span>
								</div>
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textPeriocidad">Periocidad:</label>
    						 <div class="col-sm-10" class="radio">
    						 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="1">Semanal</label>
    						 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="2">Quincenal</label>
    						 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="3">Mensual</label>
      						</div>
    					</div>
    					<div class="form-group">
    						 <label class="control-label col-sm-2" for="textComentario">Comentario:</label>
    						 <div class="col-sm-10">
        						<textarea class="form-control" rows="5" id="textComentario" ng-model="reunionOperativa.comentario" 
        							placeholder="Digite el comentario" name="comentario"></textarea>
      						</div>
    					</div>
    					<div class="row">
							<div class="form-actions floatRight">
                            	<input type="submit"  value="{{!reunionOperativa.id ? 'Agregar' : 'Actualizar'}}" class="btn btn-primary btn-sm" 
									ng-disabled="" ng-click="addReunionOperativa()">
                              	<button type="button" ng-click="resetForm()" class="btn btn-warning btn-sm" ng-disabled="">
									Reiniciar Formulario
                              	</button>
                              	<button type="button" class="btn btn-primary pull-right" ng-click="volver()">
									Volver
								</button>
                          	</div>
						</div>
    				</form>
				</div>
			</form>
		</div>
	</body>
</html>