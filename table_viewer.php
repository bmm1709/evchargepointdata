<?php
// Database connection parameters
 $servername = "localhost";
$username = "admin";
$password = "admin";
$database = "cpms_db_v1";

/*
Comments 

Database Connection Parameters:

$servername: The hostname where the MySQL database is hosted, in my case its my Mac Studio
$username: The username used to connect to the MySQL database. admin
$password: The password used to authenticate the MySQL user. admin
$database: The name of the MySQL database to connect to. cpms_db_v1 used

*/

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

/*

The script establishes a connection to the MySQL database using the mysqli extension in PHP. It checks if the connection is successful. If there's an error, it terminates the script and displays an error message.
*/

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch all table names from the database
$sql = "SHOW TABLES";
$result = $conn->query($sql);

/*
The script executes the SQL query "SHOW TABLES" to retrieve the names of all tables in the database.
It stores the table names in an array named $tables.
*/


$tables = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $tables[] = $row['Tables_in_cpms_db_v1'];
    }
}

// Close the database connection
$conn->close();
/*
After fetching the table names, the script closes the database connection to free up resources.also it makes it more secure.
*/

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Table Viewer</title>
</head>
<body>
    <h2>ChargePointManagementSystem:Select a Table to View Data</h2>
    <form action="" method="get">
        <label for="table">Choose a table:</label>
        <select name="table" id="table">
            <?php foreach ($tables as $table): ?>
                <option value="<?php echo $table; ?>"><?php echo $table; ?></option>
            <?php endforeach; ?>
        </select>
        <input type="submit" value="View Data">
    </form>

    <?php
    if (isset($_GET['table'])) {
        $selected_table = $_GET['table'];

        // Retrieve data from the selected table
        $conn = new mysqli($servername, $username, $password, $database);
        $sql = "SELECT * FROM $selected_table";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<h2>Table Data: $selected_table</h2>";
            echo "<table border='1'>";
            // Output table headers
            echo "<tr>";
            while ($fieldinfo = $result->fetch_field()) {
                echo "<th>{$fieldinfo->name}</th>";
            }
            echo "</tr>";

            // Output table data
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach ($row as $key => $value) {
                    echo "<td>$value</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No data available in the selected table.";
        }

        // Close the database connection
        $conn->close();
    }
    ?>
</body>
</html>
