window.addEventListener('load', () => {


  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  
  
  
  const addTaxPriceInput = document.getElementById("add-tax-price");
  
   addTaxPriceInput.innerHTML=(Math.floor(inputValue*0.1));
   console.log(addTaxPriceInput);

  
  
  const profitInput = document.getElementById("profit");
  const value_result = inputValue * 0.1
  console.log(value_result)

  profitInput.innerHTML = (Math.floor(inputValue-value_result));
  console.log(profitInput); 
 



 
  
})
})