<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
              <c:if test="${not empty contacts}">
                <table border="1" class="contact-list">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Teléfono</th>
                      <th>Correo</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="contact" items="${contacts}">
                      <tr>
                        <td>${contact.id}</td>
                        <td>${contact.name}</td>
                        <td>${contact.phone}</td>
                        <td>${contact.email}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </c:if>
            </div>

            <div class="buttons-container">
              <form action="ContactServlet" method="GET">
                <input type="hidden" name="action" value="read" />
                <input type="submit" value="Read contacts" />
              </form>
              <button class="open-create-modal-button">Create contact</button>
              <button class="open-update-modal-button">Update contact</button>
              <button class="open-delete-modal-button">Delete contact</button>
            </div>

            <!-- Crear Contacto -->
            <div class="modal-overlay-create">
              <div class="modal-create">
                <h2>Crear Contacto</h2>
                <form action="ContactServlet" method="POST">
                  <input type="hidden" name="action" value="create" />
                  <label for="name">Nombre:</label>
                  <input type="text" id="name" name="name" required />
                  <br />
                  <label for="phone">Teléfono:</label>
                  <input type="text" id="phone" name="phone" required />
                  <br />
                  <label for="email">Correo:</label>
                  <input type="email" id="email" name="email" />
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
                <form action="ContactServlet" method="POST">
                  <input type="hidden" name="action" value="update" />
                  <label for="idUpdate">ID del Contacto:</label>
                  <input type="text" id="idUpdate" name="id" required />
                  <br />
                  <label for="nameUpdate">Nuevo Nombre:</label>
                  <input type="text" id="nameUpdate" name="name" />
                  <br />
                  <label for="phoneUpdate">Nuevo Teléfono:</label>
                  <input type="text" id="phoneUpdate" name="phone" />
                  <br />
                  <label for="emailUpdate">Nuevo Correo:</label>
                  <input type="email" id="emailUpdate" name="email" />
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
                <form action="ContactServlet" method="POST">
                  <input type="hidden" name="action" value="delete" />
                  <label for="idDelete">ID del Contacto a Borrar:</label>
                  <input type="text" id="idDelete" name="id" required />
                  <br />
                  <input type="submit" value="Borrar" />
                  <button type="button" class="close-modal-delete">
                    Cerrar
                  </button>
                </form>
              </div>
            </div>

            <!-- <div class="container__form">
              <form action="login.php" method="post" class="login-form">
                <div>

                </div>
                <fieldset class="login-form__body">
                  <legend class="login-form__title">Edit contact list</legend>


                  <div class="login-form__button-container">
                    <button class="login-form__button" type="submit">
                      Iniciar sesión
                    </button>
                  </div>
                </fieldset>
              </form>
            </div> -->
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
