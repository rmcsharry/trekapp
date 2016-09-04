import Ember from 'ember';

export default Ember.Component.extend({
  sortedEmployees: Ember.computed.sort('employeesList', 'sortDefinition'),
  sortDefinition: ['statusNumber:desc', 'fullName:asc'],
});
