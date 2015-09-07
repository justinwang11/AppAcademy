window.Trello = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    new Trello.Routers.TrelloRouter({
      boards: new Trello.Collections.Boards(),
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Trello.initialize();
});
