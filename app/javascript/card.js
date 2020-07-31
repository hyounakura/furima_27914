window.addEventListener("load", function(){

  const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    console.log(process.env.PAYJP_PUBLIC_KEY)
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
  
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      console.log(...formData.entries());
      const card = {
        number: formData.get("item_address[number]"),
        cvc: formData.get("item_address[cvc]"),
        exp_month: formData.get("item_address[exp_month]"),
        exp_year: `20${formData.get("item_address[exp_year]")}`,
      };
      console.log(card)
      debugger
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          console.log(tokenObj)
  
          document.getElementsByName("item_address[number]")[0].removeAttribute("name");
          document.getElementsByName("item_address[cvc]")[0].removeAttribute("name");
          document.getElementsByName("item_address[exp_month]")[0].removeAttribute("name");
          document.getElementsByName("item_address[exp_year]")[0].removeAttribute("name");
          debugger
          document.getElementById("charge-form").submit();
          document.getElementById("charge-form").reset();
        } else {
          console.log(response.error)
          document.getElementsByName("item_address[number]")[0].removeAttribute("name");
          document.getElementsByName("item_address[cvc]")[0].removeAttribute("name");
          document.getElementsByName("item_address[exp_month]")[0].removeAttribute("name");
          document.getElementsByName("item_address[exp_year]")[0].removeAttribute("name");
          document.getElementById("charge-form").submit();
        }
      });
    });
  };

  const btn = document.getElementById("buy-red-btn");
  if (btn != null) {
    btn.addEventListener("click", pay);
  }
});