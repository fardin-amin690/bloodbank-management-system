<?php
  if (session_status() == PHP_SESSION_NONE) {
    session_start();
  }
  if(!(isset($_SESSION["user_type"]) && ($_SESSION["user_type"] == "executive" || $_SESSION["user_type"] == "donor" || $_SESSION["user_type"] == "bloodbank"))) {
    echo "You are not allowed!!!<br> <a href=\"../common/dashboard.php\">Dashboard</a>";
    session_abort();
    exit();
  }
?>

<?php
  $title = "View Patient";
  
  require_once("../database.php");
  $patients = Database::get("SELECT * FROM PATIENT_VIEW");
?>

<?php include_once("../templates/header.php"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        main {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

<header>
    <h1>View Patient</h1>
</header>

<main>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Blood Group</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($patients as $patient): ?>
                <tr>
                    <td><?php echo $patient["name"] ?></td>
                    <td><?php echo $patient["gender"] ?></td>
                    <td><?php echo $patient["phone"] ?></td>
                    <td><?php echo $patient["address"] ?></td>
                    <td><?php echo $patient["bloodgroup"] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</main>

<?php include_once("../templates/footer.php"); ?>
</body>
</html>
