'use strict';

App.config(['$routeProvider',function($routeProvider) {
	$routeProvider.when('/addReunionOperativa/:idSession?', {
	    templateUrl: "addReunionOperativa.html",
	    controller: "addDataCtrl"
	}); 
}]);