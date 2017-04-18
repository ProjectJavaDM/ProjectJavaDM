<!DOCTYPE html>
<html>
	<head>
		<title>Chequeo de documentos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h2>Chequeo de Documentos</h2>
			<br/>
			<ul class="nav nav-pills">
				<li class="active">
					<a data-toggle="pill" href="#semanal">
						Semanal
					</a>
				</li>
				<li>
					<a data-toggle="pill" href="#quincenal">
						quincenal
					</a>
				</li>
				<li>
					<a data-toggle="pill" href="#mensual">
						Mensual
					</a>
				</li>
			</ul>
			
			<div class="tab-content">
				 <div id="semanal" class="tab-pane fade in active">
				 	<h4>Información Semanal</h4>
				 </div>
				 <div id="quincenal" class="tab-pane fade">
				 	<h4>Información Quincenal</h4>
				 </div>
				 <div id="mensual" class="tab-pane fade">
				 	<h4>Información Mensual</h4>
				 </div>
				 <table class="table">
				 		<thead>
				 		<tr>
				 			<th>Aplicación</th>
				 			<th>Centro</th>
				 			<th>Cliente</th>
				 			<th>Comentario</th>
				 			<th>Estado</th>
				 			<th>Linea</th>
				 			<th>Nombre_Archivo</th>
				 			<th>Responsable</th>
				 		</tr>
				 		</thead>
				 	</table>
			</div>
		</div>
	</body>
</html>