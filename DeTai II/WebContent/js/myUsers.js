angular.module('myApp', []).controller('userCtrl', function($scope) {
$scope.email = '';
$scope.password = '';
$scope.edit = true;
$scope.error = false;
$scope.incomplete = false; 
$scope.hideform = true; 
$scope.$watch('password',function() {$scope.test();});

$scope.editUser = function(id) {
  $scope.hideform = false;
  if (id == 'new') {
    $scope.edit = true;
    $scope.incomplete = true;
    $scope.email = '';
  
    } else {
    $scope.edit = false;
    $scope.email = $scope.users[id-1].email;
    
  }
};

$scope.$watch('email', function() {$scope.test();});

$scope.test = function() {
  $scope.incomplete = false;
  if ($scope.edit && (!$scope.email.length ||
  !$scope.password.length )) {
     $scope.incomplete = true;
  }
};

});