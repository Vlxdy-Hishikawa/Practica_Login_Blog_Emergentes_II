<%-- 
    Document   : MostrarUser
    Created on : 10-may-2021, 22:13:47
    Author     : Vlxdy Hishikawa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="VLADIMIR HUANCA">
        <meta name="viewport" content="with=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="Logo.png">
        <title> PRACTICA </title>
    </head>
    <style>
        body {
  		background-image: linear-gradient(
     		rgba(0, 0, 0, 0.6),
     		rgba(0, 0, 0, 0.6)
   			), url("Fondo.png");
  			background-repeat: no-repeat;
 			background-attachment: fixed;
  			background-size: 100% 100%;
  			padding: 20px;
  			background-color:#dbffcc;
            }
        .i {
         background-color: yellow;
        }
        #heading { color: #fff; }
	a,h1,h2,h4,li{
		color: white;
                }
        b{
	   color: yellow;
        }
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        }
        
        th {
          border: 1px solid white;
          background-color:black;
          color: white;
          text-align: left;
          padding: 8px;
        }

        td {
          border: 1px solid black;
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(odd) {
          background-color: #dddddd;
        }
        tr:nth-child(even) {
          background-color: white;
          color:black;
        }
        .button {
            background-color: #4CAF50; 
            border: none;
            color: white;
            padding: 6px 13px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 4px 2px;
            cursor: pointer;
          }

        .button2 {background-color: #008CBA;} 
        .button3 {background-color: #f44336;}
        .button4 {background-color: #e7e7e7; color: black;} 
        .button5 {background-color: #555555;} 
    </style>
    <body>
        <h1 align="center">MOSTRANDO USUARIOS</h1>
        <p><a href="InicioUser?action=add"><button class="button">NUEVO</button></a></p>

        <table border="1">
            <tr>
                <th><b>ID</b></th>
                <th><b>USUARIO</b></th>
                <th><b>PASSWORD</b></th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${users}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.usuario}</td>
                    <td>${item.password}</td>
                    <td><a href="InicioUser?action=edit&id=${item.id}"><button class="button button2"><img src="escritura.png" width="13"> MODIFICAR</button></a></td>
                    <td><a href="InicioUser?action=delete&id=${item.id}" onclick="return(confirm('Realmente Esta Seguro'))"><button class="button button3"><img src="eliminar.png" width="14"> ELIMINAR</button></a></td>
                </tr>
            </c:forEach> 
        </table>
     <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>
