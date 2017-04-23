$(document).ready(function(){
  var total_price_elem = $('tr.total-price .pricable');
  var old_delivery_elem = $('input[name = delivery]:checked');
  var total_delivery_price_elem = $('tr.delivery-price .pricable');
  var old_total_price = +total_price_elem.text().slice(1);

  $('.radio-label').click(function(){
    var old_delivery_price = old_delivery_elem.length
        ? old_delivery_elem.closest('tr').find('.price').text().slice(1)
        : 0;
    var new_delivery_price = +$(this).closest('tr').find('.price').text().slice(1);
    total_delivery_price_elem.text('€' + new_delivery_price);
    total_price_elem.text('€' + (old_total_price - old_delivery_price + new_delivery_price));
  });

  $('.checkbox-icon').click(function(){
      var check = $('.checkbox-input');
      $('.shipping-fields').toggle();
      check.val(check[0].checked ? "true" : "false");
  })
});