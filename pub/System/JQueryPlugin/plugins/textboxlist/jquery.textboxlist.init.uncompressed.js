(function($) {
  $(function() {
    $("input.jqTextboxList").not(".jqInited").each(function() {
      var $this = $(this);
      $this.addClass("jqInited");
      var opts = $.extend({}, $this.metadata());
      $this.textboxlist(opts);
    });
  });
})(jQuery);
