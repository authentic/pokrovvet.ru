// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
    // Create a new YUI instance and populate it with the required modules.
//    Call the "use" method, passing in "node-menunav".  This will load the
//    script and CSS for the MenuNav Node Plugin and all of the required
//    dependencies.

YUI().use("node-menunav", function(Y) {

    //    Use the "contentready" event to initialize the menu when the subtree of
    //    element representing the root menu (<div id="menu-1">) is ready to
    //    be scripted.

    Y.on("contentready", function () {

        //    The scope of the callback will be a Node instance representing
        //    the root menu (<div id="menu-1">).  Therefore, since "this"
        //    represents a Node instance, it is possible to just call "this.plug"
        //    passing in a reference to the MenuNav Node Plugin.

        this.plug(Y.Plugin.NodeMenuNav);

    }, "#menu-1");

});