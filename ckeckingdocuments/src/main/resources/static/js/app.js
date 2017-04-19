'use strict';

var app = angular.module('myApp', []);


app.controller('myCtrl', function($scope, $http) {
	var url = "http://localhost:9085/";
	$scope.periocidad = 1;
	$scope.nombreNavegacion = 'Semanal';
	
	$http.get(url + "reunionesOperativas/allByPeriocidad/" + $scope.periocidad)
	.then(
		function (response) {
			$scope.reunionesOperativas = response.data;
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
			}
		);
	};
	
	$scope.changePeriocidad = function(change) {
		$scope.periocidad = change;	
		
		$http.get(url + "reunionesOperativas/allByPeriocidad/" + $scope.periocidad)
		.then(
			function (response) {
				$scope.reunionesOperativas = response.data;
			}
		);
	};
});