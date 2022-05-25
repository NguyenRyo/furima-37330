window.addEventListener('load', () => {

  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    const itemPriceValue = itemPrice.value;
    const Tax = 0.1;
    const tax_fee = Math.floor(itemPriceValue * Tax);
    const profit = Math.floor(itemPriceValue - tax_fee);
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = tax_fee;
    profitArea.innerHTML = profit;
  });

});

