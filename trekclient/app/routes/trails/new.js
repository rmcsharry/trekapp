import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  beforeModel: function() {
      return Ember.$.getScript('//api.filestackapi.com/filestack.js');
  }

  // need to do this until routeable components are available
  // setupController(controller) {
  //     this._super(...arguments);
  //     controller.set('trailsNewRoute', this);
  // },
});
