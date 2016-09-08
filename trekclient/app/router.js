import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('home');

  this.route('trails', function() {
    this.route('new');
  });

  this.route('employees', function() {
    this.route('new');
  });

  this.route('note');
});

export default Router;
