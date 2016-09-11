import Ember from 'ember';
import InViewportMixin from 'ember-in-viewport';

export default Ember.Component.extend(InViewportMixin, {
  classNames: 'trailcard',
  classNameBindings: [ 'viewportEntered:highlight' ],
  
  viewportOptionsOverride: Ember.on('didInsertElement', function() {
    Ember.setProperties(this, {
      viewportTolerance: {
        top    : 0,
        bottom : 10, // causes viewportEntered to fire when a small amount is still left to scroll into view
        left   : 0,
        right  : 0
      }
    });
  })  
});
