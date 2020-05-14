empty=""
none_empty="non empty"

if [ -z $empty ]
then 
echo "empty string"
fi

if test -z $empty 
then 
echo "empty string"
fi

if [ -n "$none_empty" ]
then 
echo "none empty string"
fi

if test -n "$none_empty"
then 
echo "none empty string"
fi

foo=3

if [ $foo -ge 3 ]; then
echo "foo is greater than or equal to 3"
fi
if [ $foo -ge 3 -a $foo -lt 10 ]; then
echo "foo is greater than or equal to 3 and less than 10"
fi

if test $foo -ge 3; then
echo "foo is greater than or equal to 3"
fi

regularfile="until.sh"
if [ -f $regularfile ]; then
echo "$regularfile is a regular file"
fi

not_regularfile="/dev/null"
if [ ! -f $not_regularfile ]; then
echo "$not_regularfile is not a regular file"
fi

readablefile="while.sh"
if [ -r $readablefile ]; then
echo "$readablefile is readable"
fi

#DOUBLE BRECES exaples [[ ]]

stringvar="a string is a sequence of characters"
if [[ "$stringvar" == *quen* ]]; then
echo "\"$stringvar\" contains \"quen\""
fi

if [[ "$stringvar" == *[qQ]uen* ]]; then
echo "\"$stringvar\" contains \"quen\""
fi

stringvarwithspaces="foo bar baz"
#without dobule braces this is gives error of "too many arguments" because of word splitting 
if [[ $stringvarwithspaces != foo ]]; then
echo "$stringvarwithspaces is not equal to foo"
fi


# if there is file called "*.sh"
if [[ -a *.sh ]]; then
echo "there is file called *.sh"
fi

num=5
stringvar="bar"
#usage of && and || in double breces
if [[ ($num -eq 3 && "$stringvar" == foo ) || "$stringvar" == bar ]]; then
echo "using &&  and || in double braces"
fi

#Double-parenthesis syntax.........................

if (( ($num <= 5  && "$stringvar" == foo) || "$stringvar" == bar )); then
echo "Double-parenthesis example"
fi