import DS from 'ember-data';

import Person from '../models/person';

export default Person.extend({
  status: DS.attr(),
  statusCode: DS.attr(),

  treks: DS.hasMany('trek'),
});
