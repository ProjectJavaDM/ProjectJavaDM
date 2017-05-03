'use strict';

//Controller Principal
App.controller('mainCtrl', function($scope, $http, $q) {
	var url = "http://localhost:9085/";
	initializeDate($scope);
	
	callServiceListRO($scope, $http, url, 1, $q);
	
	//Funciones para botones
	$scope.addReunionOperativa = function() {
		if(validarDatos($scope)){
			$scope.reunionOperativa.revisado = 0;
			callServiceSaveReunionOperativa ($http, url, $scope, $q);
			$scope.pagPrincipal = 'true';
		}
	};
	
	$scope.agregarReunion = function() {
		initializeReunionOperativa($scope);
		$scope.habilitado = 'true';
		$scope.pagPrincipal = 'false';
	};
	
	$scope.changePeriocidad = function(periocidad) {
		$scope.periocidad = periocidad;
		callServiceListRO($scope, $http, url, periocidad, $q);
	};
	
	$scope.checkingDocuments = function() {
		var nameService;
		
		if($scope.periocidad == 1)
			nameService = "ckeckingdocuments/searchWeeklyMissing";
		else if($scope.periocidad == 2)
			nameService = "ckeckingdocuments/searchBiweeklyMissing";
		else
			nameService = "ckeckingdocuments/searchMonthlyMissing";
		callServiceCheckDocuments($http, url, nameService, $q);
	};	
	
	$scope.editar = function(id) {
		$scope.idReunionOperativa = id;
		callServiceSearchReunionOperativa($http, url, $scope, $q);
		$scope.habilitado = 'true';
		$scope.pagPrincipal = 'false';
	}
	
	$scope.ver = function(id) {
		$scope.idReunionOperativa = id;
		callServiceSearchReunionOperativa($http, url, $scope, $q);
		$scope.habilitado = 'false';
		$scope.pagPrincipal = 'false';
	}
	
	$scope.resetForm = function() {
		initializeReunionOperativa($scope);
	};
	
	$scope.volver = function() {
		$scope.pagPrincipal = 'true';
		$scope.habilitado = 'true';
	};
});

function initializeDate ($scope) {
	$scope.idReunionOperativa = null;
	$scope.nombreNavegacion = 'Semanal';
	$scope.pagPrincipal = 'true';
	$scope.periocidad = 1;
}

function initializeReunionOperativa($scope) {
	if($scope.reunionOperativa == null || $scope.reunionOperativa.id == null){
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
	}
	else {
		$scope.reunionOperativa.estado = 0;
		$scope.reunionOperativa.ruta = "";
		$scope.reunionOperativa.nombreArchivo = "";
		$scope.reunionOperativa.centro = "";
		$scope.reunionOperativa.linea = "";
		$scope.reunionOperativa.cliente =  "";
		$scope.reunionOperativa.aplicacion = "";
		$scope.reunionOperativa.periocidad = 1;
		$scope.reunionOperativa.responsable = "";
		$scope.reunionOperativa.comentario = "";
	}
}

function callServiceCheckDocuments($http, url, nameService, $q) {
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
}

function callServiceListRO($scope, $http, url, periocidad, $q) {
	$http.get(url + "reunionesOperativas/allByPeriocidad/" + periocidad)
	.then(
		function (response) {
			$scope.reunionesOperativas = response.data;
		},
		function(errResponse){
			console.error('Error al cargar las reuniones operativas');
			return $q.reject(errResponse);
		}
	);
}

function callServiceSaveReunionOperativa ($http, url, $scope, $q) {
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
}

function callServiceSearchReunionOperativa($http, url, $scope, $q) {
	$http.get(url + "/reunionesOperativas/byId/" + $scope.idReunionOperativa)
	.then(
		function (response) {
			$scope.reunionOperativa = response.data;
		},
		function(errResponse){
			console.error('Error al buscar la reunión operativa con el ID = ' + $scope.idReunionOperativa);
			return $q.reject(errResponse);
		}
	);
}

function validarDatos($scope) {
	if($scope.reunionOperativa.ruta == null || $scope.reunionOperativa.ruta == "")
		return false;
	if($scope.reunionOperativa.aplicacion == null || $scope.reunionOperativa.aplicacion == "")
		return false;
	if($scope.reunionOperativa.centro == null || $scope.reunionOperativa.centro == "")
		return false;
	if($scope.reunionOperativa.linea == null || $scope.reunionOperativa.linea == "")
		return false;
	if($scope.reunionOperativa.cliente == null || $scope.reunionOperativa.cliente == "")
		return false;
	if($scope.reunionOperativa.responsable == null || $scope.reunionOperativa.responsable == "")
		return false;
	if($scope.reunionOperativa.nombreArchivo == null || $scope.reunionOperativa.nombreArchivo == "")
		return false;
	return true;
}
