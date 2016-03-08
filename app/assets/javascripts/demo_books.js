app.controller('booksCtrl', function($scope, $http){
  var base_url = "http://localhost:3000/";

  // Get list books
  $scope.books = {};
  $http.get(base_url + 'api/v1/books/get_all')
      .then(function(books){
        console.log(books.data);
        $scope.books = books.data;
      });

  // Get list author for create book
  $scope.authors = {};
  $http.get(base_url + 'api/v1/authors').then(function(authors){
    console.log(authors.data);
    $scope.authors = authors.data
  });

  // Get list other books
  $scope.getOtherBooks = function(author_id){
    $http.get(base_url + 'api/v1/authors/'+author_id+'/books')
        .then(function(otherBooks){
          console.log(otherBooks.data);
          $scope.otherBooks = otherBooks.data;
        });
  };

  // Create new book
  $scope.book = {};
  $scope.submitForm = function($event) {
    $event.preventDefault();
    $http({
      method: 'POST',
      url: base_url + 'api/v1/books',
      data: $scope.book,
      headers: {'Content-Type':'application/json'}
    }).success(function(book){
      if(book.published == true){
        $scope.books.push(book);
      }
      $scope.book = {};
    }).error(function(e){});
  };

  // Delete book
  $scope.deleteBook = function(index){
    $http.delete(base_url + 'api/v1/books/'+$scope.books[index].id).success(function(result){
      console.log(result);
      $scope.books.splice(index, 1);
      alert(result.message);
    })
  };

  // Update author
  var idx;
  $scope.editBook = function(index){
    $scope.bookUpdate = $scope.books[index];
    idx = index;
  };

  $scope.cancelForm = function() {
    $scope.bookUpdate = {};
  };

  $scope.updateBook = function($event){
    $event.preventDefault();
    $http.put(base_url + "api/v1/books/" + $scope.bookUpdate.id, {'book' : $scope.bookUpdate})
        .success(function(book){
          if(book.published != true){
            $scope.books.splice(idx, 1);
          }
          $scope.bookUpdate = {};
        });
  };

});