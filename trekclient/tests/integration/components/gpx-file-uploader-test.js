import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('gpx-file-uploader', 'Integration | Component | gpx file uploader', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{gpx-file-uploader}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#gpx-file-uploader}}
      template block text
    {{/gpx-file-uploader}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
