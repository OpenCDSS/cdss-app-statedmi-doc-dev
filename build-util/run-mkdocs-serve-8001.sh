#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# Run 'mkdocs serve' on port 8001
# - this allows user documentation to be served on port 8000

# Make sure that this is being run from the build-util folder
pwd=`pwd`
dirname=`basename ${pwd}`
if [ ! ${dirname} = "build-util" ]
        then
        echo "Must run from build-util folder"
        exit 1
fi

cd ../mkdocs-project

echo "View the website using http://localhost:8001"
echo "Stop the server with CTRL-C"
mkdocs serve -a 0.0.0.0:8001
#mkdocs serve