
if (([ $1 -gt 7 ] && [ $1 -lt 10 ] ) || ([ $1 -gt 17 ] && [ $1 -lt 20 ] )) 2> /dev/null
#> /dev/null 2>&1
then
echo "right number"
else
echo "wrong number"
echo "Help: right numbers are : 8,9,18,19"
fi