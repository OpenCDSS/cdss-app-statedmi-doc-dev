# Templates #

**This documentation needs to updated.  It is a copy from TSTool.
StateDMI does not currently handle templates.
However, it could be enhanced to do so, similar to TSTool, when it makes sense.**

*   [Introduction](#itroduction)
*   [Software Design](#software-design)

-----------------

## Introduction ##

Templates are text files that include place-holders that can be substituted for with dynamic data.
For example, a time series product file can include a place-holder for the station identifier,
and the same graph template can be used for many stations.
Templating is a powerful concept that can allow TSTool command files to scale beyond built-in software features.

## Software Design ##

TSTool uses the [Apache Freemarker](https://freemarker.apache.org/) package to implement templates.

The primary use of templates is:

*   [`ExpandTemplateFile`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/ExpandTemplateFile/ExpandTemplateFile/) command for automation
*   time series product files have built in template functionality
