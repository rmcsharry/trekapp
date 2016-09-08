import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  mapThumbnailUrl: DS.attr(),
  elevationThumbnailUrl: DS.attr(),
  province: DS.attr(),
  countryCode: DS.attr(),  
  regionType: DS.attr(),
  agency: DS.attr(),  
  website: DS.attr(),
  distanceValue: DS.attr('number'),
  distanceUnit: DS.attr(),
  distanceType: DS.attr(),
  publishStatus: DS.attr(),
  updatedAt: DS.attr(),
  
  notes: DS.hasMany('note', { async: true }),
  employees: DS.hasMany('employee'),

  notesCount: Ember.computed('notes', function() {
    return `${this.get('notes.length')}`;
  }),
});
