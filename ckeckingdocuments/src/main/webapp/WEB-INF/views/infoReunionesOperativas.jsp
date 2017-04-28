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
			<button type="button" class="btn btn-primary pull-right" ng-click="agregarReunion()">
				Agregar una nueva reunión operativa
			</button>
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
				 	<thead class="color_everis estilo_scroll_thead">
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
				 			<th>
				 				<a href="" ng-click="orderByField='revisado'; reverseSort = !reverseSort" class="tabla_thead_titles">
				 					Revisado
				 				</a>
				 			</th>
				 			<th>
				 				<a href="" class="tabla_thead_titles">
				 					Acciones
				 				</a>
				 			</th>
				 		</tr>
				 	</thead>
				 	<tbody class="estilo_scroll_tbody">
				 		<tr ng-repeat="ro in reunionesOperativas | orderBy:orderByField:reverseSort"
				 			ng-class='{document_not_found: !ro.estado, document_found: ro.estado}' class="estilo_scroll_tr">
				 			<td>{{ro.id}}</td>
				 			<td>{{ro.ruta}}</td>
				 			<td>{{ro.estado}}</td>
				 			<td>{{ro.aplicacion}}</td>
				 			<td>{{ro.centro}}</td>
				 			<td>{{ro.linea}}</td>
				 			<td>{{ro.cliente}}</td>
				 			<td>{{ro.responsable}}</td>
				 			<td>{{ro.nombreArchivo}}</td>
				 			<td>
				 				<div ng-if="ro.revisado == 0">
				 					<img src="images/en_espera.png" width="30px" height="30px" alt="Incono en espera">
				 				</div>
				 				<div ng-if="ro.revisado == 1">
				 					<img src="images/revision.png" width="30px" height="30px" alt="Incono revisado">
				 				</div>
				 			</td>
				 			<td>
				 				<button type="button" ng-click="editar(ro.id)" class="btn btn-primary">
	                           		Editar
	                           	</button>
				 			</td>
				 		</tr>
					</tbody>
				</table>
			</div>
		</div>
		<button type="button" class="btn btn-primary pull-right" ng-click="checkingDocuments()">
			Chequear Información
		</button>
</form>
</div>