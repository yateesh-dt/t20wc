document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("contact-form");
  const nameInput = document.getElementById("name");
  const emailInput = document.getElementById("email");
  const phoneInput = document.getElementById("phone");
  const teamSelect = document.getElementById("team");
  const whatsappContainer = document.getElementById("whatsapp-container");
  const t20Container = document.getElementById("t20-container");
  const errorMessage = document.getElementById("error-message");
  const resetButton = document.getElementById("reset-button");

  teamSelect.addEventListener("change", () => {
    if (teamSelect.value) {
      whatsappContainer.style.display = "block";
      t20Container.style.display = "block";
    } else {
      whatsappContainer.style.display = "none";
      t20Container.style.display = "none";
    }
  });

  form.addEventListener("submit", (event) => {
    event.preventDefault();
    errorMessage.textContent = "";

    if (!validateForm()) {
      errorMessage.textContent =
        "XXXXX Please check your data (Enter valid data based on field) XXXXX";
      return;
    }

    alert("Form submitted successfully!");
  });

  resetButton.addEventListener("click", () => {
    form.reset();
    whatsappContainer.style.display = "none";
    t20Container.style.display = "none";
    errorMessage.textContent = "";
  });

  function validateForm() {
    const name = nameInput.value.trim();
    const email = emailInput.value.trim();
    const phone = phoneInput.value.trim();
    const team = teamSelect.value;

    if (!name || !/^[a-zA-Z\s]+$/.test(name)) {
      return false;
    }

    if (!email || !validateEmail(email)) {
      return false;
    }

    if (!phone || !/^\d+$/.test(phone)) {
      return false;
    }

    if (!team) {
      return false;
    }

    return true;
  }

  function validateEmail(email) {
    const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return re.test(email);
  }
});
