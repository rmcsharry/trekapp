import Ember from 'ember';

export default Ember.Component.extend({
  sortedPeople: Ember.computed.sort('peopleList', 'sortDefinition'),
  sortDefinition: ['statusNumber:desc', 'fullName:asc'],
});
