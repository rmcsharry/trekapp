import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function () {
  this.route('home');

  this.route('trails', function () {
    this.route('new');
    this.route('edit', { path: '/:trail_id/edit' });
  });

  this.route('employees', function () {
    this.route('new');
  });

  this.route('notes');
  this.route('comments');
});

export default Router;
