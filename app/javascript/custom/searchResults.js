document.addEventListener('turbo:load', function() {
    const input = document.getElementById('product_search');
    const resultsDiv = document.getElementById('results');
  
    input.addEventListener('keyup', function() {
      const query = this.value;
  
      // Only start the search when there are 4 or more characters
      if (query.length >= 4) {
        fetch(`/products?query=${query}`, {
          headers: {
            'Accept': 'application/json'
          }
        })
        .then(response => response.json())
        .then(data => {
          let html = data.map(product => `<div class="hover:underline"><a href="/products/${product.id}">${product.name}</a></div>`).join('');
          resultsDiv.innerHTML = html;
        })
        .catch(error => {
          resultsDiv.innerHTML = `<div>There was an error fetching the results: ${error}</div>`;
        });
      }
    });
  });
  