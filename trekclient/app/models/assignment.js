import DS from 'ember-data';

export default DS.Model.extend({
  status: DS.attr(),

  // relationships
  trail: DS.belongsTo('trail', { async: true }),
  person: DS.belongsTo('person', { async: true }),
});
