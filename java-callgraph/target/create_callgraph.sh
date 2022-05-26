
FILES="$PWD/$1/*"
echo "source target" > cgraph.txt

for f in $FILES
do
  echo "Processing $f file..."
  java -jar javacg-0.1-SNAPSHOT-static.jar $f >> cgraph.txt
  # take action on each file. $f store current file name
done
