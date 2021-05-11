<%-- 
    Document   : Post
    Created on : 10-may-2021, 19:12:28
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
        *{
                margin:0;
                padding:0;
        }
        section{
           padding:0;
           margin-left: 15px;
           margin-right: 25px;
        }
        body {
  		background-image: linear-gradient(
     		rgba(0, 0, 0, 0.6),
     		rgba(0, 0, 0, 0.6)
   			), url("Fondo.png");
  			background-repeat: no-repeat;
 			background-attachment: fixed;
  			background-size: 100% 100%;
  			background-color:#dbffcc;
            }
        .i {
         background-color: yellow;
        }
        header{
	background:url(image.png); 
        background-repeat: repeat;
 	background-attachment: fixed;
	height:120px;
	width: 100%;
        text-align: center;
        }
        #heading { color: #fff; }
	a,h1,h3,h2,h4,li,p{
		color: white;
                }
        b{
	   color: yellow;
        }
        a{
            text-align: right;
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

        .button2 {background-color: #008CBA;
        text-align: right;
        align-content: right;
        align-items: right} 
        .button3 {background-color: #f44336;
        text-align: right}
        .button4 {background-color: #e7e7e7; color: black;} 
        .button5 {background-color: #555555;} 
        .btn {
            background-color: #f1f1f1;
            border: none;
            color: black;
            padding: 2px 3px;
            text-align: center;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
            margin: 0px 4px;
            cursor: pointer;
            border-radius: 16px;
            opacity: 0.6;
            transition: 0.3s;
          }
          .btn:hover {opacity: 0.1;
            background-color: #f1f1f1;
          }
          .form-popup {
                display: none;
                position: fixed;
                top: 0;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 1;
          }
          .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: black;
          }
          .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
          }
          .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
          }
          .form-container .btn {
                background-color: #04AA6D;
                color: white;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
          }
          .form-container .cancel {
                background-color: red;
          }
          .form-container .btn:hover, .open-button:hover {
                opacity: 1;
          }
    </style>
    <body>
        <header>
            <br>
            <div>
                <a href="Index.jsp" onclick="return(confirm('Realmente Esta Seguro'))"><button class="btn" style="float: right; margin-right: 75px;"><img src="1.png" width="14"> Salir</button></a>
                <button class="btn" style="float: right;" onclick="openForm()"><img src="2.png" width="14"> Administrador</button></a>
            </div>
            <div class="form-popup" id="myForm">
                <form action="InicioUser"class="form-container">
                    <img src="a1a.png" width="100">
                        <br><br>
                    <h1>¡BIENVENIDO!</h1>
                        <br>
                        <c:forEach var="item" items="${lis}">
                       <input type="hidden" name="action" value="edit"/>
                       <input type="hidden" name="id" value="${item.id}"/>
                    <h3> ${item.usuario} Mantente conectado con nosotros</h3>
                        <br><br>
                    <a href="InicioUser?action=edit&id=${item.id}"><button class="btn">EDITAR</button></a>
                    </c:forEach>
                    <button type="button" class="btn cancel" onclick="closeForm()">CERRAR</button>
                </form>
            </div>
            <br><br>
            <div><h1 align="center">BLOG DE SALUD</h1></div>
        </header>
        <br>
        <p><a href="Inicio?action=add"><button class="button">NUEVO POST</button></a></p>
        <br>
        <section>
        <c:forEach var="item" items="${posteos}">
            <div>
                <p>${item.fecha}</p>
            </div>
            <div>
                <h1><strong>${item.titulo}</strong></h1>
            </div>
            <div>
                <p>${item.contenido}</p>
            </div>
            <div>
                <br>
                <p>Autor:  Administrador
                        <c:if test = "${us.id} = ${item.id}">
                            <c:out value = "${us.usuario}"/><p>
                         </c:if>
                 
                <a href="Inicio?action=edit&id=${item.id}"><button class="btn" style="float: right; margin-right: 75px;" ><img src="escritura.png" width="13"> Modificar</button></a>
                <a href="Inicio?action=delete&id=${item.id}" onclick="return(confirm('Realmente Esta Seguro'))"><button class="btn" style="float: right;"><img src="eliminar.png" width="14"> Eliminar</button></a>
                </p>
            </div>
                <div>
                    <img src="d12.png"  width="100%" height="20">
                </div>
        </c:forEach>
      </section>
       
   
        
     <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
        
        <script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>
    </body>
</html>