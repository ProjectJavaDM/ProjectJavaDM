'use strict';

app.factory('ReunionesOperativasService', ['$http', '$q', function($http, $q){
	return {
		allReunionesOperativasByPeriocidad: function(periocidad, url) {
			return $http.get('http://' + url + ':9085/reunionesOperativas/allByPeriocidad/' + periocidad)
				.then(
					function(reponse) {
						return response.data;
					},
					function(errResponse) {
						console.error('Error llamando al servicio allByPeriocidad');
						return $q.reject(errResponse);
					}
				);
		}
	};
}]);