import DS from 'ember-data';

import Person from '../models/person';

export default Person.extend({
  status: DS.attr(),
  statusNumber: DS.attr(),

  treks: DS.hasMany('trek'),
});
