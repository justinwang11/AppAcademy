Trello.Collections.Cards = Backbone.Collection.extend({

  url: "api/todo_items",

  model: Trello.Models.TodoItem,

  initialize: function (options) {
    this.card = options.card;
  }
 //  getOrFetch: function (id) {
 //   var boards = this;
 //
 //   var board = this.get(id);
 //   if (board) {
 //     board.fetch();
 //   } else {
 //     board = new Trello.Models.Board({ id: id });
 //     board.fetch({
 //       success: function () { boards.add(board); }
 //     });
 //   }
 //
 //   return board;
 // }

});
