# Java Runtime Environment #

This documentation focuses on technical issues related to the Java Runtime Environment.

*   [Java Language](#java-language)
*   [Java Runtime Environment (JRE)](#java-runtime-environment_1)
*   [StateDMI JRE Version History](#statedmi-jre-version-history)
*   [Java Launcher](#java-launcher)
*   [Classpath](#classpath)
*   [Plugins and Class Loaders](#plugins-and-class-loaders)

--------------

## Java Language ##

StateDMI is written in the Java language, with use of C or other languages only when used by third-party components.
Java source code consists of files with `*.java` filename extension.
Code files include classes, interfaces, enumerations, etc.
The source code is compiled into bytecode in class files with `*.class` filename extension.
These files are directly used in the development environment to run StateDMI and are
packaged into Java Archive (`*.jar`) files for distribution and use at run-time.

## Java Runtime Environment ##

A [Java Runtime Environment (JRE)](../../resources.md#java) that is the same or newer than the Java version used in the development environment
is required to run StateDMI in the operational environment.
For example, StateDMI developed and distributed with Java 8 cannot be run using JRE 7.
Although it is possible to rely on a Java version on the computer, StateDMI software
is distributed with its own JRE.  See the `jre_VERSION` folder under the StateDMI installation,
for example `jre_18` when Java 8 is used (the convention of using 1.8 for Java 7, etc. is from Java developers
and StateDMI conventions need to migrate to the more easily understood "8" as time allows to make this change).
The JRE allows Java to be run in a protected virtual environment separate from other Java installations on the computer.

## Java Launcher ##

The JRE is runs StateDMI via a StateDMI launcher program.
On Windows, the open source [Launch4J](../../resources.md#launch4j)
software is used to run StateDMI.

## StateDMI JRE Version History ##

The following is a history of major Java version changes for StateDMI:

*   StataDMI 5.2.0 uses OpenJDK 64-bit Java 8
*   StateDMI 5.0.0 uses Oracle 64-bit Java 8
*   Prior to StateDMI 5.2.0, Oracle 32-bit Java is used,
    mainly for historical reasons and to be compatible with TSTool.

## Classpath ##

The JRE starts by specifying the class path to files and folders with `*.class` and `*.jar` file extension.
The current approach taken in StateDMI is to exactly specify files to load, rather than just the
folder where to search for files.
This may be changed to specify the folder, so that startup can be simpler.
However, this increases the opportunity for errors if extra files have somehow been added to the folder.
See also the next section on plugins.

## Plugins and Class Loaders ##

StateDMI does not currently support plugins, although this may be added in the future, similar to TSTool.
