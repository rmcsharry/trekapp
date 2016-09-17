import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  //need to do this until routeable components are available
  // setupController(controller,model) {
  //     this._super(...arguments);
  //     controller.set(controller, model);
  // },

  beforeModel: function () {
    return Ember.$.getScript('//api.filestackapi.com/filestack.js');
  },

  model: function () {
    let myFilter = {};
    myFilter.data = { filter: {status: [2,3] } }; // current employees
    return Ember.RSVP.hash({
      trail: this.store.createRecord('trail'),
      employees: this.store.query('employee', myFilter).then(function(data) {return data})
    })
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
