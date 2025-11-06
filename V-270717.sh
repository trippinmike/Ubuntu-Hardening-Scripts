#!/usr/bin/env bash

# -----------------------------------------------------
# must not allow unattended or automatic login via SSH
# -----------------------------------------------------

#identify the file as a variable
config_file=/etc/ssh/sshd_config

#identify the parameters the control is seeking
params=("PermitEmptyPasswords" "PermitUserEnvironment")

#flag for control passing
all_passed=true

for param in "${params[@]}"; do 
	#extract the vales in the config file ignoring the commented out lines
	value=$(grep -iE "^\s*$param" "$config_file" | awk '{print($2)}')
	
	if [[ -z "$value" ]]; then
		#echo "$param not found in $config_file"
		all_passed=false
	elif [[ "$value" == "no" ]]; then
		#echo "Control passed"
		all_passed=true
	elif [[ "$value" == "yes" ]]; then
		#echo "Control failed"
		all_passed=false
	else
		#echo "$param = $value --> unknown value"
		all_passed=false
	fi
done

#final check 
if [[ "$all_passed" == true ]]; then
	echo "Control passed"
else
	echo "Control failed"
fi
