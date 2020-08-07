var ctx = Packages.org.springframework.web.context.ContextLoader.getCurrentWebApplicationContext();
var filter = ctx.getBean('policyBehaviourFilter', org.alfresco.repo.policy.BehaviourFilter);
filter.disableAllBehaviours();
try {
	var node = search.findNode(args.noderef);
	if (node.inheritsPermissions() && ("ALLOWED;GROUP_EVERYONE;Consumer".equals(node.getPermissions()))) {
		node.setInheritsPermissions(false);
		node.setPermission("Coordinator", "GROUP_ImportCoordinator");
		node.setPermission("Consumer", "GROUP_ImportConsumer");
		node.save();
	}
} catch (error) {
	logger.error("FIX ACL error - noderef = " + args.noderef + " ||| error = " + error.message);
}
filter.enableAllBehaviours();