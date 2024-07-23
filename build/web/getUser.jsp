<%-- 
    Document   : getUser
    Created on : Jul 22, 2024, 11:03:39 PM
    Author     : r4d3o
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Get User</title>
</head>
<body>
    <h1>Get User by ID</h1>
    <form action="getUser" method="get">
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId">
        <input type="submit" value="Get User">
    </form>

    <div>
        <!-- Los resultados se mostrarán aquí -->
        <jsp:include page="getUser" flush="true"/>
    </div>
</body>
</html>

