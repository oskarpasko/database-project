<?php
session_start();
require_once('../connect.php');
?>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstraps CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstraps JS -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/4eae93b131.js" crossorigin="anonymous"></script>
  <!-- Own CSS -->
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Caveat:wght@400;700&family=Indie+Flower&family=Lato:ital,wght@0,400;1,300&display=swap');

    html,
    body {
      font-family: 'Lato', sans-serif;
    }
  </style>

  <title>MainPage</title>
</head>

<body class="bg-secondary d-flex flex-column min-vh-100 fs-2">
  <!-- <body> -->

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
  <div class="container text-center">
    <div class="row gx-4">
      <div class="col-lg-4">
        <div class="container gy-4">
          <div class="row mb-4">
            <div class="col-sm border border-light bg-success bg-gradient">
              <button class="btn btn-danger m-4 btn-lg showSingle" target="1">Dodaj Klienta</button>
            </div>
          </div>
          <div class="row mb-4">
            <div class="col-sm border border-light bg-success bg-gradient">
              <button class="btn btn-danger m-4 btn-lg showSingle" target="2">Dodaj pracownika</button>
            </div>
          </div>
          <div class="row mb-4">
            <div class="col-sm border border-light bg-success bg-gradient">
              <button class="btn btn-danger m-4 btn-lg showSingle" target="3">Dodaj kartę</button>
            </div>
          </div>
          <div class="row mb-4">
            <div class="col-sm border border-light bg-success bg-gradient">
              <button class="btn btn-danger m-4 btn-lg showSingle" target="4">Zadłużeni Klienci</button>
            </div>
          </div>
          <div class="row">
            <div class="col-sm border border-light bg-success bg-gradient">
              <button class="btn btn-danger m-4 btn-lg showSingle" target="5">Wynik</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg">
        <div class="border border-light bg-success bg-gradient">

          <div id="div1" class="targetDiv d-flex justify-content-center p-5">
            <form method="post" action="../php_scripts/add_client.php" name="add_client" class="w-50 align-self-center">
              <div class="form-group row ">
                <label for="input_clienr" class="col-sm col-form-label">Nr Klienta</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_clientnr" name="client_nr" placeholder="Nr Klienta">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_fname" class="col-sm col-form-label">Imię</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_fname" name="fname" placeholder="Imię">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_lname" class="col-sm col-form-label">Nazwisko</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_lname" name="lname" placeholder="Nazwisko">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_fname" class="col-sm col-form-label">Hasło</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" id="input_fname" name="passwd" placeholder="Hasło">
                </div>
              </div>
              <button type="submit" class="btn btn-danger btn-lg">Dodaj Klienta</button>
              <?php
              if (isset($_SESSION['success_client'])) echo $_SESSION['success_client'];
              unset($_SESSION['success_client']);
              ?>
            </form>
          </div>

          <div id="div2" class="targetDiv d-flex justify-content-center p-5">
            <form method="post" action="../php_scripts/add_employee.php" class="w-50 align-self-center">
              <div class="form-group row ">
                <label for="input_emp_email" class="col-sm col-form-label">Email</label>
                <div class="col-sm-8">
                  <input type="email" class="form-control" id="input_emp_email" name="email" placeholder="Email">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_emp_fname" class="col-sm col-form-label">Imię</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_emp_fname" name="lname" placeholder="Imię">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_emp_lname" class="col-sm col-form-label">Nazwisko</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_emp_lname" name="fname" placeholder="Nazwiskoo">
                </div>
              </div>
              <div class="form-group row">
                <label for="input_emp_pesel" class="col-sm col-form-label">PESEL</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_emp_pesel" name="pesel" placeholder="PESEL">
                </div>
              </div>
              <div class="form-group row">
                <select class="form-select" id="inputGroupSelect01" name="position">
                  <option selected>Pozycja...</option>
                  <?php
                  $sql = ('SELECT position_name FROM positions ORDER BY position_name;');
                  $result = $conn->query($sql);
                  while ($row = $result->fetch_row()) {
                    echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
                  }
                  ?>
                </select>
              </div>
              <div class="form-group row">
                <select class="form-select" id="inputGroupSelect02" name="company">
                  <option selected>Firma...</option>
                  <?php
                  $sql = ('SELECT * FROM company ORDER BY company_city, company_street;');
                  $result = $conn->query($sql);
                  while ($row = $result->fetch_row()) {
                    echo '<option value="' . $row[0] . '">' . $row[1] . ', ul. ' . $row[2] . ' ' . $row[3] . ' - ' . $row[4] . '</option>';
                  }
                  ?>
                </select>
              </div>
              <button type="submit" class="btn btn-danger btn-lg">Dodaj pracownika</button>
              <?php
              if (isset($_SESSION['success_emp'])) echo $_SESSION['success_emp'];
              unset($_SESSION['success_emp']);
              ?>
            </form>
          </div>


          <div id="div3" class="targetDiv d-flex justify-content-center p-5">
            <form method="post" action="../php_scripts/add_card.php" name="add_card" class="w-50 align-self-center">
              <div class="form-group row">
                <label for="input_card_client" class="col-sm col-form-label">Numer Klienta</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="input_card_client" name="client_nr" placeholder="Numer Klienta">
                </div>
              </div>
              <div class="form-group row">
                <select class="form-select" id="input_card_type" name="type">
                  <option selected>Typ karty</option>
                  <option value="1">Debetowa</option>
                  <option value="2">Kredytowa</option>
                </select>
              </div>
              <button type="submit" class="btn btn-danger btn-lg">Dodaj kartę</button>
              <?php
              if (isset($_SESSION['success_card'])) echo $_SESSION['success_card'];
              unset($_SESSION['success_card']);
              ?>
            </form>
          </div>
          <div id="div4" class="targetDiv d-flex justify-content-center p-5">
            <table class="table table-hover table-light">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Nr Klienta</th>
                <th scope="col">Nr Karty</th>
                <th scope="col">Imię</th>
                <th scope="col">Nawizko</th>
                <th scope="col">Typ Karty</th>
                <th scope="col">Środki na karcie</th>
              </tr>
            </thead>
            <tbody class="tbody-light">
              <?php
                  $sql = ('CALL indebted("Kredytowa", 0.0);');
                  $result = $conn->query($sql);
                  while ($row = $result->fetch_assoc()) {
                    echo '<tr>'.
                         '<td>'.$row['client_nr'].'</td>'.
                         '<td>'.$row['card_nr'].'</td>'.
                         '<td>'.$row['client_fname'].'</td>'.
                         '<td>'.$row['client_lname'].'</td>'.
                         '<td>'.$row['card_type'].'</td>'.
                         '<td>'.$row['card_balance'].'</td>'.
                         '</tr>';
                  }
                ?>
            </tbody>
            </table>
          </div>
          <div id="div5" class="targetDiv d-flex flex-column justify-content-center p-5">
            <p class="text-center fs-1"><span class="badge bg-danger fw-bold mr-3">Label</span>Text</p></br>
            <p class="text-center fs-1"><span class="badge bg-danger fw-bold mr-3">Label</span>Text</p></br>
            <p class="text-center fs-1"><span class="badge bg-danger fw-bold mr-3">Label</span>Text</p></br>

          </div>
        </div>
      </div>

    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="../js/main_show.js"></script>
</body>

</html>