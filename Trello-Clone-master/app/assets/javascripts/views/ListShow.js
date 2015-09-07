Trello.Views.ListShow = Backbone.CompositeView.extend({

  template: JST['show_list'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.addCardView);
    this.model.cards().each(this.addCardView.bind(this));
  },

  render: function () {
    var content = this.template({ list: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addCardView: function (card) {
    var subView = new Trello.Views.CardShow({ model: card });
    this.addSubview(".cards", subView);
  }
});
