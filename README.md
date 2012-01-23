SpreeBetterBreadcrumb
=====================

Just an update to the spree breadcrumbs to provide more intuitive usage of breadcrumbs.  The products path and taxons path are seperate, and the breadcrumbs wil also display the product name at the end.

An additional helper method has been added to provide a path to the last visted breadcrumb (either a taxon or the products path), to allow linking back to the last specific area the user was in.  This is useful when a user adds something to their cart, they can be linked back to the last taxon they were browsing.

Example
=======

Breadcrumbs now take an addition parameter, a product as parameter two:

<%=breadcrumbs(@taxon, @product, optional_seperator_string)%>

For backwards compatibility the optional seperator string can also be passed as the second parameter, but doing so limits some of the functionality of the breadcrumbs.

To get the path to the last breadcrumb use:

<%=last_crumb_path%>


