<?php
// Database connection parameters
$servername = "localhost";
$username = "admin";
$password = "admin";
$database = "cpms_db_v1";


// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to retrieve table names
$sql = "SHOW TABLES FROM $database";

// Execute the query
$result = $conn->query($sql);

// Check if there are any tables
if ($result->num_rows > 0) {
    echo "<h2>Tables in Database $database:</h2>";
    echo "<ul>";
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<li>" . $row["Tables_in_$database"] . "</li>";
    }
    echo "</ul>";
} else {
    echo "0 tables found in database $database";
}

// Close the database connection
$conn->close();
?>
