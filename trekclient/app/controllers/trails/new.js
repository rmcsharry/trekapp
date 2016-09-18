import Ember from 'ember';

export default Ember.Controller.extend({
  theChosenOnes: Ember.A(), // used in the ember-power-select to store selected employees

  actions: {
    chosenOnesChanged (newList) {
      let theChosenOnes = this.theChosenOnes;
      theChosenOnes.forEach(function(me){
        if (!newList.includes(me)) {
          theChosenOnes.removeObject(me); // if I was chosen b4, but the newList doesn't have me, remove me
        }
      });
      newList.forEach(function(me){
        if (!theChosenOnes.includes(me)) {
          theChosenOnes.pushObject(me); // if I was not chosen b4, but the newList has me, add me
        }          
      });
    },
  }  
});
