# Documentation #

**This documentation needs to be cleaned up - it is not totally accurate.**

StateDMI software has significant developer and user documentation.

* [Markdown/MkDocs Documentation](#markdownmkdocs-documentation)
* [Legacy Word/PDF Documentation](#legacy-wordpdf-documentation)

----------------------

## Markdown/MkDocs Documentation ##

StateDMI developer documentation was written in Markdown/MkDocs.
User documentation currently exists in Word/PDF but it is recommended to migrate to Markdown/MkDocs and use the following repository:

* [User Documentation](https://github.com/OpenWaterFoundation/cdss-app-statedmi-doc-user)
* [Developer Documentation](https://github.com/OpenWaterFoundation/cdss-app-statedmi-doc-dev)

The Markdown/MkDocs documentation is now the standard documentation and the legacy documentation discussed
in the next section is being phased out.  MkDocs creates a static HTML website from Markdown,
with nice theme-based formatting, search, and navigation.
Any web browser can be used to view the documentation.

The following design issues still need to be resolved:

1. PDF documentation was distributed with the software, which significantly increased the size of the installer.
	1. Moving to MkDocs/HTML on a public website without distributing with software will decrease the size of the installer.
	The existing installer logic needs to transition away from packaging PDF files.
	2. There may be a need to publish different versions of documentation, such as "latest" as well
	as documentation for a version (e.g., "12").  How to handle cross-links to such documentation?
	Maybe post-process the generic documentation to remove generic references in the URLs
	so that version-specific links can be used?
2. StateDMI currently calls a system method to open the PDF file when viewing documentation.
	1. This will need to be changed to view the public website HTML.
	2. A configuration file will be needed, potentially with main and backup websites.
	3. Command dialogs could be updated to provide a button to link to the website.

## Legacy Word/PDF Documentation ##

Legacy user documentation was created in Word format and manually saved to PDF from Word,
saved in the following repository:

* [cdss-app-statedmi-main/doc](https://github.com/OpenWaterFoundation/cdss-app-statedmi-main/tree/master/doc)

Each file uses header and other styles that allow a table of contents to be created.
However, automating conversion of Word to PDF is not straightforward
(at least it was not when the procedure was put in place and given the need to focus resources
on technical work to enhance the software features).
Consequently, PDF files are committed to the repository and a custom Java program
that uses [iText](https://itextpdf.com/).
However, this tool has never been released publicly and is not integrated into the StateDMI repositories.
The legacy approach should generally not be needed now that StateDMI user documentation has
been migrated to Markdown/MkDocs.
If Word/PDF needs to be processed, current PDF automation tools could be used or the
PDF tool could be made available (not a high priority).
