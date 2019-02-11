# Testing Framework #

One of the major features of StateDMI is a built-in testing framework that facilitates testing commands in the full application.
Much of the code **does not** currently use Java unit tests (junit), although such tests could be added.
However, the built-in functional test framework has proven to be capable of testing the software
by exercising code at multiple levels.
This provides coverage testing of the functionality that users will experience.
See the following for more information.

* [cdss-app-statedmi-test test repository](https://github.com/OpenWaterFoundation/cdss-app-statedmi-test)
**Has not been populated - tests currently exist in the `test/regression` folder in `cdss-app-statedmi-main` repository.**
* [Quality Control chapter of user documentation](http://learn.openwaterfoundation.org/cdss-app-statedmi-doc-user/quality-control/quality-control/) -
**Does not currently exist on online - see the PDF documentation distributed with the software.**
* [Development Tasks / Testing](../../dev-tasks/overview.md#testing)

Testing StateDMI can be complex, especially for complex workflows relying on a specific HydroBase version.
For example, it is often necessary to constrain the period of record for time series queries to a
historical period in which data should not change over time.
However, the testing framework does provide significant features to meet testing requirements.

Ultimately, testing focuses on comparing the current software results to expected results.
The testing framework includes commands to compare files, compare time series, and compare tables.
Using simple formats ensures that the testing framework itself can be robust.
