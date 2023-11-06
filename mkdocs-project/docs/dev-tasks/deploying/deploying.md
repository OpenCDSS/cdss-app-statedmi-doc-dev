# StateDMI / Development Tasks / Deploying #

This documentation explains to to deploy the software and documentation to published locations.

*   [Deploy Software Installer](#deploy-software-installer)
*   [Deploy Documentation](#deploy-documentation)

---------------

## Deploy Software Installer ##

The installer that is created in the `dist` folder in the main StateDMI repository
is published by running the `build-util/copy-to-co-dnr-gcp.bash` script in a Git Bash.

## Deploy Documentation ##

The MkDocs user and developer documentation should be deployed according to the instructions in those repositories.
Generally this will involve running a script in the `build-util` folder to upload the static website content to the cloud location(s).
