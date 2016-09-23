import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'div',

  setup: Ember.on('init', function () {
    filepicker.setKey('AN8H8yfYmRoWueVQmTIxNz'); // TODO get from server
  }),

  uploadedFileUrl: null,

  didInsertElement: function () {
    this._super(...arguments);
    let _this = this;
    let dropzone = $('#dropzone');
    filepicker.makeDropPane(this.$()[0], {
      multiple: false,
      extension: '.gpx',
      maxSize: (5 * 1024 * 1024),
      onStart: function (files) {
        // this function is for troubleshooting purposes so we can see what the user dropped
        let obj = files[0]; // we only allow single uploads, hence expect one file in the array
        let result = null;
        $.each(obj, function (k, v) {
          result += k + " , " + v + "\n";
        });
        console.log('file dropped is:\n' + result); // note: type is always empty, so we don't know beforehand what the user dropped
      },
      dragEnter: function () {
        dropzone.addClass('is-dragging');
        dropzone.html('<h2>Drop here</h2>');
      },
      dragLeave: function () {
        dropzone.removeClass('is-dragging');
        dropzone.html('<h2>Upload GPX Route</h2><div class="dropzone-body-text"><h5>Drag and Drop here</h5>- or -<h5>click anywhere here</h5></div>');
      },
      onSuccess: function (files) {
        _this.showResult(files[0], dropzone);
      },
      onError: function (type, message) {
        _this.showError(type, message, dropzone);
      },
      onProgress: function (percentage) {
        _this.showProgress(percentage, dropzone);
      }
    });
  },

  showResult: function (result, dropzone) {
    console.log('Showing Result: ');
    console.log(result);
    if (result.mimetype !== 'text/xml') {
      let typeMsg = 'Wrong type - your file is of type "' + result.mimetype + '".';
      let errorMsg = 'Please check the file in an editor. A GPX file should be of type "text/xml".';
      this.showError(typeMsg, errorMsg, dropzone);
    }
    else {
      dropzone.html('<h2>File check finished</h2><br/><h4>Please note the file will not be saved until you complete the form below.</h4>');
      this.set('uploadedFileUrl', result['url']);
    }
  },

  showError: function (type, message, dropzone) {
    dropzone.removeClass('is-dragging');
    dropzone.html('<h2>Error - please try again</h2>' + '<h5 class="error-text">' + type + '<br/><br/>' + message + '</h5><h3>Drop another file or click me</h3>');
  },

  showProgress: function (percentage, dropzone) {
    dropzone.html('<h2>Checking (' + percentage + '%)</h2>');
  },

  actions: {
    openFileInput() {
      this.$('#fileInput').trigger('click'); // this will open the hidden fileInput
    },

    fileInputChanged: function () {
      let _this = this;
      let dropzone = $('#dropzone');
      filepicker.store(
        document.getElementById("fileInput"),
        function(file) {
          _this.showResult(file, dropzone);
        },
        function (type, message) {
          _this.showError(type, message, dropzone);
        },
        function (percentage) {
          _this.showProgress(percentage, dropzone);
        }
      );
    },
  }

});
