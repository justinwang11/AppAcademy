Pokedex.Views.ToyDetail = Backbone.View.extend({
  initialize: function(toy){
    this.model = toy;
    var content = JST['toyDetail']({toy: this.model, pokes:[] });
    this.content = content;
  },

  render: function(){
    this.$el.html(this.content);
  }
});
