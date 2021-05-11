<%-- 
    Document   : PostForm
    Created on : 10-may-2021, 19:17:36
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
        #heading { color: #fff; }
        a,h1,h2,h4,li{
		color: white;
                }
        form{
		width: 480px;
		padding: 16px;
		border-radius: 0px;
		margin: auto;
		background-color: #ccf;
	}
	form input[type="number"]{
		width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
        form input[type="text"]{
		width: 300px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
	form input[type="submit"]{
		width: 100%;
		padding: 8px 16px;
		margin-top: 32px;
		border:1px solid #1e3300;
		border-radius: 5px;
		display: block;
		color: #fff;
		background-color:#1e3300;
	}
	form input[type="submit"]:hover{
            
		cursor:pointer;
	}
        SELECT{ 
                width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:  #f6f6f6;
		margin:8px 0;
		display: inline-block;
            }
            textarea{
		width: 100%;
		height: 120px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin: 8px 0;
		resize: none;
		display: block;
	}
    </style>
    <body>
        <c:if test="${posteo.id == 0}">
            <h1 align="center">REGISTRO DE POST </h1>
        </c:if>
        <c:if test="${posteo.id != 0}">
                <h1 align="center">MODIFICACION DEL REGISTRO DEL POST "${posteo.titulo}" </h1>
        </c:if>

            <form action="Inicio" method="post">
                <h3 align="center">
                <c:if test="${posteo.id == 0}">
                    INGRESE LOS DATOS DEL POST
                </c:if>
                <c:if test="${posteo.id != 0}">
                    MODIFIQUE LOS DATOS DEL POST
                </c:if> 
            </h3>
                <input type="hidden" name="id" value="${posteo.id}"/>
            <table>
                <tr>
                    <td>FECHA:</td>
                    <td><input type="date" name="fecha" value="${posteo.fecha}" required/></td>
                </tr>
                <tr>
                    <td>TITULO:</td>
                    <td ><input name="titulo" type="text" required value="${posteo.titulo}" size="80" required></td> 
                </tr>
                <tr>
                    <td>CONTENIDO:</td>
                    <td><textarea name="contenido" required> ${posteo.contenido}</textarea> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="enviar"/></td>
                </tr>
            </table>
            </form>
    <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>