'use strict';

//Controller Principal
App.controller('myCtrl', function($scope, $http, $window, $q) {
	var url = "http://localhost:9085/";
	
	$scope.periocidad = 1;
	$scope.nombreNavegacion = 'Semanal';
	
	$http.get(url + "reunionesOperativas/allByPeriocidad/" + $scope.periocidad)
	.then(
		function (response) {
			$scope.reunionesOperativas = response.data;
		},
		function(errResponse){
			console.error('Error al cargar las reuniones operativas');
			return $q.reject(errResponse);
		}
	);
	
	//Funciones para botones  
	$scope.checkingDocuments = function() {
		var nameService;
		
		if($scope.periocidad == 1)
			nameService = "ckeckingdocuments/searchWeeklyMissing";
		else if($scope.periocidad == 2)
			nameService = "ckeckingdocuments/searchBiweeklyMissing";
		else
			nameService = "ckeckingdocuments/searchMonthlyMissing";
		
		$http.post(url + nameService)
		.then(
			function (response) {
				return response.data;
			},
			function(errResponse){
				console.error('Error al realizar el chequeo de documentos');
				return $q.reject(errResponse);
			}
		);
	};
	
	$scope.changePeriocidad = function(change) {
		$scope.periocidad = change;	
		
		$http.get(url + "reunionesOperativas/allByPeriocidad/" + $scope.periocidad)
		.then(
			function (response) {
				$scope.reunionesOperativas = response.data;
			},
			function(errResponse){
				console.error('Error al cargar las reuniones operativas');
				return $q.reject(errResponse);
			}
		);
	};
	
	$scope.editar = function(idSession) {
		
		$window.location.href = url + "addReunionOperativa/" + idSession;
	}
	
	$scope.agregarReunion = function() {
		$window.location.href = url + "addReunionOperativa";
	};
});

//Controller agregar o editar datos
App.controller('addDataCtrl', function($scope, $http, $window, $q) {
	var url = "http://localhost:9085/";
	
	$scope.idSession = null;
	
	if($scope.idSession == null){
		//Inicializar Datos
		$scope.reunionOperativa = {
			id: null,
			estado: 0,
			ruta: "",
			nombreArchivo: "",
			centro: "",
			linea: "",
			cliente: "",
			aplicacion: "",
			periocidad: 1,
			responsable: "",
			comentario: ""
		};
	}else {
		$http.get(url + "/reunionesOperativas/byId/" + $scope.idSession)
		.then(
			function (response) {
				return response.data;
			},
			function(errResponse){
				console.error('Error al buscar la reunión operativa con el ID = ' + $scope.idSession);
				return $q.reject(errResponse);
			}
		);
	}
	
	$scope.addReunionOperativa = function() {
		$http.post(url + "/reunionesOperativas/save", $scope.reunionOperativa)
		.then(
			function (response) {
				return response.data;
			},
			function(errResponse){
				console.error('Error al crear la reunión operativa');
				return $q.reject(errResponse);
			}
		);
		$window.location.href = url;
	};
	
	$scope.resetForm = function() {
		$scope.reunionOperativa = {
			id: null,
			estado: 0,
			ruta: "",
			nombreArchivo: "",
			centro: "",
			linea: "",
			cliente: "",
			aplicacion: "",
			periocidad: 1,
			responsable: "",
			comentario: ""
		};
	};
	
	$scope.volver = function() {
		$window.location.href = url;
	};
});
