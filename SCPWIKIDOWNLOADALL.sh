#loop to de-html-ify SCP wiki page(s)

#amount of articles total currently ~7000
#technichally its actually the highest registered scp number
echo JUST SO YOU KNOW this deosnt do EX or joke scp bc im lazy and havent added it yet
echo ALSO according to my calculations it will take 7.7 hours to do all of it so have fun
echo might be quicker on faster PC or internet
echo the script will now sleep for 10 secs so u can read and not have to spam ^C
sleep 10

AMOUNT=7000

#download pages
COUNT=1
while [ $COUNT -le $AMOUNT ]
do
	printf -v NUMBER "%03d" "$COUNT"
#	echo $NUMBER
	w3m http://scp-wiki.wikidot.com/scp-$NUMBER -dump | sed -n -e '/SCP-/,/Other interesting sites/ p' | head -n -14 |cat > SCP-$COUNT.txt
#	this is horrible ^ and takes forever but im too lazy to make wget-ing the page format properly so tough
	echo SCP-$COUNT Downloaded
	COUNT=$((COUNT+1))
	sleep 0.35
done

echo Done
