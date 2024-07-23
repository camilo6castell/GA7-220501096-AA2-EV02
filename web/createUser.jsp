<%-- 
    Document   : createUser
    Created on : Jul 22, 2024, 11:05:13 PM
    Author     : r4d3o
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
</head>
<body>
    <h1>Create User</h1>
    <form action="createUser" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username">
        <br>
        <label for="passwordHash">Password Hash:</label>
        <input type="text" id="passwordHash" name="passwordHash">
        <br>
        <label for="publicKey">Public Key:</label>
        <input type="text" id="publicKey" name="publicKey">
        <br>
        <input type="submit" value="Create User">
    </form>

    <div>
        <!-- Los resultados se mostrarán aquí -->
        <jsp:include page="createUser" flush="true"/>
    </div>
</body

