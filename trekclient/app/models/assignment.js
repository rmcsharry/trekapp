import DS from 'ember-data';

export default DS.Model.extend({

  // relationships
  trail: DS.belongsTo('trail', { async: true }),
  employee: DS.belongsTo('person', { async: true }),
  
});
