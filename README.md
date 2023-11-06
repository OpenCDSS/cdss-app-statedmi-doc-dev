# cdss-app-statedmi-doc-dev #

This repository contains the developer documentation for Colorado's Decision Support Systems (CDSS) StateDMI software.
The documentation uses Markdown format and MkDocs software to create a static website.

See the following online resources:

*   Latest deployed [CDSS / StateDMI (Developer)](https://opencdss.state.co.us/statedmi/latest/doc-dev) documentation
*   [Colorado's Decision Support System (CDSS)](https://cdss.colorado.gov)
*   [OpenCDSS](https://opencdss.state.co.us/opencdss/)
*   [StateDMI software main repository](https://github.com/OpenCDSS/cdss-app-statedmi-main)
*   [StateDMI User Documentation](https://opencdss.state.co.us/statedmi/latest/doc-user/)

See the following sections in this page:

*   [StateDMI Software Overview](#statedmi-software-overview)
*   [Repository Contents](#repository-contents)
*   [Development Environment](#development-environment)
*   [Editing and Viewing Content](#editing-and-viewing-content)
*   [Style Guide](#style-guide)
*   [License](#license)
*   [Contributing](#contributing)
*   [Maintainers](#maintainers)
*   [Contributors](#contributors)
*   [Release Notes](#release-notes)

---------------------------

## StateDMI Software Overview ##

The StateDMI software is a Java application that automates data processing,
primarily for CDSS StateCU and StateMod models:

1.  Command-based workflow language.
2.  General commands including file manipulation
    and support for processor properties to allow dynamic scripting.
3.  Data processing commands for:
    1.  Reading data from files, databases, and web services
    2.  Creating data objects associated with CDSS StateCU and StateMod models
    3.  Setting data
    4.  Filling data
    5.  Manipulating data (aggregating, translating into modeling concepts, etc.)
    6.  Writing data to files for StateCU and StateMod models
    7.  Checking data
4.  Built-in testing framework, which is used to run functional tests,
    suitable for software developers and also
    non-programmers who want to validate processing workflows.
5.  Multiple run modes including batch and user interface.

## Repository Contents ##

The repository contains the following:

```text
.github/              Files specific to GitHub such as issue template.
.gitattributes        Typical Git configuration file for repository attributes.
.gitignore            Typical Git configuration file for ignored file list.
README.md             This file.
LICENSE.md            License file.
build-util/           Useful scripts to view, build, and deploy documentation.
mkdocs-project/       Typical MkDocs project for this documentation.
  mkdocs.yml          MkDocs configuration file for website.
  docs/               Folder containing source Markdown and other files for website.
    css/              Custom CSS to augment MkDocs theme.
  site/               Folder created by MkDocs containing the static website - ignored using .gitignore.

```

The repository can be cloned into the recommended standard CDSS development folder structure,
shown below.  Each of the component libraries have README files that indicate dependencies.

```text
C:\Users\user\                            Windows:  User's files.
/home/user/                               Linux:  User's files.
/cygdrive/C/Users/user/                   Cygwin:  User's files.
  cdss-dev/                               Main development location for CDSS products.
    StateDMI/                             StateDMI software development files.
      git-repos/                          Git repositories for StateDMI software.
        cdss-app-statedmi-doc-dev/        Developer documentation using Markdown/MkDocs.
        cdss-app-statedmi-doc-user/       User documentation using Markdown/MkDocs (proposed, currently in main repo).
        cdss-app-statedmi-main/           Main statedmi application, includes processing commands.
        cdss-app-statedmi-test/           Functional tests that run command files (proposed, currently in main repo).
        cdss-lib-cdss-java/               Shared CDSS code.
        cdss-lib-common-java/             Shared general utility code.
        cdss-lib-dmi-hydrobase-java/      State of Colorado's HydroBase API.
        cdss-lib-dmi-hydrobase-rest-java/ State of Colorado's HydroBase REST web services API.
        cdss-lib-models-java/             CDSS StateCU and StateMod model API.
        cdss-util-buildtools/             Utilities to build and deploy statedmi.
```

## Development Environment ##

The development environment for contributing to this documentation requires
installation of Python, MkDocs, and Material MkDocs theme.
Python 3 and MkDocs 1+ has been used for development.
See the [OWF / Learn MkDocs](https://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing these tools.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1.  Edit content in the `mkdocs-project/docs` folder and update `mkdocs-project/mkdocs.yml` as appropriate.
2.  Run the `build-util/run-mkdocs-serve-8001.sh` script (Cygwin/Linux) or equivalent.
3.  View content in a web browser using URL `http://localhost:8001`.

## Style Guide ##

The following are general style guide recommendations for this documentation,
with the goal of keeping formatting simple in favor of focusing on useful content:

*   Use the Material MkDocs theme - it looks nice, provides good navigation features, and enables search.
*   Follow MkDocs Markdown standards - use extensions beyond basic Markdown when useful.
*   Show files and program names as `code (tick-surrounded)` formatting.
*   Where a source file can be linked to in GitHub, provide a link so that the most current file can be viewed.
*   Use triple-tick formatting for code blocks, with language specifier.
*   Use ***bold italics*** when referencing UI components such as menus.
*   Use slashes to indicate ***Menu / SubMenu***.
*   Images are handled as follows:
    +   Where narrative content pages are sufficiently separated into folders,
        image files exist in those folder with names that match the original TSTool Word documentation.
        This approach has been used for the most part.
    +   If necessary, place images in a folder with the same name as the content file and include
        `-images` at the end of the folder name at the same level
        (for example `x.md` and `x-images/`)
        or include an `images` folder under the content folder.
    +   When using images in the documents, consider providing a link to look at the full-sized
        image, as follows (normal MkDocs approach does not seem to work?):

        ```text
        The following figure illustrates the ***ReadWellRightsFromHydroBase*** command.
        <a href="../Command.png">See also the full-size image.</a>

        ![ReadWellRightsFromHydroBase](ReadWellRightsFromHydroBase.png)
        ```
*   Minimize the use of inlined HTML elements, but use it where Markdown formatting is limited.
*   Although the Material them provides site and page navigation sidebars,
    provide in-line table of contents on pages, where appropriate, to facilitate review of page content.
    Use a simple list with links to sections on the page.

## License ##

The license for this documentation is the
[Creative Commons Attribution International 4.0 (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).  See the [LICENSE.md](LICENSE.md) file.

## Contributing ##

Contribute to the documentation as follows:

1.  Use GitHub repository issues to report minor issues.
    Fill out the template issue.
2.  Use GitHub pull requests.
3.  A member of the core development team will follow up to issues and pull requests.

## Maintainers ##

This repository is maintained by the OpenCDSS team.

## Release Notes ##

The following release notes indicate the update major history for documentation.
See the GitHub issues and repository history for detailed information.

*   2023-11-04 - Updated documentation for StateDMI 5.2.0 release, using OpenJDK Java 8.
*   2023-04-20 - Updated documentation to fix broken links and remediate issues related to accessibility including alt text for images and heading structures.
*   2019-04-26 - Update to use opencdss.state.co.us.
*   2019-01-09 - Update for publid release of OpenCDSS.
*   2018-07-03 - Initial content patterned after TSTool developer documentation.
