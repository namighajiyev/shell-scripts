i=1
for file in /etc/[abcd]*.conf
do
 echo "File $((i++)) : $file"
done