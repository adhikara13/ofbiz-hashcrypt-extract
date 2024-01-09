# Hashcrypt OFBiz Preprocessor

## Overview
This script serves as a pre-processor for hashcrypt hashes. It is specifically designed to prepare hashcrypts from Apache OFBiz for cracking with Hashcat. The script extracts and decodes both the salt and the encoded part of the hashcrypt, then outputs them in a format suitable for Hashcat cracking using the -m 120 mode.

## Requirements
- Bash shell
- Base64 utility
- xxd utility

## Usage
1. Run the script in a bash shell.
2. When prompted, enter your hashcrypt.
3. The script will output the processed hash, which includes the decoded hex value and the salt, separated by a colon (`:`).

## Example
```bash
$ ./decode.sh
Enter your hashcrypt: [Enter your hashcrypt here]
Hash with Salt: [decoded_hex_value]:[salt]
```

After running this script, you can use the output with Hashcat to crack the SHA1 hash. Use the Hashcat command with mode `-m 120`:

```bash
hashcat -m 120 [options] [hash_with_salt_file]
```

Replace `[options]` with your preferred Hashcat options and `[hash_with_salt_file]` with the file containing the hash output from the script.


## Reference
For further context and understanding of the hashcrypt mechanism in Apache OFBiz, refer to the HashCrypt Java implementation in the OFBiz repository:
[Apache OFBiz HashCrypt Implementation](https://github.com/apache/ofbiz/blob/trunk/framework/base/src/main/java/org/apache/ofbiz/base/crypto/HashCrypt.java)
