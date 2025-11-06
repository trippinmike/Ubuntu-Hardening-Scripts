#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------
# map the authenticated identity to the user or group account for PKI-based authentication
# ----------------------------------------------------------------------------------------

#Verify that authenticated certificates are mapped to the appropriate user group in the "/etc/sssd/sssd.conf"
grep -i ldap_user_certificate /etc/sssd/sssd.conf

echo "Control N/A"
