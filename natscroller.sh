#!/bin/bash
while true 
do	
		
    	OUTPUT=$(lsusb)
	BT_output=$(hcitool dev)
	echo "Running script .."
	key_arr=("Mouse" "mouse" "MOUSE") 
	
	declare -i flag=0

	for str in ${key_arr[@]}; do
		#echo "Checking for"
		#echo "$str"
		if [[ $OUTPUT =~ "$str" ]] || [[ $BT_output =~ "$str" ]] ; then
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
			flag=1
		fi
	

	done

	if [ $flag -eq  0 ]; then
		echo "Mouse not found; running for touchpad"
		
		key_arr=("touchpad" "Touchpad" "TOUCHPAD")
			
		for str in ${key_arr[@]}; do
		#echo "Checking for"
		#echo "$str"
		OUTPUT=$(xinput -list)
			if [[ $OUTPUT =~ "$str" ]] ; then
			input_list=$(xinput --list)
			#echo "${input_list}"
			ids=$(xinput --list | awk -v search="$str" \
    		'$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )			
			nat_scroll_id=303 #xinput list-props on Ubuntu 18.04

			for i in $ids; do

				str_nat=("Natural Scrolling" "Natural scrolling")
				
				echo "$i id found"
				xinput set-prop $i $nat_scroll_id 1

			done
			
		#fi
	

 
	fi	
	
	#echo "${OUTPUT}"

 
done

fi
    	sleep 5

done
