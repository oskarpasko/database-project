<?php

    session_start();

    include '../connect.php';

    if (isset($_POST['email']) && isset($_POST['password'])) {

        $email = $_POST['email'];
        $passwd = $_POST['password'];

        $sql = ('SELECT * FROM employee WHERE employee_email="'.$email.'" AND employee_pesel="'.$passwd.'"');
        $result = $conn->query($sql);

        if ($result->num_rows==0) {
            header('Location: ../index.php');
        } else {

            $row = $result->fetch_assoc();
            $_SESSION['emp_id'] = $row['employee_pesel'];
            header('Location: ../src/main.php');
        }
    }
?>

