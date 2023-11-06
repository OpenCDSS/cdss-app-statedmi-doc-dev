# Command Processor #

*   [Introduction](#introduction)
*   [Processor Properties](#processor-properties)
*   [Processor Data](#processor-data)
*   [Communicating with the Processor](#communicating-with-the-processor)

-------------

## Introduction ##

The [`StateDMI_Processor`](https://github.com/OpenCDSS/cdss-app-statedmi-main/blob/master/src/DWR/DMI/StateDMI/StateDMI_Processor.java)
class (generically referred to as "command processor" or "processor")
is the core class that handles processing commands shown in the StateDMI UI and
when processing command files in batch mode.

## Processor Properties ##

**This section needs to be updated - it was copied from TSTool.**

Properties are maintained in the processor to control processing.
Properties fall into two categories:

*   "built-in properties" have meaning to the core processor/engine and are defined with built-in data members.
    For example, the global output period start and end.
    Built-in properties are generally objects, not primitives, in order to better handle missing/null.
*   "user-defined properties" provide flexibility for controlling workflows via `${Property}` notation.
    User-defined properties are first-class objects, not primitives:

```
/**
HashMap of properties used by the processor.
HashMap allows null keys and values, although here keys should be non-null.
*/
private HashMap<String,Object> __propertyHashmap = new HashMap<String,Object>();
```

The unique identifier for a property is its property name.
Internal code to get and set properties uses the property name to determine whether a property is built-in or dynamic,
and performs the appropriate action.

The following are complexities with properties:

*   **How to handle missing/null** - properties that are not defined will have a value of null if requested.
    Missing values are generally treated similarly.
    String values should distinctly handle differences between null/missing and spaces.
    Calling code must handle the difference between missing/null and empty strings.
*   **How to handle case-specificity** - StateDMI code is generally forgiving related to case-specificity
    but does try to enforce standards.
    The default is to use property names that are `MixedCase`.
    However, to minimize issues with case, much of the code compares strings by ignoring case.
    This protocol was implemented early on due to Microsoft operating systems generally not enforcing case.
    This approach can be problematic with properties because internally the HashMap is case-specific.
    The general trend in StateDMI is to move towards case-specificity for properties,
    although the code works well now so major changes are not envisioned.

## Processor Data ##

The processor maintains lists of objects corresponding to StateCU and StateMod model,
as well as supporting data to help with performance.
These objects **DO NOT** exactly match objects returned from HydroBase or other data inputs.
A translation process occurs to create the model objects.

```
/**
The internal list of StateMod_Diversion being processed.
*/
private List<StateMod_Diversion> __SMDiversionStationList = new Vector();
```

Classes that are maintained in this way are required to have an "ID" data member that identifies instances of the object.
For time series this is the "TSID" and the alias can also be used.
Other objects have simple identifier string.
The identifier is used by commands run by the processor to request objects to process, and the identifier
is used by the UI to display and access results.

The general design approach is to add lists of major data objects as the processor is enhanced,
and use properties for configuration and processing control.
With this approach, the core processor can be kept conceptually simple.

## Communicating with the Processor ##

The processor performs many tasks, which requires corresponding internal methods.
Commands have a reference to the processor that is used to process the command.
The StateDMI UI maintains an instance of a processor to process commands.
Unlike TSTool, which uses a `processRequest` approach to generically communicate between UI and processor,
StateDMI tends to call specific methods as needed to process StateCU and StateMod model data.
