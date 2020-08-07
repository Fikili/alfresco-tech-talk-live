var topFolder = "workspace://SpacesStore/e7e6bc29-d361-4ee2-b202-b6a9324a75ef";
logger.info("ACL Report ||| START - " + topFolder);
var level = 0;

findSubFolders(topFolder, level);

function findSubFolders(nodeRef, level) {
        var node = search.findNode(nodeRef);
        logger.info("ACL Report ||| " + node.getNodeRef() + " | " + node.displayPath + "/" + node.getName() + " | " + level++);
        var kids = node.childFileFolders(false, true);

        for (var i = 0; i < kids.length; i++) {
                findSubFolders(kids[i].getNodeRef(), level);
        }
}

logger.info("ACL Report ||| END - " + topFolder);