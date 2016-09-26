import Ember from 'ember';

export default Ember.Component.extend({
  statusText: '',

  // TODO Refactor this into a template helper so we can use it for other enums
  statusHumanized: Ember.computed('statusText', function () {
    // Converts underscores to spaces and capitalizes each word
    // This is faster than regex, see: http://goo.gl/oyfxGM 
    let text = this.get('statusText');
    if (text) {
      let frags = text.toString().split('_');
      for (let i = 0; i < frags.length; i++) {
        frags[i] = frags[i].capitalize(); // eq to this: frags[i].charAt(0).toUpperCase() + frags[i].slice(1);
      }
      return frags.join(' ');
    }
  }),

});
