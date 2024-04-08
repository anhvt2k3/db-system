<?php
$host = "localhost";
$username = "root";
$passwordU = "";
$database = "OnlineStore";

if (isset($_GET['query'])) {
    $connection = mysqli_connect($host, $username, $passwordU, $database);

    $searchQuery = $_GET['query'];

    $sql = "SELECT * FROM products WHERE productName LIKE '$searchQuery%'";
    $result = mysqli_query($connection, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            // Each product name is a clickable link calling the showProductDetails function
            echo '<a href="#" onclick="showProductDetails(' . $row['productID'] . ', \'' . $row['productName'] . '\', ' . $row['price'] . ')">' . $row['productName'] . '</a><br>';
        }
    } else {
        echo "No products found for '{$searchQuery}'";
    }

    mysqli_close($connection);
} else {
    header("Location: index.php?page=home");
    exit();
}
?>
