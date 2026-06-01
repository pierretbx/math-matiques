document.addEventListener("DOMContentLoaded", function () {
  const toggle = document.querySelector(".toggle");
  const menu = document.querySelector(".menu");

  if (toggle && menu) {
    toggle.addEventListener("click", function () {
      const isOpen = menu.classList.toggle("active");
      toggle.setAttribute("aria-expanded", String(isOpen));
    });
  }

  const schoolSwitch = document.querySelector(".school-switch-input");

  if (schoolSwitch) {
    const savedMode = (function () {
      try {
        return localStorage.getItem("schoolMode");
      } catch (error) {
        return null;
      }
    })();
    const pageMode = document.body.dataset.schoolPage;
    const initialMode = pageMode === "college" ? "college" : savedMode === "college" ? "college" : "lycee";

    function setSchoolMode(mode) {
      document.body.dataset.schoolMode = mode;
      schoolSwitch.checked = mode === "college";
      try {
        localStorage.setItem("schoolMode", mode);
      } catch (error) {
        return;
      }
    }

    setSchoolMode(initialMode);

    schoolSwitch.addEventListener("change", function () {
      setSchoolMode(schoolSwitch.checked ? "college" : "lycee");
    });
  }

  document.querySelectorAll(".show-more").forEach(function (button) {
    button.addEventListener("click", function () {
      const article = button.closest("article");
      const content = article ? article.querySelector(".content") : null;
      if (content) {
        const isOpen = content.classList.toggle("active");
        button.setAttribute("aria-expanded", String(isOpen));
        button.textContent = isOpen ? "Réduire les questions" : "Voir toutes les questions";
      }
    });
  });

  document.querySelectorAll(".show-correction").forEach(function (button) {
    button.addEventListener("click", function () {
      const article = button.closest("article");
      const correction = article ? article.querySelector(".seecorrect") : null;
      if (correction) {
        const isOpen = correction.classList.toggle("active");
        button.setAttribute("aria-expanded", String(isOpen));
        button.textContent = isOpen ? "Masquer la correction" : "Voir la correction";
      }
    });
  });

});
