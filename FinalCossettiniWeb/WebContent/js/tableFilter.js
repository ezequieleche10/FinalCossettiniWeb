//tableFilter
$(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
    var listItem = $('.results tbody').children('tr');
    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
  });
    
  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','false');
  });

  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','true');
  });

  var jobCount = $('.results tbody tr[visible="true"]').length;
    $('.counter').text(jobCount + ' item');

  if(jobCount == '0') {$('.no-result').show();}
    else {$('.no-result').hide();}
		  });
});
//spinner
(function ($) {
  $('.spinner .btn:first-of-type').on('click', function() {
    $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
  });
  $('.spinner .btn:last-of-type').on('click', function() {
    $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
  });
})(jQuery);
//wizard
$(document).ready(function () 
{ var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn'); allWells.hide(); 
navListItems.click(function (e) { e.preventDefault(); var $target = $($(this).attr('href')), $item = $(this); 
if (!$item.hasClass('disabled')) { navListItems.removeClass('btn-primary').addClass('btn-default'); $item.addClass('btn-primary'); 
allWells.hide(); $target.show(); $target.find('input:eq(0)').focus(); } }); 
allNextBtn.click(function(){ var curStep = $(this).closest(".setup-content"), curStepBtn = curStep.attr("id"), nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"), curInputs = curStep.find("input[type='text'],input[type='url']"), isValid = true; $(".form-group").removeClass("has-error"); for(var i=0; i<curInputs.length; i++){ if (!curInputs[i].validity.valid){ isValid = false; $(curInputs[i]).closest(".form-group").addClass("has-error");  } } if (isValid) nextStepWizard.removeAttr('disabled').trigger('click'); }); $('div.setup-panel div a.btn-primary').trigger('click'); });



