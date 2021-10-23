#!/bin/bash
while true 
do	
		
    	OUTPUT=$(lsusb)
	key_arr=("Mouse" "mouse" "MOUSE") 
	for str in ${key_arr[@]}; do
		#echo "Checking for"
		#echo "$str"
		if [[ $OUTPUT =~ "$str" ]]; then
			input_list=$(xinput --list)
			#echo "${input_list}"
			ids=$(xinput --list | awk -v search="$str" \
    		'$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )			
			nat_scroll_id=303 #xinput list-props on Ubuntu 18.04

			for i in $ids
			
			do
				xinput set-prop $i $nat_scroll_id 0
			done
		fi

	done	
	
	echo "${OUTPUT}"

 
    	sleep 5
done

