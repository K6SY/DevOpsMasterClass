<!DOCTYPE html>
<html>
    <head>
        <title>Simple application PHP</title>
        <link rel="stylesheet" href="home.css"/>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>Ceci est une nouvelle modification. A simple PHP application for Devops Training</h1>
        <hr>
        <?php
          //These are the defined authentication environment in the db service

          // The MySQL service named in the docker-compose.yml.
          $host = 'database';

          // Database use name
          $user = 'MYSQL_USER';

          //database user password
          $pass = 'MYSQL_PASSWORD';

          // check the MySQL connection status
          $conn = new mysqli($host, $user, $pass);
          if ($conn->connect_error) {
              die("Connection failed: " . $conn->connect_error);
          } else {
              echo "Connected to MySQL server successfully!";
          }
        ?>
        <?php
          echo "<h3> Liste de présence du ".date('Y/m/d')."<h3>";
        ?>
        <table border='2'>
            <tr>
              <th>Prénom</th>
              <th>Nom</th>
              <th>Matricule</th>
            </tr>
            <tr>
              <td>Fallou</td>
              <td>Diop</td>
              <td>SSI02389</td>
            </tr>
            <tr>
              <td>Abibatou</td>
              <td>Fall</td>
              <td>SSI02390</td>
            </tr>
            <tr>
              <td>Pierre</td>
              <td>Ngom</td>
              <td>SSI02391</td>
            </tr>
            
          </table>
          
    </body>
</html>