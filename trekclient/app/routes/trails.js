import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    addNew() {
      this.transitionTo('trails.new');
    } 
  }
});
