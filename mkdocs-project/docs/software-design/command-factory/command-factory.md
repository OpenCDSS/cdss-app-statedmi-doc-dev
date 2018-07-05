# Command Factory #

An instance of the [StateDMICommandFactory class](https://github.com/OpenWaterFoundation/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMICommandFactory.java)
is used to parse commands as text and return an appropriate instance of a command class.
This class recognizes built-in commands and in the future could recognize plugin commands (similar to TSTool).
Currently the command factory imports all known commands.
An alternative approach could be implemented similar to plugins whereby
command classes do not need to be imported at compile time;
however, this approach has not been needed to date.

The factory is called by the [StateDMI UI](../ui/ui) when adding new commands or editing commands.

It is also called when reading in a command file to run in batch mode,
for example via [`StateDMICommandFileRunner`](https://github.com/OpenWaterFoundation/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMICommandFileRunner.java).
