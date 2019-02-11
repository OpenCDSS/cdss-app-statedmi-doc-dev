# Repositories and Projects #

* [Introduction](#introduction)
* [Repository List](#repository-list)
* [Project Dependencies](#project-dependencies)

---------------

## Introduction ##

The StateDMI software is currently developed as multiple projects within an Eclipse workspace,
where each Eclipse project corresponds to a similarly named Git repository.
This approach ensures that StateDMI is not impacted by other software products in the workspace,
and confusion about repository/project mapping is avoided.
Currently Eclipse project files (not workspace files) are saved in the repository but these files
may be ignored with `.gitignore` in the future to remove Eclipse artifacts.
The same code management concepts should apply if an alternate environment to Eclipse is used for development.

## Repository List ##

The decision about what content lives in a repository has been made based on years
of experience sharing repositories and implementing development environments.
The following table summarizes the repositories for StateDMI.
A naming convention has been adopted that delineates application, library, and utility components.
This convention should allow code to be developed using environments other than Eclipse.
The Java packages within each repository have historical significance and could benefit from
refactoring; however, this will be disruptive and is not planned for the near-term.

**<p style="text-align: center;">
StateDMI GitHub Repositories and Code Projects (listed alphabetically)
</p>**

|**GitHub Repository**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Eclipse Project**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Primary File Type**|**Description**|
|--|--|--|--|
|[`cdss-app-statedmi-doc-dev`](https://github.com/OpenCDSS/cdss-app-statedmi-doc-dev)|`cdss-app-statedmi-doc-dev`|Markdown|New Markdown/MkDocs developer documentation|
|[`cdss-app-statedmi-doc-user`](https://github.com/OpenCDSS/cdss-app-statedmi-doc-user)|`cdss-app-statedmi-doc-user`|Markdown|New Markdown/MkDocs user documentation.|
|[`cdss-app-statedmi-main`](https://github.com/OpenCDSS/cdss-app-statedmi-main)|`cdss-app-statedmi-main`|Java|Main StateDMI application code|
|[`cdss-app-statedmi-test`](https://github.com/OpenCDSS/cdss-app-statedmi-test)|`cdss-app-statedmi-test`|StateDMI command files|Functional tests using built-in test features.|
|[`cdss-lib-cdss-java`](https://github.com/OpenCDSS/cdss-lib-cdss-java)|`cdss-lib-cdss-java`|Java|CDSS code components shared across CDSS applications|
|[`cdss-lib-common-java`](https://github.com/OpenCDSS/cdss-lib-common-java)|`cdss-lib-common-java`|Java|Utility code components shared across applications|
|[`cdss-lib-dmi-hydrobase-java`](https://github.com/OpenCDSS/cdss-lib-dmi-hydrobase-java)|`cdss-lib-dmi-hydrobase-java`|Java|API for Colorado's HydroBase database and web services|
|[`cdss-lib-dmi-hydrobase-rest-java`](https://github.com/OpenCDSS/cdss-lib-dmi-hydrobase-rest-java)|`cdss-lib-dmi-hydrobase-rest-java`|Java|API for Colorado's HydroBase REST web services|
|[`cdss-lib-models-java`](https://github.com/OpenCDSS/cdss-lib-models-java)|`cdss-lib-models-java`|Java|API for CDSS StateCU and StateMod models|
|[`cdss-util-buildtools`](https://github.com/OpenCDSS/cdss-util-buildtools)|`cdss-util-buildtools`|NSIS, Launch4J, various|Utility programs to build StateDMI installer|
|Plugin datastores and commands|Repository name is recommended|Java|Repositories and projects for plugin datastores and commands can be added to the workspace.  Plugins are a new design element and the approach will evolve.|

The [New Developer](../../dev-new/overview.md) documentation describes the typical way to set up the development environment.
In short, the above repositories are typically cloned from GitHub to a parent folder such as
`C:\Users\user\cdss-dev\StateDMI\git-repos` on Windows.
Then the projects are imported into an Eclipse workspace.
The core StateDMI software relies on the multiple Java code repositories to resolve dependencies.
Documentation and functional test repositories can be worked on independently of the code,
which allows contributions from non-programmers.

Code is for the most part split into commands and data persistence, which can be implemented as a datastore
(file, database, web service) or file I/O library.
If the API code is minimal, then such code often lives with the read and write commands in a Java package.
If the API code is substantial, it may be managed as a separate repository and corresponding project,
for example the State of Colorado's HydroBase library.

## Project Dependencies ##

The Java projects have dependencies.  Consequently, once projects are imported into Eclipse,
the ***Build Path*** tool must be used to add project dependencies.
These dependencies are saved in each repository's Eclipse project files and therefore
a new developer currently does not need to define the dependencies.
However, this may be changed in the future to allow more flexibility in using development
environments other than Eclipse.
See the README file for each repository for a list of dependencies.

The use of Maven has been considered but the complexity of the development environment
will require resources to ensure that this change can be done without negative impacts,
such as breaking the install builder.
