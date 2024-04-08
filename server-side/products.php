<?php
$host = "localhost";
$username = "root"; 
$password = ""; 
$database = "OnlineStore"; 

$connection = mysqli_connect($host, $username, $password);
if (!$connection) {
    die("Connection failed: " . mysqli_error($connection));
}

$sql = "CREATE DATABASE IF NOT EXISTS $database";
if (mysqli_query($connection, $sql)) {
    echo "Database $database created successfully<br>";
} else {
    echo "Error creating database: " . mysqli_error($connection);
}
mysqli_close($connection);

$connection = mysqli_connect($host, $username, $password, $database);
if (!$connection) {
    die("Connection failed: " . mysqli_error($connection));
}

$sql = "CREATE TABLE IF NOT EXISTS products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
)";
if (mysqli_query($connection, $sql)) {
    echo "Table 'products' created successfully<br>";
} else {
    echo "Error creating table: " . mysqli_error($connection);
}

$sql = "CREATE TABLE IF NOT EXISTS users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
)";
if (mysqli_query($connection, $sql)) {
    echo "Table 'users' created successfully<br>";
} else {
    echo "Error creating table: " . mysqli_error($connection);
}

$products_prices = array("TShirt" => "10", 
                        "Jacket" => "10.5", 
                        "AirForce1" => "99.7",
                        "Jordan" => "78.6",
                        "Pocket" => "150.99");
foreach ($products_prices as $product => $price) {
    $sql = "INSERT INTO products (productName, price) 
            VALUES ('$product', '$price')";
    if (mysqli_query($connection, $sql)) {
        echo "Product $product is inserted successfully<br>";
    } else {
        echo "Error inserting product: " . mysqli_error($connection);
    }
}
$sql = "SELECT * FROM products";
$table = mysqli_query($connection, $sql);

echo "<table border=1>";
echo "<tr><th>ID</th><th>Name</th><th>Price</th></tr>";
while ($Row=mysqli_fetch_assoc($table)) {
    echo "<tr><td>{$Row['productID']}</td>";
    echo "<td>{$Row['productName']}</td>";
    echo "<td>{$Row['price']}</td></tr>";
}
echo "</table>";

$users_passwords = array("quandeptrai239@gmail.com" => "quanlippo239",
                        "quan.nguyendn2003@hcmut.edu.vn" => "quandn2003", 
                        "quannnnnnn239@yahoo.com" => "quan2114547", 
                        "quaaaaaaaan239@gmail.com" => "thanbaihandsome", 
                        "quuuuuuuuan239@gmail.com" => "fromdqwithlove");
foreach ($users_passwords as $email => $password) {
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);
    $sql = "INSERT INTO users (username, password) 
            VALUES ('$email', '$hashed_password')";
    if (mysqli_query($connection, $sql)) {
        echo "User $email is inserted successfully<br>";
    } else {
        echo "Error inserting user: " . mysqli_error($connection);
    }
}
mysqli_close($connection);
?>
