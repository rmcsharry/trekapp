import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  description: DS.attr(),
  province: DS.attr(),
  countryCode: DS.attr(),  
  regionType: DS.attr(),
  agency: DS.hasMany(),  
  website: DS.attr(),
  distanceValue: DS.attr('number'),
  distanceUnit: DS.attr(),
  distanceType: DS.attr(),
  
  employees: DS.hasMany('employee'),
});
