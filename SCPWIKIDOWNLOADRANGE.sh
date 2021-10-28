#loop to de-html-ify SCP wiki page(s)
echo "USAGE: ./SCPWIKIDOWNLOADRANGE.sh [First SCP Second SCP [unformatted e.g: 1 not 001]]"
echo "Example: ./SCPWIKIDOWNLOADRANGE.sh "
ehco "\nTHIS ONE THROWS ERRORS, i dont know why but in my testing it still works fine, so idk use at ur own risk lmao"



#download pages
START=$1
END=$2
INPUT=$START
until [ $START -gt $END]
do	
	printf -v INPUT "%03d" "$INPUT"
	w3m http://scp-wiki.wikidot.com/scp-$INPUT -dump | sed -n -e '/SCP-/,/Other interesting sites/ p' | head -n -14 |cat > SCP-$INPUT.txt
	echo SCP-$INPUT Downloaded
	INPUT=$((INPUT + 1))
	sleep 0.35
done
	
echo Done
