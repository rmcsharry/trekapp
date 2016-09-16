import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  // need to do this until routeable components are available
  // setupController(controller) {
  //     this._super(...arguments);
  //     controller.set('trailsNewRoute', this);
  // },

  beforeModel: function () {
    return Ember.$.getScript('//api.filestackapi.com/filestack.js');
  },

  model: function () {
    return Ember.RSVP.hash({
      trail: this.store.createRecord('trail'),
      employees: function() {
        let emps = this.store.findAll('employee');
        return emps.filter('employee', function() {
          return record.get('statusCode') !== 3
        });
      }
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

});
