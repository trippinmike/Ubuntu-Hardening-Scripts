#!/usr/bin/env bash

# ------------------------------------------------------------
# List sudo‑enabled users except the user "nemo"
# ------------------------------------------------------------

group="sudo"

#gather users from the primary sudo group
group_sudo_users=$(getent group "$group" | awk -F: '{print $4}')
#echo "$group_sudo_users"

IFS=',' read -r -a member_array <<< "$group_sudo_users"

check_failed=false

for user in "{$member_array[@]}"; do
	if [ "$user" != "nemo" ] && [ -n "$user" ]; then
		check_failed=true
		break
	fi
done

if [ "$check_failed" = true ]; then
	echo "Control failed"
else
	echo "Control Passed"
fi
