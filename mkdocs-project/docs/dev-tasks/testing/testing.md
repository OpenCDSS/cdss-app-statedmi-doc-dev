# StateDMI / Development Tasks / Testing #

* [Unit Testing](#unit-testing)
* [Functional Testing](#functional-testing)

------------------

## Unit Testing ##

StateDMI does not currently use JUnit for unit testing because the functional testing framework allows testing the full stack of software.
However, JUnit may be used more in the future, especially for library components that do not have a clear functional test.
The `test/` folder in each repository can be used for unit tests,
other than the `cdss-app-statedmi-test` folder includes functional tests.

## Functional Testing ##

StateDMI testing relies on extensive functional tests.

* See the [cdss-app-statedmi-test test repository](https://github.com/OpenCDSS/cdss-app-statedmi-test)
**This is proposed - for now, refer to the files under `test/regression` folder in the `cdss-app-statedmi-main` repository.**
* See the Quality Control chapter of the StateDMI documentation.
**This documentation has not yet been converted to online form.**

Functional testing typically occurs in a granular fashion by adding and running tests for specific commands.
Prior to software release, the full suite of tests is run by running the following command files in the
`cdss-app-statedmi-repository`:

1. Run `test/regression/TestSuites/commands/create/Create_RunTestSuite_comands.StateDMI`.
This searches all the command tests and creates a command file with `RunCommands` commands for each command.
2. Run `test/regression/TestSuites/commands/run/RunRegressionTest_commands.StateDMI`.
This runs the tests in the previous item.
Some tests historically fail and need to be dealt with to ensure 100% pass.
