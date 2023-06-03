<?php

    session_start();

    include '../connect.php';

    if (isset($_POST['email'])&&isset($_POST['lname'])
      &&isset($_POST['fname'])&&isset($_POST['pesel'])
      &&isset($_POST['position'])&&isset($_POST['company'])) {

        $email = $_POST['email'];
        $lname = $_POST['lname'];
        $fname = $_POST['fname'];
        $pesel = $_POST['pesel'];
        $position = $_POST['position'];
        $company = $_POST['company'];


        $sql = ('CALL add_employee("'.$pesel.'", "'.$email.'", "'.$fname.'", "'.$lname.'", "'.$position.'", '.$company.');');
        $result = $conn->query($sql);
        
        $_SESSION['success_emp'] = '<script>alert("Dodano nowego pracownika!")</script>';;
        header('Location: ../src/main.php');
    }else unset($_SESSION['success_emp']);
?>