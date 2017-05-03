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
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textRuta" ng-model="reunionOperativa.ruta" 
      					placeholder="Digite la ruta" name="aplicacion" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textRuta" ng-model="reunionOperativa.ruta" 
      					placeholder="Digite la ruta" name="aplicacion" disabled required>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textAplicacion">Aplicación:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textAplicacion" ng-model="reunionOperativa.aplicacion" 
      					placeholder="Digite la aplicación" name="ruta" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textAplicacion" ng-model="reunionOperativa.aplicacion" 
      					placeholder="Digite la aplicación" name="ruta" disabled required>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textCentro">Centro:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textCentro" ng-model="reunionOperativa.centro" 
      					placeholder="Digite el centro" name="centro" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textCentro" ng-model="reunionOperativa.centro" 
      					placeholder="Digite el centro" name="centro" disabled required>
   				</div>
      			
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textLinea">Linea:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textLinea" ng-model="reunionOperativa.linea" 
      					placeholder="Digite la linea" name="linea" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textLinea" ng-model="reunionOperativa.linea" 
      					placeholder="Digite la linea" name="linea" disabled required>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textCliente">Cliente:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textCliente" ng-model="reunionOperativa.cliente"  
      					placeholder="Digite el cliente" name="cliente" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textCliente" ng-model="reunionOperativa.cliente"  
      					placeholder="Digite el cliente" name="cliente" disabled required>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textResponsable">Responsable:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textResponsable" ng-model="reunionOperativa.responsable" 
      					placeholder="Digite el responsable" name="responsable" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textResponsable" ng-model="reunionOperativa.responsable" 
      					placeholder="Digite el responsable" name="responsable" disabled required>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textNombreArchivo">Nombre Archivo:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<input type="text" class="form-control" id="textNombreArchivo" ng-model="reunionOperativa.nombreArchivo"  
      					placeholder="Digite el nombre del archivo" name="nombreArchivo" required>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<input type="text" class="form-control" id="textNombreArchivo" ng-model="reunionOperativa.nombreArchivo"  
      					placeholder="Digite el nombre del archivo" name="nombreArchivo" disabled required>
   				</div>
			<div class="has-error" ng-show="myForm.$dirty">
            	<span ng-show="nombreArchivo.$error.required">El Nombre de archivo es requerido</span>
			</div>
		</div>
   		</div>
   		<div class="form-group">
   			<label class="control-label col-sm-2" for="textPeriocidad">Periocidad:</label>
   			<div class="col-sm-10" class="radio">
   				<div ng-if="habilitado == 'true'">
   					<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="1">Semanal</label>
	   			 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="2">Quincenal</label>
	   			 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="3">Mensual</label>
   				</div>
   				<div ng-if="habilitado == 'false'">
	   				<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="1" disabled>Semanal</label>
	   			 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="2" disabled>Quincenal</label>
	   			 	<label><input type="radio" ng-model="reunionOperativa.periocidad" ng-value="3" disabled>Mensual</label>
   				</div>
			</div>
   		</div>
   		<div class="form-group">
			<label class="control-label col-sm-2" for="textComentario">Comentario:</label>
   			<div class="col-sm-10">
   				<div ng-if="habilitado == 'true'">
   					<textarea class="form-control" rows="5" id="textComentario" ng-model="reunionOperativa.comentario" 
      					placeholder="Digite el comentario" name="comentario"></textarea>
   				</div>
   				<div ng-if="habilitado == 'false'">
   					<textarea class="form-control" rows="5" id="textComentario" ng-model="reunionOperativa.comentario" 
      					placeholder="Digite el comentario" name="comentario" disabled></textarea>
   				</div>
			</div>
   		</div>
   		<div class="row">
			<div class="form-actions floatRight">
				<div ng-if="habilitado == 'true'">
					<input type="submit"  value="{{!reunionOperativa.id ? 'Agregar' : 'Actualizar'}}" class="btn btn-primary btn-sm" 
						ng-disabled="" ng-click="addReunionOperativa()">
					<button type="button" ng-click="resetForm()" class="btn btn-warning btn-sm" ng-disabled="">
						Reiniciar Formulario
					</button>
   				</div>
   				 <button type="button" class="btn btn-primary pull-right" ng-click="volver()">
					Volver
				</button>
			</div>
		</div>
   	</form>
</div>