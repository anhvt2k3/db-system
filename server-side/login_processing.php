<?php
    session_start();
    $host = "localhost";
    $username = "root"; 
    $passwordU = ""; 
    $database = "OnlineStore"; 
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $password = $_POST['password'];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "Invalid email format";
            exit();
        }

        $connection = mysqli_connect($host, $username, $passwordU, $database);
        $sql = "SELECT * FROM users WHERE username = '$email'";
        $result = mysqli_query($connection, $sql);
        
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);

            if (password_verify($password, $row['password'])) {
                $_SESSION['username'] = $row['username'];
                $_SESSION['name'] = $row['name']; 
                $_SESSION['user_level'] = $row['user_level']; 

                setcookie("username", $row['username'], time() + 3600, "/");
                header("Location: index.php?page=login");
                exit();
            } else {
                echo "Incorrect username or password!";
            }
        } else {
            echo "Incorrect username or password!";
        }

        mysqli_close($connection);

    }

?>