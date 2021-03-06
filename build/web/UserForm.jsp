<%-- 
    Document   : UserForm
    Created on : 10-may-2021, 20:53:56
    Author     : Vlxdy hishikawa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="VLADIMIR HUANCA">
        <meta name="viewport" content="with=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="Logo.png">
        <title> PRACTICA </title>
    </head>
<style type="text/css">
	@import url("https://fonts.googleapis.com/css?family=Montserrat:400,800");
            * {
                    box-sizing: border-box;
            }

            body {
                background-image: linear-gradient(
                            rgba(0, 0, 0, 0.6),
                            rgba(0, 0, 0, 0.6)
                                    ), url("Fondo.png");
                                    background-repeat: no-repeat;
                                    background-attachment: fixed;
                                    background-size: 100% 100%;

                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    font-family: "Montserrat", sans-serif;
                    height: 100vh;
                    margin: -20px 0 50px;
            }

            h1 {
                    font-weight: bold;
                    margin: 0;
            }

            h2 {
                    text-align: center;
            }

            p {
                    font-size: 14px;
                    font-weight: 100;
                    line-height: 20px;
                    letter-spacing: 0.5px;
                    margin: 20px 0 30px;
            }

            span {
                    font-size: 12px;
            }

            a {
                    color: #333;
                    font-size: 14px;
                    text-decoration: none;
                    margin: 15px 0;
            }

            button {
                    border-radius: 20px;
                    border: 1px solid #ff4b2b;
                    background-color: #ff4b2b;
                    color: #ffffff;
                    font-size: 12px;
                    font-weight: bold;
                    padding: 12px 45px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    transition: transform 80ms ease-in;
            }

            button:active {
                    transform: scale(0.95);
            }

            button:focus {
                    outline: none;
            }

            button.ghost {
                    background-color: transparent;
                    border-color: #ffffff;
            }

            form {
                    background-color: #ffffff;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
                    padding: 0 50px;
                    height: 100%;
                    text-align: center;
            }

            input {
                    background-color: #eee;
                    border: none;
                    padding: 12px 15px;
                    margin: 8px 0;
                    width: 100%;
            }

            .container {
                    background-color: #fff;
                    border-radius: 10px;
                    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
                    position: relative;
                    overflow: hidden;
                    width: 768px;
                    max-width: 100%;
                    min-height: 480px;
            }

            .form-container {
                    position: absolute;
                    top: 0;
                    height: 100%;
                    transition: all 0.6s ease-in-out;
            }

            .sign-in-container {
                    left: 0;
                    width: 50%;
                    z-index: 2;
            }

            .container.right-panel-active .sign-in-container {
                    transform: translateX(100%);
            }

            .sign-up-container {
                    left: 0;
                    width: 50%;
                    opacity: 0;
                    z-index: 1;
            }

            .container.right-panel-active .sign-up-container {
                    transform: translateX(100%);
                    opacity: 1;
                    z-index: 5;
                    animation: show 0.6s;
            }

            @keyframes show {
                    0%,
                    49.99% {
                            opacity: 0;
                            z-index: 1;
                    }

                    50%,
                    100% {
                            opacity: 1;
                            z-index: 5;
                    }
            }

            .overlay-container {
                    position: absolute;
                    top: 0;
                    left: 50%;
                    width: 50%;
                    height: 100%;
                    overflow: hidden;
                    transition: transform 0.6s ease-in-out;
                    z-index: 100;
            }

            .container.right-panel-active .overlay-container {
                    transform: translateX(-100%);
            }

            .overlay {
                    background: #ff416c;
                    background: -webkit-linear-gradient(to right, #ff4b2b, #ff416c);
                    background: linear-gradient(to right, #ff4b2b, #ff416c);
                    background-repeat: no-repeat;
                    background-size: cover;
                    background-position: 0 0;
                    color: #ffffff;
                    position: relative;
                    left: -100%;
                    height: 100%;
                    width: 200%;
                    transform: translateX(0);
                    transition: transform 0.6s ease-in-out;
            }

            .container.right-panel-active .overlay {
                    transform: translateX(50%);
            }

            .overlay-panel {
                    position: absolute;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex-direction: column;
                    padding: 0 40px;
                    text-align: center;
                    top: 0;
                    height: 100%;
                    width: 50%;
                    transform: translateX(0);
                    transition: transform 0.6s ease-in-out;
            }

            .overlay-left {
                    transform: translateX(-20%);
            }

            .container.right-panel-active .overlay-left {
                    transform: translateX(0);
            }

            .overlay-right {
                    right: 0;
                    transform: translateX(0);
            }

            .container.right-panel-active .overlay-right {
                    transform: translateX(20%);
            }

            .social-container {
                    margin: 20px 0;
            }

            .social-container a {
                    border: 1px solid #dddddd;
                    border-radius: 50%;
                    display: inline-flex;
                    justify-content: center;
                    align-items: center;
                    margin: 0 5px;
                    height: 40px;
                    width: 40px;
            }
            #heading { color: #fff; }

</style>
<body>
    <br><br><br>
	<div class="container" id="container">
                <div class="form-container sign-in-container">
                    <form action="InicioUser" method="post">
                        
                                <c:if test="${user.id == 0}">
                                    <h1 align="center" style="color:black;">REGISTRO DE USUARIOS </h1>
                                </c:if>
                                    <c:if test="${user.id != 0}">
                                    <h1 align="center" style="color:black;">MODIFICACION DEL USUARIO "${user.usuario}" </h1>
                                </c:if>
                                <input type="hidden" name="aux" value="${aux}"/>
                                <input type="hidden" name="id" value="${user.id}"/>
                                <div class="social-container">
                                    <img src="Logo.png" width="100">
                                </div>
                                <span>use sus datos</span>
                                <input type="text" name="usuario" value="${user.usuario}" placeholder="registre su usuario"/>
                                <input type="text" name="password" value="${user.password}" placeholder="registre su contrase??a"/>
                                <button>ENVIAR</button>
                        </form>
                </div>
                
                <div class="overlay-container">
                        <div class="overlay">                                
                                <div class="overlay-panel overlay-right">
                                        <h1>??Hola amigo!</h1>
                                        <c:if test="${user.id == 0}">
                                            <p>Ingrese sus datos personales y comience su viaje con nosotros</p>
                                        </c:if>
                                            <c:if test="${user.id != 0}">
                                            <p>Edite corectamente los datos o caso contrario ya no podra acceder </p>
                                        </c:if>
                                        
                                </div>
                        </div>
                </div>
        </div>
     <footer>
        <p>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer> 
	
</body>
</html>
