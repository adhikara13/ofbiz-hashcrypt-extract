#!/bin/bash

read -p "Enter your hashcrypt: " input

salt=$(echo $input | cut -d'$' -f3)
encoded=$(echo $input | cut -d'$' -f4)

pad_length=$(( (4 - ${#encoded} % 4) % 4 ))
padded_encoded=$(printf '%s%s' "$encoded" $(head -c $pad_length < /dev/zero | tr '\0' '='))

decoded_hex=$(echo -n $padded_encoded | tr '_-' '/+' | base64 -d 2>/dev/null | xxd -p -c256 | tr -d '\n')

hash_with_salt="${decoded_hex}:${salt}"

echo "Hash with Salt: $hash_with_salt"

echo "Now you can crack the hash using Hashcat with the following command:"

echo "$hash_with_salt" > temp_hash.txt

echo "hashcat -m 120 -a 0 temp_hash.txt your_wordlist.txt"