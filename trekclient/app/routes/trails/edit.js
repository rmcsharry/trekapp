import Ember from 'ember';

export default Ember.Route.extend({
  model: function (params) {
    let myFilter = {};
    myFilter.data = { filter: { status: [2, 3] } }; // current employees (TODO: must be a better way)
    return Ember.RSVP.hash({
      trail: this.store.findRecord('trail', params.trail_id),
      currentEmployees: this.store.query('employee', myFilter).then(function (data) { return data }),
    });
  },

  actions: {
    cancel: function() {
      this.transitionTo('trails');
    }, 

    save: function (newObject) {
      let _this = this;
      if (newObject.get('isValid')) {
        newObject.save().then(function () {
          _this.transitionTo('trails');
        });
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
