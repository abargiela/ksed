- [Description](#description)
- [Convert to base64 file](#convert-to-base64-file)
- [Restore the file to plain text](#restore-the-file-to-plain-text)
- [Convert a hash to base64](#convert-a-hash-to-base64)
- [Restore base64 hash to PlainText](#restore-base64-hash-to-plaintext)
- [Example of secret file in plain text](#example-of-secret-file-in-plain-text)
- [Know problems](#know-problems)

# Description
`ksed` = Kubernetes secret encode/decode 

This script can be used in your pipeline to convert the secret file in plain text to a base64 one.
Or you can use it as standalone! 

`PS.: When the script runs to convert the file secrets into a base64 format, it generates a backup file in the same directory where the original file is, so, take care to do not commit this backup file, or simply comment the line 17.`

# Convert to base64 file
`ksed -e /path/to/your/file/in/plain/text`

# Restore the file to plain text
`ksed -d /path/to/your/file/in/base64`

# Convert a hash to base64
`ksed -e stringToConvert`

# Restore base64 hash to PlainText
`ksed -d HashBase64ToPlainText`


For help use `ksed -h`

# Example of secret file in plain text

```
name: Linus
pass: x1y2p3
```

The file in plain text `can` contains spaces or enters, the script normalizes it, for example: 

```

name: Linus
pass: x1y2p3

address: localhost      
id: 32 
```

# Known problem
If you run the script converting the file to base64, so run again it will generate the base64 of the already converted base64 file, know this, we implemented the backup function, to preserve the original file in case you do not have this file in a repository or anything like that, again, do not forget to remove the backup file before commit the file in you repository.

Special thanks for: [Jefferson Alcantara](https://github.com/jefferson22alcantara) who colaborates in this script!!
