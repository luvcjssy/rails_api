app.controller('authorCtrl', function($scope, $http){
  var base_url = "http://localhost:3000/";
  // Get list authors
  $scope.authors = {};
  $http.get(base_url + "api/v1/authors").then(function(authors){
    $scope.authors = authors.data;
  });

  // Get list books from author id
  $scope.getListBooks = function(id) {
    $http.get(base_url + 'api/v1/authors/'+id+'/books').then(function(books){
          console.log(books.data)
          $scope.books = books.data;
    });
  };

  // Create new author
  $scope.author = {};
  $scope.submitForm = function() {
    $http({
      method  : 'POST',
      url     : base_url + 'api/v1/authors',
      data    : $scope.author,
      headers : {'Content-Type': 'application/json'}
    }).success(function(author){
      if (author) {
        if(author.status == true) {
          $scope.authors.push(author);
          $scope.author = {};
        }
      }
    }).error(function(Exception){});
  };

  // Delete author
  $scope.deleteAuthor = function(index){
    $http.delete(base_url + "api/v1/authors/" + $scope.authors[index].id).success(function(result){
      console.log(result);
      $scope.authors.splice(index, 1);
      alert(result.message);
    });
  };

  // Update author
  $scope.show = false;
  var idx;
  $scope.editAuthor = function(index){
    $scope.authorUpdate = $scope.authors[index];
    idx = index;
    $scope.show = !$scope.show;
  };

  $scope.cancelForm = function() {
    $scope.show = !$scope.show;
  };

  $scope.updateForm2 = function(){
    $http.put(base_url + "api/v1/authors/" + $scope.authorUpdate.id, {'author' : $scope.authorUpdate})
        .success(function(author){
          if(author.status != true){
            $scope.authors.splice(idx, 1);
          }
          $scope.authorUpdate = {};
          $scope.show = !$scope.show;
        });
  };
});