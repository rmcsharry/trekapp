import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('gpxfile-uploader', 'Integration | Component | gpxfile uploader', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{gpxfile-uploader}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#gpxfile-uploader}}
      template block text
    {{/gpxfile-uploader}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
