import DS from 'ember-data';

export default DS.Model.extend({
  noteBody: DS.attr(),
  
  trail: DS.belongsTo('trail')    
});
