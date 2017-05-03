<!DOCTYPE html>

<%@ include file="/WEB-INF/views/include.jsp"%>

<html>
	<head>
		<title>Chequeo de documentos</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	<body ng-app="myApp" class="ng-clook">
		<div ng-controller="mainCtrl as ctrl">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="textEstado">
						<img src="images/logo_everis.png" width="140px" height="140px" alt="Logo everis">
					</label>
	    			<div class="col-sm-7">
	        			<h2>Chequeo de Documentos</h2>
	      			</div>
	    		</div>
	    	</form>
	    	<div ng-if="pagPrincipal === 'true'">
	    		<%@ include file="/WEB-INF/views/infoReunionesOperativas.jsp"%>
	    	</div>
	    	<div ng-if="pagPrincipal === 'false'">
	    		<%@ include file="/WEB-INF/views/addReunionOperativa.jsp"%>
	    	</div>
		</div>
	</body>
</html>