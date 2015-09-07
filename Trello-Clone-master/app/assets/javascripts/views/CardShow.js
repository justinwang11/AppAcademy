Trello.Views.CardShow = Backbone.CompositeView.extend({

  template: JST['show_card'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.todoItems(), "add", this.addTodoItemView);
    this.model.todoItems().each(this.addTodoItemView.bind(this));
  },

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTodoItemView: function (todoItem) {
    var subView = new Trello.Views.TodoItemShow({ model: todoItem });
    this.addSubview(".todoItems", subView);
  }
});
