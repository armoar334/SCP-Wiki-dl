#loop to de-html-ify SCP wiki page(s)
echo "USAGE: ./SCPWIKIDOWNLOADONE.sh [SCP number, unformatted e.g: 1 not 001]"

#download pages
INPUT=$1
printf -v INPUT "%03d" "$INPUT"
w3m http://scp-wiki.wikidot.com/scp-$INPUT -dump | sed -n -e '/SCP-/,/Other interesting sites/ p' | head -n -14 |cat > SCP-$INPUT.txt
echo SCP-$INPUT Downloaded

echo Done
