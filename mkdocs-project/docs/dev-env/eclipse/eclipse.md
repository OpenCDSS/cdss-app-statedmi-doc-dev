# StateDMI / Development Environment / Eclipse #

*   [Introduction](#introduction)
*   ![Windows icon](../../images/windows-32.png) [Windows](#windows)
    +   [Download and Install Eclipse](#download-and-install-eclipse)
    +   [Check Eclipse Run Script](#check-eclipse-run-script)

-----

## Introduction ##

The Eclipse Integrated Development Environment (IDE) has traditionally been used for StateDMI software development and is recommended.
Alternate IDEs may be supported at some point; however, investigating impacts of using other IDEs
on StateDMI development will require resources.
Eclipse does have some issues and limitations, but other IDEs have different issues.

StateDMI development has typically occurred on Windows computers, although the software can be deployed to other operating systems.

As discussed in the [Java](../java/java.md) section,
OpenJDK Java 11 is currently used for development as of StateDMI version 6.0.0.
The following table lists StateDMI versions and Eclipse versions that have been used for development.
Oracle Java was used prior to 5.2.0.

**<p style="text-align: center;">
StateDMI Versions and Corresponding Eclipse Versions
</p>**

| **StateDMI Version** | **Eclipse Version** | **Comment** |
| -- | -- | -- |
| 6.0.0 | 4.24.0 (2022-06) | Installation is described in this documentation, last Eclipse version that runs with Java 11. |
| < 6.0.0 | 4.11.0 (2019-03) | See the [archived documentation](eclipse-2019-03/eclipse-2019-03.md). |
| Older versions. | Eclipse Mars, Neon, etc. | Not documented (obsolete). |

The Eclipse `.project` file is currently saved in the Git repository for each StateDMI component repository
in order to facilitate development environment setup.  This may change in the future.
Using a compatible version of Eclipse between developers ensures that the format of such files is consistent.

The Eclipse workspace (`.metadata`) folder is not saved in Git repository and is instead
is recommended to be saved in `eclipse-workspace` folder under the StateDMI product folder
in a standard development folder structure.

## ![Windows icon](../../images/windows-32.png) Windows ##

### Download and Install Eclipse ###

See the [TSTool Eclipse documentation](https://opencdss.state.co.us/tstool/latest/dev-env/eclipse/eclipse)
for information about downloading and installing Eclipse 2022-06.
TSTool and StateDMI use the same Eclipse version for OpenJDK Java 11.

### Check Eclipse Run Script ###

The `cdss-app-statedmi-main` repository `build-util` folder contains scripts to run the correct version of Eclipse,
assuming a standard installation folder.  For example, `build-util/run-eclipse-win64.cmd` can be run from a Windows command shell.
This ensures that the proper versions of Eclipse and Java are used.
If necessary, this script can be modified or other versions added over time (for example for new versions of Java and Eclipse).
