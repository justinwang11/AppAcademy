Pokedex.Views.PokemonIndex = Backbone.View.extend({
  initialize: function(){
    this.collection = new Pokedex.Collections.Pokemon();
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addPokemonToList)
  },

  events: { "click li" : "selectPokemonFromList" },

  render: function (){
    var that = this;
    this.$el.empty();
    this.collection.each(function (pokemon) {
      that.addPokemonToList(pokemon);
    });
  },

  addPokemonToList: function (pokemon) {
    var $li = JST['pokemonListItem']({ pokemon: pokemon })
    this.$el.append($li);
  },

  refreshPokemon: function (callback) {
    var that = this;

    this.collection.fetch({
      success: function () {
        that.collection.each(function (poke) {
          that.addPokemonToList(poke);
        });
        callback && callback();
      }
    });
  },

  selectPokemonFromList: function(event){
    var id = $(event.currentTarget).data('id');
    Backbone.history.navigate('pokemon/'+id, {trigger: true});
  }

});
