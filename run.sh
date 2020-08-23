PT_REV=$(git --git-dir=../pytorch/.git rev-parse HEAD)
echo "PT rev $PT_REV"

if [ ! -d $PT_REV ]
then
  mkdir $PT_REV
  git --git-dir=../pytorch/.git show -s > $PT_REV/README.md
  echo "added results dir $PT_REV"
fi

echo -e "\n---" >> $PT_REV/README.md

run_test() {
  echo $NAME
  echo "$(which python) $COMMAND" > ./runner.sh
  chmod +x ./runner.sh
  echo -e "\n$NAME" >> $PT_REV/README.md
  perf record -g ./runner.sh >> $PT_REV/README.md
  mv perf.data $PT_REV/$NAME.data
  perf script -i $PT_REV/$NAME.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/$NAME.perf-folded
  ../FlameGraph/flamegraph.pl $PT_REV/$NAME.perf-folded > $PT_REV/$NAME.svg
}

NAME="pointwise_functional"
COMMAND="pointwise.py fun"
run_test

NAME="pointwise_inplace"
COMMAND="pointwise.py in"
run_test

NAME="pointwise_outplace"
COMMAND="pointwise.py out"
run_test

NAME="empty"
COMMAND="empty.py"
run_test

NAME="contig"
COMMAND="contig.py"
run_test

rm ./runner.sh
