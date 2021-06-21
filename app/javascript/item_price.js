window.addEventListener('load', () => {


  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
   
  
  
  
  const addTaxPriceInput = document.getElementById("add-tax-price");
  
   addTaxPriceInput.innerHTML=(Math.floor(inputValue*0.1));
   

   
  const profitInput = document.getElementById("profit");
  const value_result = inputValue * 0.1

  profitInput.innerHTML = (Math.floor(inputValue-value_result));

 



 
  
})
})