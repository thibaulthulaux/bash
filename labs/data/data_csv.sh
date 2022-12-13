#!/bin/bash
input="data.csv"
 
#
# Removing all white spaces from input string
# I am reading data into array for further processing if needed and it is safe 
# Modified idea from https://stackoverflow.com/a/61087835 as per my needs 
trim_all_white_spaces() {
	mapfile -t input_array<<<"$*"
	[[ ${#input_array[@]} -eq 0 ]] && { echo "Input data missing"; exit 1; }
	set -- ${input_array[@]}
	printf '%s\n' "$*"
}
 
[ ! -f "$input" ] && { echo "$0 - $input file not found"; exit 1; }
 
while IFS='|' read -r cname cadd ctel cemail cd1 cd2
do 
	# ignore comment line 
	# see if $cname starts with '#' and if so read next line
	[[ $cname == \#* ]] && continue 
	echo "|$( trim_all_white_spaces "$cname" )|"; 
	echo "|$( trim_all_white_spaces "$cadd" )|"; 
	echo "|$( trim_all_white_spaces "$ctel" )|"; 
	echo "|$( trim_all_white_spaces "$cemail" )|"; 
	echo "|$( trim_all_white_spaces "$cd1" )|"; 
	echo "|$( trim_all_white_spaces "$cd2" )|"; 
done < "$input"
