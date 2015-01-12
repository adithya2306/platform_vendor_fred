export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

touch $Changelog

# define changelog_days using 'export changelog_days=7'
# this can be done before intiate build environment (. build/envsetup.sh)
if [ -z $changelog_days ];then
	changelog_days=7
else
	if (($changelog_days > 30 )); then
        echo "Changelog can not generated for more then 30 days. For how many days do you want to generate changelog again? (🕑 timeout 15 seconds - default to 7 days)"
        read -r -t 15 changelog_days || changelog_days=7
	fi
fi

for i in $(seq $changelog_days);
do
export After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
	export Until_Date=`date --date="$k days ago" +%m-%d-%Y`

	# Line with after --- until was too long for a small ListView
	echo '====================' >> $Changelog;
	echo  "     "$Until_Date    >> $Changelog;
	echo '====================' >> $Changelog;
	echo "" >> $Changelog;
	# Cycle through every repo to find commits between 2 dates
	repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date' >> $Changelog
	echo "" >> $Changelog;
done

sed -i 's/project/   */g' $Changelog

cp $Changelog $OUT/system/etc/
cp $Changelog $OUT/
rm $Changelog
