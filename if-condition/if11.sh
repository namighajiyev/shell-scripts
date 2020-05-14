if grep -Fq 'ERROR'  /var/log/auth.log; then
  # there were problems at some point
  echo error
elif grep -Fq 'WARN' /var/log/auth.log; then
  # there were minor problems at some point
  echo warn
else
  # all ok!
  echo ok
fi

is_admin() {
  return 1; #if returns 0 then runs...
}

if is_admin; then
  # this will not run
  echo "is admin"
fi

if cat /var/log/auth.log | grep -Fq 'ERROR'; then
 echo error
fi

true; echo $?
# => 0

false; echo $?
# => 1

! true; echo $?

if ! grep -Fq 'ERROR' /var/log/auth.log; then
  # All OK
  echo ok
fi

if true; then
  echo true
fi

if false; then
  echo false
fi

var=false

if ! "$var"; then
  echo "! $var"
fi

if test -z "$variable"; then
  # $variable has (z)ero size
  echo '$variable has (z)ero size or is undefined'
fi

if test -f ~/foo.txt; then
  # ~/foo.txt is a regular (f)ile
  echo '~/foo.txt is a regular (f)ile'
fi

foo='bar'

if test "$foo" = 'bar'; then
  # $foo equals 'bar', as a string
  echo '$foo equals 'bar', as a string'
fi

if test "$foo" != 'bar'; then
  # $foo does not equal bar, as a string
  echo '$foo does not equal bar, as a string'
fi

if test "$foo" != 'bar' && test "$foo" != 'baz'; then
  echo '$foo is not bar or baz'
fi

if test "$foo" != 'bar' && { test -z "$bar" || test "$foo" = "$bar"; }; then
  echo  '$foo is not bar and ( $bar is empty or $foo is equal to it )'
fi

if test "$foo" != 'bar' -a "$foo" != 'baz'; then
  echo '$foo is not bar or baz'
fi

if [ "string" != "other string" ]; then
  echo 'same as if test "string" != "other string"; then'
fi

# this does work
if [ -n "$(grep -F 'ERROR' /var/log/auth.log)" ]; then
  echo 'there were errors'
fi

# but this is better
if grep -Fq 'ERROR' /var/log/auth.log; then
   echo 'there were errors'
fi

# this also works
if [ -n "$(diff until.sh while.sh)" ]; then
  echo 'files differ'
fi

# but this is better
if ! diff until.sh while.sh >/dev/null; then
  echo 'files differ'
fi

var="" # an empty string

if [ -z $var ]; then
  echo 'string is empty'
fi

if [ -z "$var" ]; then
  echo 'string is empty'
fi

if [ -z ]; then
  echo 'is the string "]" empty? No.'
fi

var='!'

if [ "$var" = "foo" ]; then
  echo 'var='!' "$var" = "foo"'
fi

if [ ! = "foo" ]; then
  # equivalent to: test ! = "foo"
  # => error: invalid usage
  echo dd
fi

var='!'

if [ x"$var" = x"foo" ]; then
  echo 'The prefix will prevent “x!” from being interpreted as an option.'
fi

for x in "~/*"; do
  # This loop will run once with $x set to "~/*" rather than once
  # for every file and directory under $HOME, as was intended
  echo $x
done

for x in ~/*; do
  # Correct
echo $x
done




case "$var" in
  'this|that')
    # This will only hit if $var is exactly "this|that"
    echo '"this|that"'
    ;;

  '*')
    # This will only hit if $var is exactly "*"
    echo '"*"'
    ;;
esac

# Correct
case "$var" in
  this|that) ;;
  *) ;;
esac

foo='foobarbaz'

if [[ "$foo" == '*bar*' ]]; then
  # True if $foo is exactly "*bar*"
  echo '"*bar*"'
fi

if [[ "$foo" == *bar* ]]; then
  # Correct
  echo 'correct glob'
fi

if [[ "$foo" =~ '^foo' ]]; then
  # True if $foo is exactly "^foo", but leading or trailing
  # whitespace may be ignored such that this is also true if $foo is
  # (for example) "  ^foo  "
  echo '$foo is exactly "^foo" .leading or trailing whitespace may be ignored'
fi

if [[ "$foo" =~ ^foo ]]; then
  # Correct
  echo 'correct regex '
fi

pattern='^Home sweet'

if [[ 'Home sweet home' =~ $pattern ]]; then
  echo $"found $pattern in Home sweet home"
fi

myfiles=~/*
i=0
for file in $myfiles; do
  i=$((i + 1))
done
echo "$myfiles found $i items"

if [[ 'foobarbaz' =~ ^foo(.*)baz$ ]]; then
  echo ${BASH_REMATCH[1]}
  # => "bar"
fi

i=1

# old, don't use!
i=$(expr $i+1)
echo $i

# better, POSIX
i=$((i+1))
echo $i

# valid in shells like bash and ksh93
((i++))
echo $i

# alternate syntax
let i++
echo $i

x=42
y=43
if ((x == 42)); then
 echo 'x == 42'
fi

if ((x < y)); then
  echo 'x < y'
fi