import Ember from 'ember';

export default Ember.Component.extend({
  count: Ember.computed( function() {
    return this.get('trailsList').get('length');
  })
});
