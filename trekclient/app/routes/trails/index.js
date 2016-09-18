import Ember from 'ember';
import InfinityRoute from "ember-infinity/mixins/route";

export default Ember.Route.extend(InfinityRoute, {
	totalPagesParam: "meta.total",

	model() {
		return this.infinityModel("trail", { perPage: 10, startingPage: 1 });
	},
	
  count: Ember.computed( function() {
    return this.get('model').get('length');
  })
});