<!DOCTYPE html>
<html>
<head>
    <title>Your Website</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script>
        function searchProducts() {
            const query = document.getElementById('searchQuery').value;

            if (query.trim() !== '') {
                const xhr = new XMLHttpRequest();
                xhr.open('GET', 'search.php?query=' + query, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById('searchResults').innerHTML = xhr.responseText;
                    }
                };
                xhr.send();
            } else {
                document.getElementById('searchResults').innerHTML = '';
            }
        }

        // Updated showProductDetails function
        function showProductDetails(productId, productName, price) {
            // Implement this function to display product details
            alert('Product Details:\nID: ' + productId + '\nName: ' + productName + '\nPrice: ' + price);
        }
    </script>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="index.php?page=home">Home</a></li>
            <li><a href="index.php?page=products">Products</a></li>
            <?php
                session_start();
                
                if (isset($_SESSION['username'])) {
                    echo '<li><a href="logout.php">Logout</a></li>';
                } else {
                    echo '<li><a href="index.php?page=login">Login</a></li>';
                }
            ?>
            <li><a href="index.php?page=register">Register</a></li>
        </ul>
        <div class="search">
            <h2>Product Search</h2>
            <input type="text" id="searchQuery" name="query" oninput="searchProducts()" required>
            <div id="searchResults"></div>
        </div>
    </div>
    <div id="content" class="content">
        <?php
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            switch ($page) {
                case 'home':
                    include 'home.php';
                    break;
                case 'products':
                    include 'products.php';
                    break;
                case 'login':
                    include 'login.php';
                    break;
                default:
                    include 'home.php'; 
                    break;
            }
        } else {
            include 'home.php';
        }
        ?>
    </div>
</body>
</html>
