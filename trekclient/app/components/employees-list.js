import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    infinityLoad() {
      this.sendAction('infinityLoad')
    }
  }
  
});
