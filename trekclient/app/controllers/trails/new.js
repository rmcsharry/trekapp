import Ember from 'ember';

export default Ember.Controller.extend({
  statusFilter: null,  
  // { status: [1,2] }, 

  queryParams: {
    filterByStatus: 'filter[status]'
  },
  filterByStatus: '1'


  // currentEmployees: Ember.computed('employee', 'model.employees', function() {
  //   var statusFilter = this.get('statusFilter');
  //   var employees = this.get('model.employees');

  //   if (statusFilter) {
  //     return employees.filterBy('status', StatusFilter);
  //   } else {
  //     return employees;
  //   }
  // })



});
