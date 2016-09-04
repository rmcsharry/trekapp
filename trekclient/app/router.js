import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('home');

  this.route('treks', function() {
    this.route('new');
  });

  this.route('people', function() {
    this.route('list');
  });
  this.route('people.list');
});

export default Router;
