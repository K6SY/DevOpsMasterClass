<!DOCTYPE html>
<html>
    <head>
        <title>Simple application PHP</title>
        <link rel="stylesheet" href="home.css"/>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>A simple PHP application for Devops Training</h1>
        <hr>
        <?php
          echo "<h3> Liste de présence du ".date('Y/m/d')."<h3>";
        ?>
        
        <img src='./images/download.png'/>
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