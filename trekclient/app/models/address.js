import DS from 'ember-data';

export default DS.Model.extend({
  line1: DS.attr(),
  line2: DS.attr(),
  line3: DS.attr(),
  city: DS.attr(),
  province: DS.attr(),
  postal_code: DS.attr(),
  country: DS.attr(),
  country_code: DS.attr(),

  people: DS.belongsTo('people')
});
