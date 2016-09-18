import DS from 'ember-data';

import Person from '../models/person';

export default Person.extend({
  status: DS.attr(),
  statusCode: DS.attr(),
  activeCount: DS.attr(),
  pendingCount: DS.attr(),

  fullNameWithStatus: Ember.computed('fullName', 'status', function () {
    return `${this.get('fullName')} - ${this.get('status').capitalize()}`;
  })
});
