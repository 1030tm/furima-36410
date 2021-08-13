window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    // 販売手数料（10％）
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    // 販売利益
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });

});