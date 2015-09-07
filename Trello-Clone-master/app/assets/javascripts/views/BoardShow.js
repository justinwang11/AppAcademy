Trello.Views.BoardShow = Backbone.CompositeView.extend({

  template: JST['show_board'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addListView);
    this.model.lists().each(this.addListView.bind(this));
  },

  render: function () {
    var content = this.template({ board: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addListView: function (list) {
    var subView = new Trello.Views.ListShow({ model: list });
    this.addSubview(".lists", subView);
  }
});
