Trello.Collections.Boards = Backbone.Collection.extend({

  url: "api/boards",

  model: Trello.Models.Board,

  getOrFetch: function (id) {
   var boards = this;

   var board = this.get(id);
   if (board) {
     board.fetch();
   } else {
     board = new Trello.Models.Board({ id: id });
     board.fetch({
       success: function () { boards.add(board); }
     });
   }

   return board;
 }

});
