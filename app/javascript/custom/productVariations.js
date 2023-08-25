document.addEventListener("turbo:load", function () {
  const body = document.body;
  const productDropdown = document.querySelector('[name="inventory[product_id]"]');
  const variationDropdown = document.querySelector('[name="inventory[variation_id]"]');

  if (productDropdown && variationDropdown) {

    function fetchVariationsForProduct(selectedProductId) {
      const url = `/products/${selectedProductId}/variation_for_product`;

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

    productDropdown.addEventListener("change", function () {
      const selectedProductId = productDropdown.value;
      fetchVariationsForProduct(selectedProductId);
    });

    // If a product is pre-selected when the page loads, fetch its variations
    if (productDropdown.value) {
      fetchVariationsForProduct(productDropdown.value);
    }
  }
});
