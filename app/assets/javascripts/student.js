$(document).ready(function() {
  $("input").not("[type=submit]").jqBootstrapValidation({preventSubmit: true});
  // Set random answers for all questions:
  // $(".options").each(function() { var o = $(this).find('input:radio'); o.eq(Math.floor(Math.random() * o.length)).prop('checked', true); });
});
