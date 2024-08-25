// Esperar a que el DOM cargue
document.addEventListener("DOMContentLoaded", function () {
  // Función para abrir el modal
  function openModal(htmlElement) {
    return function () {
      htmlElement.style.display = "flex";
    };
  }

  // Función para cerrar el modal
  function closeModal(htmlElement) {
    return function () {
      htmlElement.style.display = "none";
    };
  }

  const modalCreateOverlay = document.querySelector(".modal-overlay-create");
  const modalUpdateOverlay = document.querySelector(".modal-overlay-update");
  const modalDeleteOverlay = document.querySelector(".modal-overlay-delete");

  // Abrir el modal cuando se quiera
  document
    .querySelector(".open-create-modal-button")
    .addEventListener("click", openModal(modalCreateOverlay));

  document
    .querySelector(".open-update-modal-button")
    .addEventListener("click", openModal(modalUpdateOverlay));

  document
    .querySelector(".open-delete-modal-button")
    .addEventListener("click", openModal(modalDeleteOverlay));

  // Cerrar el modal al hacer clic en el botón de cerrar

  document
    .querySelector(".close-modal-create")
    .addEventListener("click", closeModal(modalCreateOverlay));
  document
    .querySelector(".close-modal-update")
    .addEventListener("click", closeModal(modalUpdateOverlay));
  document
    .querySelector(".close-modal-delete")
    .addEventListener("click", closeModal(modalDeleteOverlay));

  // Cerrar el modal al hacer clic fuera del modal
  modalCreateOverlay.addEventListener("click", function (e) {
    if (e.target === modalCreateOverlay) {
      closeModal(modalCreateOverlay)();
    }
  });

  modalUpdateOverlay.addEventListener("click", function (e) {
    if (e.target === modalUpdateOverlay) {
      closeModal(modalUpdateOverlay)();
    }
  });

  modalDeleteOverlay.addEventListener("click", function (e) {
    if (e.target === modalDeleteOverlay) {
      closeModal(modalDeleteOverlay)();
    }
  });
});
