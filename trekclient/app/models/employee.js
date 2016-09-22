import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  firstName: DS.attr(),
  lastName: DS.attr(),
  avatarUrl: DS.attr(),
  status: DS.attr(),
  statusCode: DS.attr(),
  activeCount: DS.attr(),
  pendingCount: DS.attr(),


  fullName: Ember.computed('firstName', 'lastName', function() {
    return `${this.get('lastName')}, ${this.get('firstName')}`;
  }),
  fullNameWithStatus: Ember.computed('fullName', 'status', function () {
    return `${this.get('fullName')} - ${this.get('status').capitalize()}`;
  }),

  // relationships
  address: DS.belongsTo('address'),
  assignments: DS.hasMany('assignment', { async: true }),
});
