scriptdllist="./continuefile"
    while IFS= read -r line
    do
        ./xtestd.sh ${line}
        echo "${line}" >> done.log
        sed -i '1d' continuefile
    done <"$scriptdllist"
