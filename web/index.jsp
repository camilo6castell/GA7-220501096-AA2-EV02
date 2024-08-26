  <%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="./reset.css" />
    <link rel="stylesheet" href="./styles.css" />
    <link rel="stylesheet" href="modal-create.css" />
    <title>Edit contact list</title>
  </head>
  <body>
    <div class="app">
      <div class="main-section">
        <div class="main-section__action">
          <header class="main-bar">
            <ul class="main-bar__items">
              <li class="main-bar__item">
                <img class="logo" src="./logo.png" alt="logo-cryptomessage" />
              </li>
              <li class="main-bar__item">About</li>
              <li class="main-bar__item">Contact</li>
              <li class="main-bar__item">Sponsor me!</li>
            </ul>
          </header>

          <div class="action__container">
            <h1>Gestión de Contactos</h1>

            <div class="contacts-container">
              <c:if test="${not empty users}">
                <table border="1" class="contact-list">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Clave pública</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="user" items="${users}">
                      <tr>
                        <td>${user.userId}</td>
                        <td>${user.username}</td>
                        <td>${user.publicKey}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </c:if>
            </div>

            <div class="buttons-container">
              <form action="EditContactListServlet" method="GET">
                <input type="hidden" name="action" value="read" />
                <input id="readContactsButton" type="submit" value="Read contacts" />
              </form>
              <button class="open-create-modal-button">Create contact</button>
              <button class="open-update-modal-button">Update contact</button>
              <button class="open-delete-modal-button">Delete contact</button>
            </div>

            <!-- Crear Contacto -->
            <div class="modal-overlay-create">
              <div class="modal-create">
                <h2>Crear Contacto</h2>
                <form action="EditContactListServlet" method="POST">
                  <input type="hidden" name="action" value="create" />
                  <label for="username">Nombre:</label>
                  <input type="text" id="username" name="username" required />
                  <br />
                  <label for="publicKey">Public key:</label>
                  <input type="text" id="publicKey" name="publicKey" required />
                  <br />
                  <input type="submit" value="Crear" />
                  <button type="button" class="close-modal-create">
                    Cerrar
                  </button>
                </form>
              </div>
            </div>

            <!-- Actualizar Contacto -->
            <div class="modal-overlay-update">
              <div class="modal-update">
                <h2>Actualizar Contacto</h2>
                <form action="EditContactListServlet" method="POST">
                  <input type="hidden" name="action" value="update" />
                  <label for="idUpdate">ID del Contacto:</label>
                  <input type="text" id="idUpdate" name="idUpdate" required />
                  <br />
                  <label for="usernameUpdate">Nuevo Nombre:</label>
                  <input type="text" id="usernameUpdate" name="usernameUpdate" />
                  <br />
                  <label for="publicKeyUpdate">Nueva public Key:</label>
                  <input type="text" id="publicKeyUpdate" name="publicKeyUpdate" />
                  <br />
                  <input type="submit" value="Actualizar" />
                  <button type="button" class="close-modal-update">
                    Cerrar
                  </button>
                </form>
              </div>
            </div>

            <div class="modal-overlay-delete">
              <div class="modal-delete">
                <!-- Borrar Contacto -->
                <h2>Borrar Contacto</h2>
                <form action="EditContactListServlet" method="POST">
                  <input type="hidden" name="action" value="delete" />
                  <label for="idDelete">ID del Contacto a Borrar:</label>
                  <input type="text" id="idDelete" name="idDelete" required />
                  <br />
                  <input type="submit" value="Borrar" />
                  <button type="button" class="close-modal-delete">
                    Cerrar
                  </button>
                </form>
              </div>
            </div>
            
          </div>
        </div>
        <div class="main-section__presentation">
          <div class="main-bar">
            <ul class="main-bar__items">
              <li class="main-bar__item">°</li>
              <li class="main-bar__item">°</li>
              <li class="main-bar__item">°</li>
              <li class="main-bar__item">°</li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <script src="./main.js"></script>
  </body>
</html>
