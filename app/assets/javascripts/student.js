$(document).ready(function() {
  $('body').scrollspy({ target: "#page-navbar" });
  $("input").not("[type=submit]").jqBootstrapValidation({preventSubmit: true}));
});
