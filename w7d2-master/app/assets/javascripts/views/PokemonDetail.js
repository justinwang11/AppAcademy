Pokedex.Views.PokemonDetail = Backbone.View.extend({
  initialize: function (pokemon) {
    this.model = pokemon;
    this.template = JST['pokemonDetail']({ pokemon: pokemon });
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click li" : 'selectToyFromList'
  },

  render: function () {
    this.$el.html(this.template);
    var that = this;
    this.model.toys().each( function (toy) {
        that.$el.append(JST['toyListItem']({toy: toy}) );
    });
  },

  selectToyFromList: function (event) {
    var toyId = $(event.currentTarget).data('toy-id');
    var pokemonId = $(event.currentTarget).data('pokemon-id');
    var toy = this.model.toys().get(toyId);
    Backbone.history.navigate("pokemon/"+pokemonId+"/toys/"+toyId, { trigger: true });
    // var toyView = new Pokedex.Views.ToyDetail(toy);
    // $("#pokedex .toy-detail").append(toyView.$el);
    // toyView.render();
  }

});
