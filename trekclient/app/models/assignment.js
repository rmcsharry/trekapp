import DS from 'ember-data';

export default DS.Model.extend({

  // relationships
  trails: DS.belongsTo('trail', { async: true }),
  people: DS.belongsTo('person', { async: true }),
  
});
