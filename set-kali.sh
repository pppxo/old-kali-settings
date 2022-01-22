clear
i=0
echo "|"
while [ $i -le 100 ]
do
echo $i "%"
i=$(( $i + 1 ))

sleep 0.1
clear
done
