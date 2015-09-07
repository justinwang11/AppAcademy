Trello.Collections.Lists = Backbone.Collection.extend({

  url: "api/lists",

  model: Trello.Models.List,

  initialize: function (models, options) {
    this.board = options.board;
  },

 //  getOrFetch: function (id) {
 //   var lists = this;
 //
 //   var list = this.get(id);
 //   if (list) {
 //     list.fetch();
 //   } else {
 //     list = new Trello.Models.List({ id: id });
 //     list.fetch({
 //       success: function () { lists.add(list); }
 //     });
 //   }
 //
 //   return list;
 // }

});
