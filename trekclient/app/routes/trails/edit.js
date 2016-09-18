import Ember from 'ember';

export default Ember.Route.extend({
  model: function (params) {
    return Ember.RSVP.hash({
      trail: this.store.findRecord('trail', params.trail_id),
      employees: this.store.findAll('employee')
    });
  },  

  actions: {
    cancel: function() {
      this.transitionTo('trails');
    },
  }  
});
