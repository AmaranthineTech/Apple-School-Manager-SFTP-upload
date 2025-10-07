# Apple-School-Manager-SFTP-upload
Script to upload the csv files to Apple School Manager

## Usage
## --------------------
This script uses the expect utility to perform the sftp upload. Place the zip file containing the csv documents in any folder that can be accessed by the script. 
To run the script:
```SHELL
/bin/zsh /path/to/script/asmSFTPUpload.zsh /path/to/Archive.zip
```

**Note that not providing the path to the zip file results in an error.**
