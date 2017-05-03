<div class="generic-container">
	<form class="form-horizontal">
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
				 	<thead>
				 		<tr>
				 			<th class="tabla_id alineacion_texto">
				 				<a ng-click="orderByField='id'; reverseSort = !reverseSort">
				 					ID
				 				</a>
				 			</th>
				 			<th class="tabla_ruta alineacion_texto">
				 				<a ng-click="orderByField='ruta'; reverseSort = !reverseSort">
				 					Ruta
				 				</a>
				 			</th>
				 			<th class="tabla_estado alineacion_texto">
				 				<a ng-click="orderByField='estado'; reverseSort = !reverseSort">
				 					Estado
				 				</a>
				 			</th>
				 			<th class="tabla_aplicacion alineacion_texto">
				 				<a ng-click="orderByField='aplicacion'; reverseSort = !reverseSort">
				 					Aplicación
				 				</a>
				 			</th>
				 			<th class="tabla_linea alineacion_texto">
				 				<a ng-click="orderByField='linea'; reverseSort = !reverseSort">
				 					Linea
				 				</a>
				 			</th>
				 			<th class="tabla_cliente alineacion_texto">
				 				<a ng-click="orderByField='cliente'; reverseSort = !reverseSort">
				 					Cliente
				 				</a>
				 			</th>
				 			<th class="tabla_responsable alineacion_texto">
				 				<a ng-click="orderByField='responsable'; reverseSort = !reverseSort">
				 					Responsable
				 				</a>
				 			</th>
				 			<th class="tabla_revisado alineacion_texto">
				 				<a ng-click="orderByField='revisado'; reverseSort = !reverseSort">
				 					Revisado
				 				</a>
				 			</th>
				 			<th class="tabla_botones">
				 				<a>
				 					Acciones
				 				</a>
				 			</th>
				 		</tr>
				 	</thead>
				 	<tbody>
				 		<tr ng-repeat="ro in reunionesOperativas | orderBy:orderByField:reverseSort"
				 			ng-class='{document_not_found: !ro.estado, document_found: ro.estado}'>
				 			<td class="tabla_id">{{ro.id}}</td>
				 			<td class="tabla_ruta">{{ro.ruta}}</td>
				 			<td class="tabla_estado">{{ro.estado}}</td>
				 			<td class="tabla_aplicacion">{{ro.aplicacion}}</td>
				 			<td class="tabla_linea">{{ro.linea}}</td>
				 			<td class="tabla_cliente">{{ro.cliente}}</td>
				 			<td class="tabla_responsable">{{ro.responsable}}</td>
				 			<td class="tabla_revisado">
				 				<div ng-if="ro.revisado == 0">
				 					<img src="images/en_espera.png" width="30px" height="30px" alt="Incono en espera">
				 				</div>
				 				<div ng-if="ro.revisado == 1">
				 					<img src="images/revision.png" width="30px" height="30px" alt="Incono revisado">
				 				</div>
				 			</td>
				 			<td class="tabla_botones">
				 				<div class="row">
				 					<div>
				 						<a ng-click="editar(ro.id)" class="boton_icono">
			                           		<img src="images/editar.png" width="30px" height="30px" alt="Incono de editar">
			                           	</a>
				 					</div>
					 				<div>
					 					<a ng-click="ver(ro.id)" class="boton_icono">
			                           		<img src="images/ver.png" width="30px" height="30px" alt="Incono de visualizar">
			                           	</a>
					 				</div>
				 				</div>
				 			</td>
				 		</tr>
					</tbody>
				</table>
			</div>
		</div>
		<button type="button" class="btn btn-primary pull-right" ng-click="checkingDocuments()">
			Chequear Información
		</button>
		<button type="button" class="btn btn-primary pull-right" ng-click="agregarReunion()">
			Agregar una nueva reunión operativa
		</button>
</form>
</div>