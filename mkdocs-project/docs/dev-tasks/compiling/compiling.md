# StateDMI / Development Tasks / Compiling #

The Eclipse IDE automatically compiles code as changes are made.
If no errors are found, StateDMI can be run as in the next section.
If errors are found, they need to be addressed by troubleshooting the code (or finishing incomplete edits).

The ***Problems*** Eclipse view lists compile issues.
Errors are listed first in read and other warnings are also shown.

The ***Console*** Eclipse view shows messages that are output to the console
and Eclipse exception handling features.
This output is useful and if not sufficient, the
[StateDMI logging features](../../software-design/logging/logging.md) should be used.

Because of the complexity of StateDMI and amount of code,
there are quite a few warnings such as the use of generics.
These warnings often arise due to changes in the Java language.
The code for such warnings runs fine but warnings should be corrected over time.

The [Deploying](../deploying/deploying.md) section discusses how the code is recompiled during build for deployment.
