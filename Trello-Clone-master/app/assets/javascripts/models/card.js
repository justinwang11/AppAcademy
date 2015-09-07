Trello.Models.Card = Backbone.Model.extend({

  urlRoot: "api/cards",

  parse: function (payload) {
    if (payload.todoItems) {
      this.todoItems().set(payload.todoItems, { parse: true });
      delete payload.lists;
    }
    return payload;
  },

  todoItems: function () {
    if (!this._todoItems) {
      this._todoItems = new Trello.Collections.TodoItems([], { card: this });
    }

    return this._todoItems;
  }

});
