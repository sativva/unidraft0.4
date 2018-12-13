$(".org-alumni-profile-card__connect-button-expanded").each(function() {
      $(this).click();
      $(".button-primary-large").click();
});


$(".button-secondary-small").each(function() {
    $(this).click();
});

$(".button-secondary-medium").each(function() {
    $(this).click();
    $(".button-primary-large").click();
});

$(".button-secondary-medium").each(function() {
  if (this.innerHTML.indexOf("connecter")) {
    console.log('hoho');
    $(this).click();
    $(".button-primary-large").click();
  }
});
