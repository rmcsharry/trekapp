import Ember from 'ember';

export default Ember.Component.extend({
  isEditing: function() {
    let currentRoute = this.get('router.currentRouteName');
    return currentRoute.includes('new');
  }.property('router.currentRouteName')
});
