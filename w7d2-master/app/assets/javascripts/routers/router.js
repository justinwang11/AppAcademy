Pokedex.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'pokemonIndex',
    'pokemon/:id': 'pokemonDetail',
    'pokemon/:pokemonId/toys/:toyId': 'toyDetail'
  },

  pokemonIndex: function (callback) {
    var index = new Pokedex.Views.PokemonIndex();
    this._pokemonIndex = index;
    this._pokemonIndex.refreshPokemon(callback);
    $("#pokedex .pokemon-list").html(this._pokemonIndex.$el);
  },

  pokemonDetail: function (id) {
    var that = this;
    if (this._pokemonIndex === undefined) {
      this.pokemonIndex(function () {
        that.pokemonDetail(id);
        return;
      });
    }
    var poke = this._pokemonIndex.collection.get(id);
    var detail = new Pokedex.Views.PokemonDetail(poke);
    this._pokemonDetail = detail;
    $("#pokedex .pokemon-detail").html(detail.$el);
    poke.fetch();
  },

  toyDetail: function (pokemonId, toyId) {
    var that = this;
    if (this._pokemonDetail === undefined) {
      this.pokemonDetail(function () {
        that.toyDetail(pokemonId, toyId);
        return;
      });
    }
    var toy = this._pokemonDetail.model.toys().get(toyId);
    var toyView = new Pokedex.Views.ToyDetail(toy);
    $("#pokedex .toy-detail").html(toyView.content);
    // toyView.render();
  }

});
