jQuery(function($) {
    $("a[rel^='lightbox']").slimbox({
      resizeDuration:300,
      captionAnimationDuration:200,
      imageFadeDuration:300
    },
    function(el) {
      var metadata = $(el).metadata();
      var href = metadata.origurl || el.href;
      return [el.href, '<a href="' + href + '">'+el.title+'</a>'];
    },
    function(el) {
      return (this == el) || ((this.rel.length > 8) && (this.rel == el.rel));
    });
});