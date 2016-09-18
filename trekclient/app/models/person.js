import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  avatarUrl: DS.attr(),
  firstName: DS.attr(),
  lastName: DS.attr(),

  fullName: Ember.computed('firstName', 'lastName', function() {
    return `${this.get('lastName')}, ${this.get('firstName')}`;
  }),
  
  // relationships
  address: DS.belongsTo('address'),
  assignments: DS.hasMany('assignment', { async: true }),
});
