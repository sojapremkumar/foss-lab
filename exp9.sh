while [ 1 ];
do
echo "checking run-away process..."
cpu_usage=$( uptime | cut -d","-f4 | cut -d":"-f2|$ed -e "s/\.//g")
cpu_usage_threshold=800
process= $( ps aux r )
topprocess= $(ps -eo pid -eo pcpu -eo command | sort -k 2 -r | grep -v pid | head -n 1 )
if [ $cpu_usage -gt $cpu_usage_threshold ];
then
kill -9 $( ps -eo pcpu | sort -k -1 -r | grep -v %cpu | head -n 1 )
kill -9 $topprocess
echo "system overloading!"
echo "cpu usage is at" $cpu_load
else
echo "no top processes"
exit 0
sleep 1;
fi
done


