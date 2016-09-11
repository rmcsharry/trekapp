import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'div',
  classNames: 'dropzone'.w(),
  classNameBindings: 'isDragging active isDisabled:is-disabled'.w(),
  attributeBindings: 'data-uploader'.w(),
  'data-uploader': 'true',
  isDisabled: false,


  dragOver: function (event) {
    // this is needed to avoid the default behaviour from the browser
    event.preventDefault();
  },

  dragEnter: function (event) {
    event.preventDefault();
    this.set('isDragging', true);
    this.set('active', true);
    console.log('entered');
  },

  dragLeave: function (event) {
    event.preventDefault();
    this.set('isDragging', false);
    this.set('active', false);
    console.log('left');
  },

  drop: function (event) {
    var file;
    
    if (!this.get('isDisabled')) {
      event.preventDefault();
      this.set('isDragging', false);
console.log('file dropped');
      // only 1 file for now
      file = event.dataTransfer.files[0];
      this.set('isDisabled', true);
      this.sendAction('fileInputChanged', file);
    } else {
      console.error('you can only upload one file at the time');
    }
  }
});
