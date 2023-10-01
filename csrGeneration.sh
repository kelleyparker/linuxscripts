#!/bin/bash

# A certificate generation script I used at an employer.  (be sure to check these variables
# - domain=""
# - keystore_password=""
# - and the OU/O/L/ST/C in the keytool command

# Define the domain name
alias_name=""
domain=""
fqdn=""

read -p "Enter the alias name WITHOUT the <INSERT domain HERE>: " alias_name

if [ -z "$alias_name" ]; then
    echo "Alias name cannot be empty."
    exit 1
fi

# Combine alias and domain to create FQDN
fqdn="${alias_name}.${domain}"

keystore_password=""

# Check if alias_name.jks exists
if [ -f "$fqdn.jks" ]; then
    backup_folder="backups-$fqdn"
    backup_suffix="$(date +"%Y-%m-%d_%H-%M-%S")"

    mkdir -p "$backup_folder"

    mv "$fqdn.jks" "$backup_folder/${fqdn}_${backup_suffix}.jks"
    mv "$fqdn.csr" "$backup_folder/${fqdn}_${backup_suffix}.csr"
    mv "$fqdn_fingerprint.txt" "$backup_folder/${fdqn}_${backup_suffix}.csr"

    echo "Backed up older versions of $fqdn.jks and $fqdn.csr to $backup_folder"
fi

# Append the domain to the alias name
full_alias="${alias_name}.${domain}"

keytool -genkey -alias "$full_alias" -keyalg RSA -keysize 2048 -keystore "$full_alias.jks" -storepass "$keystore_password" -keypass "$keystore_password" -dname "CN=$full_alias,OU=[], O=[], L=, ST=[], C=[]" && \
keytool -certreq -alias "$full_alias" -file "$full_alias.csr" -keystore "$full_alias.jks" -storepass "$keystore_password" && \
echo "Your certificate signing request is in $full_alias.csr. Your keystore file is $full_alias.jks. Thanks for using the DigiCert keytool CSR helper."

keytool -list -v -keystore "$full_alias.jks" -storepass "$keystore_password" > "${full_alias}_fingerprint.txt"
echo "Fingerprint details have been exported to ${full_alias}_fingerprint.txt"
