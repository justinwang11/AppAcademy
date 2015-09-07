Trello.Collections.Cards = Backbone.Collection.extend({

  url: "api/cards",

  model: Trello.Models.Card,

  initialize: function (options) {
    this.list = options.list;
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
