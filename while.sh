# set n to 1
n=1

while [ $n -le 5 ]
do
	echo "Welcome $n times."
	n=$(( n+1 ))	 # increments $n
done