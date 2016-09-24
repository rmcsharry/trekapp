import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  gpxFileUrl: DS.attr(),
  mapThumbnailUrl: DS.attr(),
  elevationThumbnailUrl: DS.attr(),
  province: DS.attr(),
  countryCode: DS.attr(),  
  regionType: DS.attr(),
  agency: DS.attr(), 
  websiteUrl: DS.attr(),
  distance: DS.attr('number'),
  layoutType: DS.attr(),
  difficultyLevel: DS.attr(),
  publishStatus: DS.attr(),
  updatedAt: DS.attr(),
  notesCount: DS.attr(),
  commentsCount: DS.attr(),

  // relationships
  notes: DS.hasMany('note', { async: true }),
  comments: DS.hasMany('comment', { async: true }),  
  assignments: DS.hasMany('assignment', { async: true }),

  // computed attributes
// TODO turn this back on  isValid: Ember.computed.and('name', 'gpxFileUrl'),  


  // notesCount: Ember.computed('notes', function() {
  //   return `${this.get('notes.length')}`;
  // }),
  // commentsCount: Ember.computed('comments', function() {
  //   return `${this.get('comments.length')}`;
  // }),  

});
