import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'div',
  classNames: 'filestack-uploader',

  setup: Ember.on('init', function () {
    filepicker.setKey('AN8H8yfYmRoWueVQmTIxNz'); // TODO get from server
  }),

  didInsertElement: function () {
    this._super(...arguments);
    let me = this.$();
    let child = this.$('div:first-child');
    let putTextBack = function () {
        child.html('<h2>Upload GPX Route</h2><div class="dropzone-body-text"><h5>Drag and Drop here</h5>- or -<h5>click anywhere here</h5></div>');
      };
    filepicker.makeDropPane(me[0], {
      multiple: false,
      mimetype: 'text/xml',
      dragEnter: function () {
        console.log('enter');
        child.addClass('is-dragging');
        child.html('<h2>Drop here</h2>');
      },
      dragLeave: function () {
        child.removeClass('is-dragging');
        putTextBack();
      },
      onSuccess: function (Blobs) {
        me.text("Done, see result below");
        //$("#localDropResult").text(JSON.stringify(Blobs));
      },
      onError: function (type, message) {
        //$("#localDropResult").text('('+type+') '+ message);
        child.removeClass('is-dragging');
        child.html('<h2>Error - please try again</h2>' + '<h5 class="error-text">' + type + '<br/><br/>' + message + '</h5><h3>Drop another file or click me</h3>');
      },
      onProgress: function (percentage) {
        child.text("Uploading (" + percentage + "%)");
      }
    });
  },

  actions: {
    openFilePicker: function () {
      filepicker.pick({
        mimetype: 'text/xml',
        container: 'modal',
        maxSize: (5 * 1024 * 1024),
        services: ['COMPUTER'],
        onClose: function () {
         alert('close');
      },
      },
        function (Blob) {
          alert(replaceHtmlChars(JSON.stringify(Blob)));
        },
        function (FPError) {
          console.log(FPError.toString());
        }
      );
    }
  }

});
