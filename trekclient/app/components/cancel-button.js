import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'a',

  isEditing: function() {
    let currentRoute = this.get('router.currentRouteName');
    return (currentRoute.includes('new') || currentRoute.includes('edit'));
  }.property('router.currentRouteName')
});
