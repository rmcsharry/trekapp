import Ember from 'ember';
import InViewportMixin from 'ember-in-viewport';

export default Ember.Component.extend(InViewportMixin, {
  didEnterViewport() {
    console.log('entered');
  },
});
