import Ember from 'ember';

export default Ember.Route.extend({
  isEditing: true,

  // need to do this until routeable components are available
  // setupController(controller,model) {
  //     this._super(...arguments);
  //     controller.set(controller, model);
  // },

  beforeModel: function () {
    return Ember.$.getScript('//api.filestackapi.com/filestack.js');
  },

  model: function () {
    let myFilter = {};
    myFilter.data = { filter: { status: [2, 3] } }; // current employees
    return Ember.RSVP.hash({
      trail: this.store.createRecord('trail'),
      currentEmployees: this.store.query('employee', myFilter).then(function (data) { return data }),
    });
  },

  actions: {
    save: function (newObject) {
      if (newObject.get('isValid')) {
        let theChosenOnes = this.controller.get('theChosenOnes');
        let _this = this;
        theChosenOnes.forEach(function (aChosenOne) {
          _this.get('store').createRecord('assignment', {
            trail: newObject,
            person: aChosenOne,
          });
        });
        newObject.save().then(function (newTrail) {
          newTrail.get('assignments').then(assigns => assigns.save()).then(function() {
            _this.transitionTo('trails');
          });
          //newTrail.get('selectedEmps')
          //         
        });
      }
      else {
        alert("Not valid - please provide a name and a GPX file.");
      }
    },
    willTransition() {
      this.controller.get('theChosenOnes').clear(); // clear the selected items
      // rollback will remove the record from the store
      this.controller.get('model.trail').rollbackAttributes();
    }
  }

});

// developer.save().then(
//   function(developer) { 
//     developer.get('languages').save().then(
//       function() { t }, 
//       function(error) { 
//         //a language failed to save 
//       }); }, 
//         function(error) { 
//           //developer failed to save; 
//         });
