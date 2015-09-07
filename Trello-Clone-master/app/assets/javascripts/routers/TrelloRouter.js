Trello.Routers.TrelloRouter = Backbone.Router.extend({

  routes: {
    "" : "indexBoard",
    "boards/:id": "showBoard"
  },

  initialize: function (options) {
    this.boards = options.boards;
    this.$rootEl = options.$rootEl;
  },

  indexBoard: function () {
    this.boards.fetch();
    var indexView = new Trello.Views.BoardsIndex({
      collection: this.boards
    });
    this._swapView(indexView);
  },

  showBoard: function (id) {
    var board = this.boards.getOrFetch(id);
    var showView = new Trello.Views.BoardShow({
      model: board
    });
    this._swapView(showView);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this.currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }

});
