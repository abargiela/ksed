# Description
ksed = Kubernetes secret encrypt/decrypt

This script can be used in your pipeline to convert the secret file in plain text to a ecrypted one.
Or you can use it as standalone! 

PS.: When the file is encrypted the script generate a backup file to preservate your original file.

# Encrypt file
ksed -e /path/to/your/file/in/plain/text

# Decrypt file
ksed -d /path/to/your/file/in/plain/text

# Encrypt hash
ksed -e stringToEncrypt

# Decrypt hash

For help use ksed -h
