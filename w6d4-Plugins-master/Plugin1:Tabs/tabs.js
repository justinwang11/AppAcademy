(function () {
  // if (typeof Tabs === "undefined") {
  //   var Tabs = window.Tabs = {};
  // }


  $.Tabs = function (el) {
    this.$el = $(el);
    this.$contentTabs = $(this.$el.data("content-tabs"));
    this.$activeTab = $(this.$contentTabs.children(".active"));
    this.$activeListItem = $($("ul.tabs").children(".active"));
    this.$el.on("click", "li", this.clickTab.bind(this));
  };

  $.fn.tabs = function () {
    return this.each(function () {
      new $.Tabs(this);
    });
  };

  $.Tabs.prototype.clickTab = function (event) {
    event.preventDefault();

    // debugger;
    this.$activeListItem.removeClass("active");
    var $targetListItem = $(event.currentTarget);
    this.$activeListItem = $targetListItem;



    this.$activeTab.removeClass("active");
    this.$activeTab.addClass("transitioning");
    var activeLIHelper = $targetListItem.find("a").attr("for");
    var $targetTab = $(activeLIHelper);

    this.$activeTab.one("transitionend", function (el) {
      $targetTab.addClass("active transitioning");
      $(this).removeClass("transitioning");
      setTimeout(function() {
        $targetTab.removeClass("transitioning");
      }, 0);
    }).bind(this);

    $targetListItem.addClass("active");
    this.$activeTab = $targetTab;
  };

})();
