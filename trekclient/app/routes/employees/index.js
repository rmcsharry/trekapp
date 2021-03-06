import Ember from 'ember';
import InfinityRoute from "ember-infinity/mixins/route";

export default Ember.Route.extend(InfinityRoute, {
	totalPagesParam: "meta.total",

	model() {
		return this.infinityModel("employee", { perPage: 10, startingPage: 1 });
	},

});
