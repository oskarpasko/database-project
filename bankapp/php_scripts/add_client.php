<?php

    session_start();

    include '../connect.php';

    if (isset($_POST['client_nr'])&&isset($_POST['fname'])
      &&isset($_POST['lname'])&&isset($_POST['passwd'])) {

        $client_nr = $_POST['client_nr'];
        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $passwd = $_POST['passwd'];

        $sql = ('CALL add_client("'.$client_nr.'", "'.$passwd.'", "'.$fname.'", "'.$lname.'");');
        $result = $conn->query($sql);
        
        $_SESSION['success_client'] = '<script>alert("Dodano nowego klienta!")</script>';;
        header('Location: ../src/main.php');
    }else unset($_SESSION['success_client']);
?>