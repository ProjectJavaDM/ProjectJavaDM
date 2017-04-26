'use strict';

App.config(['$stateProvider',function($stateProvider) {
	$stateProvider.state('editReunionOperativa', {
	    url: '/addReunionOperativa',
	    params: {
	    	idSession: ""
	    },
	    views: {
            "content@": {
                templateUrl: "/addReunionOperativa",
                controller: "addDataCtrl"
            }
        }
	}); 
}]);