start=$(pwd)

function code_in {
    cd #YOUR ROOT SRC DIRECTORY GOES HERE
    matches=($(find . -maxdepth 2 -name "*$1*"))
    if [ ${#matches[@]} = 1 ]; then
        cd ${matches[0]}
    elif [ ${#matches[@]} -gt 1 ]; then
        echo "Multiple matches:"
        index=0
        for i in "${matches[@]}"; do
            echo "$((index+1)): $i"
            ((index++))
        done
   	read -p "Select out of the following: " selection
    	cd ${matches[selection-1]}
    else
    	echo No folders with this name found
    	cd $start
    fi
}
