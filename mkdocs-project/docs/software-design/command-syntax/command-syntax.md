# Command File and Command Syntax #

*   [Introduction](#introduction)
*   [UI Considerations](#ui-considerations)

-----------------

## Introduction ##

StateDMI command files contain a workflow of commands as text.
The commands are displayed in the middle of the StateDMI window with no further modification.

See also the [Command Syntax user documentation](https://learn.openwaterfoundation.org/cdss-app-statedmi-doc-user/command-ref/command-syntax/).

The following are important design considerations:

1.  Commands are intended to be simple text, rather than binary files or multi-file representations.
2.  StateDMI command editors format commands as per the current expected spelling, case, parameter order,
    and default parameter use.
3.  StateDMI is generally forgiving about string case for parameter names and pre-defined values,
    in order to minimize user frustrations when manually editing commands.
    However, editors will translate to expected form.
4.  Command parameters are only output if not default values, in order to keep commands as short as possible.
5.  Indentation is not currently allowed.

## UI Considerations ##

Commands as of 4.05.x are displayed as simple text in the command area.
This is increasingly becoming a limiting factor as command files become more complex.
It is desirable to implement the following enhancements:

1.  Allow indentation so that logic blocks such as For and If commands can be emphasized.
    *   For example, use a Python approach where a consistent indentation character and count is used.
    *   Conventions for different users may vary so perhaps use a `#@indent xxxx` annotation
        in command files to make indentation portable (encourage use of spaces rather than tabs).
    *   Add software tools to manually and automatically format command files.
    *   Update command code to trim the command strings before processing and also preserve indentation.
2.  Color-code command workflow elements to provide more clarity.
    *   For example use different colors or formatting for:
        +   Comments
        +   Command names
        +   Literal strings
        +   Properties
    *   The above will require changing the behavior of the command list component in the StateDMI main window.
        A default formatting theme will be needed and allow users to override with personal preferences.
        The personal settings could be saved in the user's personal files.
