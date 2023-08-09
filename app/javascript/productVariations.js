document.addEventListener("DOMContentLoaded", function () {
  const body = document.body;

  body.addEventListener("change", function (event) {
    if (event.target.matches('[name="inventory[product_id]"]')) {
      const selectedProductId = event.target.value;
      const url = `/products/${selectedProductId}/variation_for_product`;

      const variationDropdown = document.querySelector(
        '[name="inventory[variation_id]"]',
      );

      fetch(url)
        .then((response) => response.json())
        .then((data) => {
          // Clear out the current options in the variation dropdown
          while (variationDropdown.firstChild) {
            variationDropdown.removeChild(variationDropdown.firstChild);
          }

          // Populate the variation dropdown with the fetched data
          data.forEach((variation) => {
            const option = document.createElement("option");
            option.value = variation.id;
            option.textContent = variation.model;
            variationDropdown.appendChild(option);
          });
        });
    }
  });
});
