import DS from 'ember-data';

export default DS.Model.extend({
  noteBody: DS.attr(),
  
  // relationships
  trail: DS.belongsTo('trail')    
});
