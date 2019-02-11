# StateDMI Application #

* [Introduction](#introduction)
* [Launching](#launching)
* [Configuration](#configuration)
* [User Interface (UI)](#user-interface-ui)

-----

## Introduction ##

The StateDMI main application is the entry point into the software and is used for multiple run modes.
Command parameters are parsed to determine how to launch the application and then
appropriate classes are instantiated.

StateDMI configuration can be complex due to the number of data sources that are supported.
As much as possible, the configuration is distributed with useful defaults,
and configuration files are simple text files that can be modified as appropriate.

## Launching ##

The StateDMI main application class is launched in typical Java way via the
static [StateDMI class](https://github.com/OpenCDSS/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMI.java).
Command line parameters are parsed and StateDMI is run in a mode that is requested.

For example, if running in batch mode, a
[StateDMICommandFileRunner class](https://github.com/OpenCDSS/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMICommandFileRunner.java)
is instantiated and the command file is run.

If running the GUI, then an instance of
[StateDMI_JFrame](https://github.com/OpenCDSS/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMI_JFrame.java)
is created and the command file is run.

On Windows, the [Launch4J](../../resources.md#launch4j) software is used to create an
executable program to launch StateDMI.
This allows the `statedmi.exe` program to be run.
Launch4j provides numerous features to optimize Java program start-up on Windows.

## Configuration ##

**This needs to be updated.  StateDMI currently does not have a `StateDMI.cfg` file but this would be useful.**

StateDMI is configured via a number of simple text files.
Simple `Property=Value` syntax has been used and
[INI format](https://en.wikipedia.org/wiki/INI_file)
with sections and #-comments is used for `StateDMI.cfg`.
These simple formats will likely continue to be used, although JSON may be adopted where it has benefits,
such as hierarchical time series product files.

The [Installation StateDMI appendix in the User Documentation](http://learn.openwaterfoundation.org/cdss-app-statedmi-doc-user/appendix-install/install/),
as well as [Datastore documentation](http://learn.openwaterfoundation.org/cdss-app-statedmi-doc-user/datastore-ref/overview/)
describes configuration files.

## User Interface (UI) ##

The
[StateDMI_JFrame](https://github.com/OpenCDSS/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMI_JFrame.java)
class is quite large and could benefit from refactoring.
However, much of the length results from the large number of menus and associated actions that
occur in responding to those menus.
Components could be refactored to act autonomous of the StateDMI Main UI, but this would require evaluation.

See the [User Interface Software Design documentation](../ui/ui.md).

