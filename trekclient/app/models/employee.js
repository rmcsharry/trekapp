import DS from 'ember-data';

import Person from '../models/person';

export default Person.extend({
  status: DS.attr(),
  statusCode: DS.attr(),

  fullNameWithStatus: Ember.computed('fullName', 'status', function () {
    return `${this.get('fullName')} - ${this.get('status').capitalize()}`;
  }),

  // relationships
  trail: DS.belongsTo('trail'),
});
