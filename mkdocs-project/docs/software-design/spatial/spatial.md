# Spatial Data #

**This documentation needs to updated.  It is a copy from TSTool.
StateDMI does not currently provide much functionality to process spatial data.
However, it could be enhanced to do so, similar to TSTool, when it makes sense.**

*   [Introduction](#introduction)
*   [Spatial Data Code Design](#spatial-data-code-design)

----

## Introduction ##

TSTool provides spatial data support to a limited degree, primarily as follows:

*   Focus is on point locations corresponding to time series stations, sites, etc., although
    other shapes are supported to some degree.
*   Read tables from spatial data formats such as DBF files associated with shapefiles.
*   Creating spatial data files such as shapefiles, GeoJSON, and KML from time series and tables.
*   Extensive geospatial processing is not envisioned as other tools are better suited.

Features are provided to translate data from time series properties, to tables, to processor properties,
which allows spatial data to be handled in workflows.

## Spatial Data Code Design ##

Spatial data support is provided through "home grown" code,
mainly because libraries were not available at the time that TSTool was developed, or because third-party tools
are cumbersome to integrate.  For example the [Java GeoTools](https://geotools.org/) library could be used, but would
require resources to properly integrate, deal with dependencies, etc.
The following are code packages related to spatial data:

*   [GeoView](https://github.com/OpenCDSS/cdss-lib-common-java/tree/master/src/RTi/GIS/GeoView) - spatial data package
*   [GR](https://github.com/OpenCDSS/cdss-lib-common-java/tree/master/src/RTi/GR) - core graphics/drawing package
