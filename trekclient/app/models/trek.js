import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  description: DS.attr(),
  country: DS.attr(),
  province: DS.attr(),
  regionType: DS.attr(),
  agency: DS.hasMany(),  
  website: DS.attr(),
  distance: DS.attr('number'),
  distanceType: DS.attr(),
  
  employees: DS.hasMany('employee'),
});
