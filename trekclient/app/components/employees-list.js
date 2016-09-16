import Ember from 'ember';

export default Ember.Component.extend({
  // sortedEmployees: Ember.computed.sort('employeesList', 'sortDefinition'),
  // sortDefinition: ['statusCode:desc', 'fullName:asc'],

  infinityLoadAction: 'infinityLoad',
  actions: {
    infinityLoad(employeeModel) {
      this.sendAction('infinityLoadAction', employeeModel);
    }
  }
  
});
