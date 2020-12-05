const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shippings_orders[number]"),
      cvc: formData.get("shippings_orders[cvc]"),
      exp_month: formData.get("shippings_orders[exp_month]"),
      exp_year: `20${formData.get("shippings_orders[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("number");
      document.getElementById("card-cvc").removeAttribute("cvc");
      document.getElementById("card-exp-month").removeAttribute("exp_month");
      document.getElementById("card-exp-year").removeAttribute("exp_year");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
