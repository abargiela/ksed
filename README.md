- [Description](#description)
- [Encrypt file](#encrypt-file)
- [Decrypt file](#decrypt-file)
- [Encrypt hash](#encrypt-hash)
- [Decrypt hash](#decrypt-hash)
- [Example of secret file in plain text](#example-of-secret-file-in-plain-text)

# Description
`ksed` = Kubernetes secret encrypt/decrypt

This script can be used in your pipeline to convert the secret file in plain text to an ecrypted one.
Or you can use it as standalone! 

`PS.: When the script runs to encrypt the file it generates a backup file to preserve your original.`

# Encrypt file
`ksed -e /path/to/your/file/in/plain/text`

# Decrypt file
`ksed -d /path/to/your/encrypted/file`

# Encrypt hash
`ksed -e stringToEncrypt`

# Decrypt hash
`ksed -d HashBase64ToDecrypt`


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


Special thanks for: [Jefferson Alcantara](https://github.com/jefferson22alcantara) who colaborates in this script!!
