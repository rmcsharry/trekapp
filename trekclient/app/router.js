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

  this.route('employees', function() {
    this.route('new');
  });
  
});

export default Router;
