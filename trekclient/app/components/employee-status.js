import Ember from 'ember';

export default Ember.Component.extend({
  statusText: null,

  statusHumanized: Ember.computed( function() {
    // Converts underscores to spaces and capitalizes each word
    // faster than regex, see: http://goo.gl/oyfxGM 
    let frags = this.get('statusText').toString().split('-');
    for (let i=0; i<frags.length; i++) {
        frags[i] = frags[i].capitalize(); // frags[i].charAt(0).toUpperCase() + frags[i].slice(1);
    }
    return frags.join(' ');
  }),

});
