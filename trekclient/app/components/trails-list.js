import Ember from 'ember';

export default Ember.Component.extend({
  sortedTrails: Ember.computed.sort('trailsList', 'sortDefinition'),
  sortDefinition: ['statusNumber:desc'], 
});
