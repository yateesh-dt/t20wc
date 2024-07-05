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
  const thankYouSection = document.getElementById("thank-you-section");
  const submittedDataDiv = document.getElementById("submitted-data");
  const deleteButton = document.getElementById("delete-button");
  const storedData = JSON.parse(localStorage.getItem("contactData"));

  if (storedData) {
    form.style.display = "none";
    displayThankYouMessage(storedData);
  } else {
    form.style.display = "block";
  }
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
    const formData = {
      name: nameInput.value.trim(),
      email: emailInput.value.trim(),
      phone: phoneInput.value.trim(),
      team: teamSelect.value,
      whatsapp: document.getElementById("whatsapp").checked,
      t20: document.querySelector('input[name="t20"]:checked')?.value,
    };

    localStorage.setItem("contactData", JSON.stringify(formData));
    form.style.display = "none";
    displayThankYouMessage(formData);
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
  function displayThankYouMessage(data) {
    thankYouSection.style.display = "block";
    submittedDataDiv.innerHTML = `
            <p><strong>Name:</strong> ${data.name}</p>
            <p><strong>Email:</strong> ${data.email}</p>
            <p><strong>Phone:</strong> ${data.phone}</p>
            <p><strong>Team:</strong> ${data.team}</p>
            <p><strong>WhatsApp Notifications:</strong> ${
              data.whatsapp ? "Yes" : "No"
            }</p>
            <p><strong>Likes T20:</strong> ${
              data.t20
                ? data.t20.charAt(0).toUpperCase() + data.t20.slice(1)
                : "Not answered"
            }</p>
        `;
  }
  deleteButton.addEventListener("click", () => {
    localStorage.removeItem("contactData");
    alert("Data deleted from your local storage");
    thankYouSection.style.display = "none";
    form.style.display = "block";
    form.reset();
  });
});
