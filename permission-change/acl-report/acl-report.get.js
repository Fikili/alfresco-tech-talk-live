var topFolder = companyhome.childByNamePath("Import").getNodeRef();
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
