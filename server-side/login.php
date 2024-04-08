<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>

<?php
session_start();

if (isset($_SESSION['username'])) {
    echo "Welcome, {$_SESSION['name']} (User Level: {$_SESSION['user_level']})!";
    echo '<a href="logout.php">Logout</a>';
} else {
    echo '
        <h2>Login</h2>
        <form action="login_processing.php" method="post">
            <label for="email">Username (E-mail address):</label>
            <input type="email" id="email" name="email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <p>Don\'t have an account? <a href="register.php">Register</a></p>
    ';
}
?>
<script>
    function isValidEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;

        if (!isValidEmail(email)) {
            alert('Invalid email format');
            event.preventDefault();
            return;
        }

        if (password.trim() === '') {
            alert('Password cannot be empty');
            event.preventDefault();
            return;
        }

    });
</script>
</body>
</html>