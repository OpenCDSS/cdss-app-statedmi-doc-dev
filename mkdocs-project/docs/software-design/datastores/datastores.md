# Datastores #

*   [Introduction](#introduction)
*   [Datastore Configuration](#datastore-configuration)
*   [Database Datastores](#database-datastores)
*   [Web Service Datastores](#web-service-datastores)
*   [File Datastores](#file-datastores)
*   [Plugin Datastores](#plugin-datastores)

-------------------

## Introduction ##

Datastores have been introduced in StateDMI to handle in a general way the access of persistent data sources.

Datastores are now the preferred way to define data connections.
Datastores have primarily been applied to [databases accessed via ODBC/JDBC](#database-datastores) and
[web services](#web-service-datastores),
but may also be phased in to access [files](#file-datastores).

## Datastore Design ##

A "datastore" is fundamentally a persistent form of data storage.
This general definition can be applied to a file, database, web service, or other forms.
Because the specific form of data storage and the method to retrieve data is not defined at the general datastore level,
the code is fairly generic.
The following datastore interfaces and classes were originally implemented by evolving
legacy code that provided database connections (more discussion below).

*   [`datastore`](https://github.com/OpenCDSS/cdss-lib-common-java/tree/master/src/riverside/datastore) package - core functionality
*   [`DataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/DataStore.java) interface - defines behavior
*   [`AbstractDataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/AbstractDataStore.java) class - default implementation
    for database datastore

Refactoring the above code to use built-in Java data objects such as hash map for properties will allow the code to be more general,
but legacy code will need to be reworked.

## Datastore Configuration ##

Datastores are intended to be configured from simple configuration files with simple properties.
For databases, such configuration includes database server and database name,
service account and login, and identification for the datastore for use in the application.
Web services generally require a URL to the web service root, below which the API is used to access specific endpoints.

The original StateDMI configuration relied on the `StateDMI-version/system/CDSS.cfg` file to define connection defaults for HydroBase
and the user selects the specific database through the HydroBase selector dialog.
The implementation of datastores has moved the configuration information into separate datastore files,
which are independently configured.
This provides greater flexibility to users.
See the [Datastore appendix in the StateDMI User Documentation](https://opencdss.state.co.us/statedmi/latest/doc-user/datastore-ref/overview/)
for configuration information, which will be similar to that used in StateDMI.

## Database Datastores ##

The core datastore package is extended to create a database datastore:

*   [`AbstractDatabaseDataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/AbstractDataStore.java)

The benefit of a general datastore design is that general commands can be implemented, including:

*   [`ReadTableFromDatastore`](https://opencdss.state.co.us/statedmi/latest/doc-user/command-ref/ReadTableFromDataStore/ReadTableFromDataStore/)
*   TSTool [`RunSql`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/RunSql/RunSql/)

Database datastores typically use the
[DMI (Data Management Interface)](https://github.com/OpenCDSS/cdss-lib-common-java/tree/master/src/RTi/DMI) package
and [DMI](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/RTi/DMI/DMI.java) base class,
which was originally developed to interface with SQL databases via ODBC/JDBC.
Consequently, each DataStore implementation instance object includes an object that extends DMI.
The decision of whether to put most of the working code in the DataStore or DMI class varies
and could be made more consistent.

Database datastore packages typically include methods to read time series and other data such as stations.
It may be possible to use a stand-alone database API library,
but in most cases such libraries were not available for Java, or the Java library included too much additional code.
The use of standard database API libraries is an area that could be improved.

## Web Service Datastores ##

Web services datastores do not currently provide shared functionality given that each web service has a different API.
However, the underlying design of the datastores is consistent and the
[`AbstractWebServiceDataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/AbstractWebServiceDataStore.java)
class provides data management and default implementation.

Other classes should extend the
[`AbstractWebServiceDataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/AbstractWebServiceDataStore.java) class
and provide specific functionality.
Unlike database datastores, which are typically coupled with a `DMI` object,
web service datastore code may be manually written or auto-generated with additional wrapper code.
For example, Java provides tools to auto-generate a web service API from SOAP WSDL schema.
The emergence of REST web services is resulting in a variety of approaches to integrating web services with StateDMI.

## File Datastores ##

File datastores are currently not used.
The older "input type" design is used.
This is mainly because file input is handled by simply opening the file and reading the contents using Java classes.
However, there is an opportunity to evolve the terminology towards "file datastore"
and consolidate the StateDMI user interface to only show datastores.
Additional work needs to be done in this area.

## Plugin Datastores ##

A prototype design for plugin datastores is under development to facilitate integrating third-party
data sources with StateDMI without having to change core code.

See the [`datastore` package](https://github.com/OpenCDSS/cdss-lib-common-java/tree/master/src/riverside/datastore)
and [`PluginDataStore`](https://github.com/OpenCDSS/cdss-lib-common-java/blob/master/src/riverside/datastore/PluginDataStore.java) interface.

Plugin commands are a also a new feature that is under development.
The purpose of plugin commands is to let StateDMI run third-part commands that are loaded from Jar files at runtime,
rather than being distributed with the core software.
Plugin commands are often made available with datastores to read and write datastore data.
See also [Plugin Commands](../plugin-commands/plugin-commands.md).
