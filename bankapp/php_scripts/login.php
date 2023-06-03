<?php

    session_start();

    include '../connect.php';

    if (isset($_POST['email']) && isset($_POST['password'])) {

        $email = $_POST['email'];
        $passwd = $_POST['password'];

        $sql = ('SELECT log_in("'.$email.'", "'.$passwd.'")');
        $result = $conn->query($sql);
        $row = $result->fetch_row();

        if ($row[0]=='0') {
            header('Location: ../index.php');
        } else {
            header('Location: ../src/main.php');
        }
    }
?>

