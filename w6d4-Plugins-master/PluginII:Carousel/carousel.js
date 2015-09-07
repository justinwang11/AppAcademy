(function () {

  $.Carousel = function (el) {
    this.$el = $(el);
    this.activeIdx = 0;
    $("img:first-child").addClass("active");
    $(".slide-right").on("click", this.slideRight.bind(this));
    $(".slide-left").on("click", this.slideLeft.bind(this));
  };

  $.fn.carousel = function () {
    return this.each(function () {
      new $.Carousel(this);
    });
  };

  $.Carousel.prototype.slideRight = function () {
    event.preventDefault();
    $("img").eq(this.activeIdx).addClass("right");
    this.slide(-1);
  };

  $.Carousel.prototype.slideLeft = function () {
    event.preventDefault();
    $("img").eq(this.activeIdx).addClass("left");
    this.slide(1);
  };

  $.Carousel.prototype.slide = function (dir) {
    var $activeImg = $("img").eq(this.activeIdx);
    var $newActiveImg = $("img").eq(this.activeIdx + dir);
    $newActiveImg.addClass("active");
    if (dir === -1) {

      $activeImg.addClass("right");
      $newActiveImg.addClass("left");

      setTimeout(function() {
        $newActiveImg.removeClass("left");
      }, 0);

      $activeImg.one("transitionend", function (el) {
        $(this).removeClass("right");
      }).bind(this);

    } else {

      $activeImg.addClass("left");
      $("img").eq(this.activeIdx + dir).addClass("right");

      setTimeout(function() {
        $newActiveImg.removeClass("right");
      }, 0);

      $activeImg.one("transitionend", function (el) {
        $(this).removeClass("left");
      }).bind(this);
    }

    $activeImg.one("transitionend", function (el) {
      $(this).removeClass("left");
    });

    this.activeIdx = this.activeIdx + dir;
  };

})();
