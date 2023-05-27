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

    <title>MainPage</title>
  </head>
  <body class="bg-secondary d-flex flex-column min-vh-100 fs-2">

  <div class="container mt-5 mb-5 content-height">
        <div class="row g-3">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Klienci</h2>
                        <p class="card-text">Spis klientów naszej aplikacji.</p>
                        <a href="src/clients.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Karty</h2>
                        <p class="card-text">Spis kart oraz klientów, do których nalezą.</p>
                        <a href="src/cards.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Przelewy</h2>
                        <p class="card-text">Spis przelewów wszystkich klientów</p>
                        <a href="src/overflow.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="row g-3 mt-5">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Pracownicy</h2>
                        <p class="card-text">Spis pracowników w firmie.</p>
                        <a href="src/employee.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Budynki</h2>
                        <p class="card-text">Spis wydziałów nalezących do firmy.</p>
                        <a href="src/company.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title fw-bold">Pozycje</h2>
                        <p class="card-text">Pozycje oraz ich stawki.</p>
                        <a href="src/position.php" class="btn btn-primary">Przejdź</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  </body>
</html>