import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  // need to do this until routeable components are available
  // setupController(controller) {
  //     this._super(...arguments);
  //     controller.set('trailsNewRoute', this);
  // },

  actions: {
    fileDropped: function(obj, ops) {
      console.log("dropped");
    }
  }
});
