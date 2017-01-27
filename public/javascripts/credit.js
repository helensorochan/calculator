$(document).ready(function () {
  $(document).on('click', '#calculate_credit', function(e) {
    e.preventDefault();

    var $form = $(this).closest('form');
    var $percent = $form.find('#percent');
    var $total = $form.find('#total');
    var $term = $form.find('#term');

    if($percent.val().length && $total.val().length && $term.val().length){
      $form.submit();
    }
    else{
      alert('Please fill in all data!');
    }
  })
})