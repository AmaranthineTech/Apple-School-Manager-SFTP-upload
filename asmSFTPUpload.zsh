#!/bin/zsh
#!/usr/bin/expect

# ****************************************************************************************************
# NAME: 	asmSFTPUpload.zsh
# AUTHOR:	Arun Patwardhan
# DATE: 	7th October 2025
# CONTACT:	arun@amaranthine.co.in
# ****************************************************************************************************

# ****************************************************************************************************
#MIT License
#
#Copyright (c) 2020 Amaranthine
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
# ****************************************************************************************************

# ****************************************************************************************************
# Usage
# --------------------
# This script uses the expect utility to perform the sftp upload. Place the zip file containing the csv documents in any folder that can be accessed by the script. 
# To run the script:
# /bin/zsh /path/to/script/asmSFTPUpload.zsh /path/to/Archive.zip
# Note that not providing the path to the zip file results in an error. 
# ****************************************************************************************************

# ****************************************************************************************************
# **WARNING**: Please test the script before using it.
# ****************************************************************************************************

# ****************************************************************************************************
# ********** SCRIPT STARTS HERE **********
# ****************************************************************************************************

ZIP_FILE_PATH=""

# Check for file path
# --------------------
if [[ $1 != "" ]]; then
	echo "Uploading file at location $1"
	ZIP_FILE_PATH="$1"
else
	echo "ERROR: Please input a path to the zip file."
	exit 1
fi

# Prepare SFTP credentials
# --------------------
# Replace the variable values with values from your Apple School Manager account.

USER_NAME="----------@sftp.apple.com"
LINK="upload.appleschoolcontent.com"
PWD="**********"

echo "Starting upload"

/usr/bin/expect << EOF

spawn /usr/bin/sftp $USER_NAME@$LINK

expect "password:"
send "$PWD\n"

expect "sftp>"

send "ls\n"

expect "sftp>"
send "put $ZIP_FILE_PATH dropbox\n"

expect "sftp>"
send "exit\n"

expect eof
EOF

echo "Uploaded!"

# ****************************************************************************************************
# ********** END OF SCRIPT **********
# ****************************************************************************************************