Trello.Views.BoardsIndex = Backbone.View.extend({

  template: JST['index_board'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ boards: this.collection });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }

});
