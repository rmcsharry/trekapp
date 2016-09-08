import DS from 'ember-data';

export default DS.Model.extend({
  commentBody: DS.attr(),
  
  trail: DS.belongsTo('trail')
});
