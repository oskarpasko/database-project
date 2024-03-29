<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstraps CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <!-- Bootstraps JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4eae93b131.js" crossorigin="anonymous"></script>
    <!-- Own CSS -->
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Caveat:wght@400;700&family=Indie+Flower&family=Lato:ital,wght@0,400;1,300&display=swap');
      html, body{font-family: 'Lato', sans-serif;}

    </style>

    <title>Cards</title>
  </head>
  <body class="bg-secondary d-flex flex-column min-vh-100 fs-2">
          
    <!-- HEADER -->
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="main.php">Hidden brand</a>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="clients.php">Klienci</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cards.php">Karty</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="overflow.php">Przelewy</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="employee.php">Pracownicy</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="company.php">Budynki</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="position.php">Pozycje</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li> -->
      </ul>
    </div>
  </div>
</nav>
        <!-- END -->
  <!----------- CARDS ----------->
  <div class="container mt-5 mb-5 content-height">
        <div class="row">
            <table class="table table-hover bg-white text-center fs-2">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">PESEL</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Position</th>
                        </tr>
                    </thead>
                <tbody>
            
                <?php
                    include '../connect.php';

                    $sql = "SELECT * FROM employee ORDER BY employee_lname";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        $nr=1;
                    while($row = $result->fetch_assoc()) {
                        
                        echo '<tr><th scope="row">'.$nr.'</th><td>'.$row['employee_pesel'].'</td><td>'.$row['employee_fname'].'</td><td>'.$row['employee_lname'].'</td><td>'.$row['employee_position'].'</td></tr>';
                        $nr+=1;
                    }
                    } else {
                    echo "0 results";
                    }
                    $conn->close();
                ?> 

                </tbody>
            </table>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  </body>
</html>