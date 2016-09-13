import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  beforeModel: function () {
    return Ember.$.getScript('//api.filestackapi.com/filestack.js');
  },

  model: function () {
    return Ember.RSVP.hash({
      trail: this.store.createRecord('trail'),
      //      categories: this.store.findAll('countries')
    });
  },

  actions: {
    save: function (newObj) {
      if (newObj.get('isValid')) {
        newObj.save().then(() => this.transitionTo('trails'));
      }
      else {
        alert("Not valid - please provide a name and a GPX file.");
      }
    },
    willTransition() {
      // rollback will remove the record from the store
      this.controller.get('model.trail').rollbackAttributes();
    }
  }

  // need to do this until routeable components are available
  // setupController(controller) {
  //     this._super(...arguments);
  //     controller.set('trailsNewRoute', this);
  // },
});
