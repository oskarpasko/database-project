<?php

    session_start();

    include '../connect.php';

    if (isset($_POST['client_nr'])&&isset($_POST['type'])) {

        $client_nr = $_POST['client_nr'];
        $type = $_POST['type'];

        $cvc = strval(rand(100, 999));
        $card_nr = '';
        $date = date("Y-m-d");

        for($i = 0; $i < 16; $i++) { $card_nr .= mt_rand(0, 9);}
        $term_date = date('Y-m-d', strtotime($date. ' + 5 years'));

        $sql = ('CALL add_card("'.$card_nr.'", "'.$term_date.'", "'.$cvc.'", "'.$type.'", 0.0, "'.$client_nr.'"); ');
        $result = $conn->query($sql);
        
        $_SESSION['success_card'] = '<script>alert("Dodano nową kartę!")</script>';;
        header('Location: ../src/main.php');
    }else unset($_SESSION['success_card']);
?>