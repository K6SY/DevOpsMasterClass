<!DOCTYPE html>
<html>
    <head>
        <title>Simple application PHP</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>A simple PHP application for Devops Training</h1>
        <hr>
        <?php
          //These are the defined authentication environment in the db service

          // The MySQL service named in the docker-compose.yml.
          $host = 'database';

          // Database use name
          $user = 'MYSQL_USER';

          $mydatabase = 'MY_DATABASE';

          //database user password
          $pass = 'MYSQL_PASSWORD';

          // check the MySQL connection status
          $conn = new mysqli($host, $user, $pass, $mydatabase);
          if ($conn->connect_error) {
              die("Connection failed: " . $conn->connect_error);
          } else {
              echo "Connected to MySQL server successfully!";
          }
        
          $sql = 'SELECT * FROM students';

          if ($result = $conn->query($sql)) {
              while ($data = $result->fetch_object()) {
                  $users[] = $data;
              }
          }
          
          echo "<table border=2>";
          echo "<tr>";
          echo "<th>Nom</th>";
          echo "<th>Prénoms</th>";
          echo "<th>Matricule</th>";
          echo "</tr>";
          foreach ($users as $user) {
              echo "<tr>";
              echo "<td>".$user->nom ."</td>";
              echo "<td>".$user->prenom ."</td>";
              echo "<td>".$user->matricule ."</td>";
              echo "</tr>";
          }
          echo "</table>";
        
        ?>
    </body>
</html>