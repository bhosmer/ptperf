PT_REV=$(pushd ../pytorch > /dev/null; git rev-parse HEAD; popd > /dev/null)

if [ ! -d $PT_REV ]
then
  mkdir $PT_REV
  echo "added results dir $PT_REV"
fi

echo "pointwise functional"
echo "$(which python) pointwise.py fun" > ./runner.sh
chmod +x ./runner.sh
perf record -g ./runner.sh
mv perf.data $PT_REV/fun.data
perf script -i $PT_REV/fun.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/fun.perf-folded
../FlameGraph/flamegraph.pl $PT_REV/fun.perf-folded > $PT_REV/fun.svg

echo "pointwise inplace"
echo "$(which python) pointwise.py in" > ./runner.sh
chmod +x ./runner.sh
perf record -g ./runner.sh
mv perf.data $PT_REV/in.data
perf script -i $PT_REV/in.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/in.perf-folded
../FlameGraph/flamegraph.pl $PT_REV/in.perf-folded > $PT_REV/in.svg

echo "pointwise outplace"
echo "$(which python) pointwise.py out" > ./runner.sh
chmod +x ./runner.sh
perf record -g ./runner.sh
mv perf.data $PT_REV/out.data
perf script -i $PT_REV/out.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/out.perf-folded
../FlameGraph/flamegraph.pl $PT_REV/out.perf-folded > $PT_REV/out.svg

echo "pointwise empty"
echo "$(which python) empty.py" > ./runner.sh
chmod +x ./runner.sh
perf record -g ./runner.sh
mv perf.data $PT_REV/empty.data
perf script -i $PT_REV/empty.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/empty.perf-folded
../FlameGraph/flamegraph.pl $PT_REV/empty.perf-folded > $PT_REV/empty.svg

echo "pointwise contig"
echo "$(which python) contig.py" > ./runner.sh
chmod +x ./runner.sh
perf record -g ./runner.sh
mv perf.data $PT_REV/contig.data
perf script -i $PT_REV/contig.data | ../FlameGraph/stackcollapse-perf.pl > $PT_REV/contig.perf-folded
../FlameGraph/flamegraph.pl $PT_REV/contig.perf-folded > $PT_REV/contig.svg

rm ./runner.sh
