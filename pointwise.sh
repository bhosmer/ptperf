echo "$(which python) pointwise.py fun" > ./run.sh
perf record -g ./run.sh
mv perf.data results/fun.data
perf script -i results/fun.data | ../FlameGraph/stackcollapse-perf.pl > results/fun.perf-folded
../FlameGraph/flamegraph.pl results/fun.perf-folded > results/fun.svg

echo "$(which python) pointwise.py in" > ./run.sh
perf record -g ./run.sh
mv perf.data results/in.data
perf script -i results/in.data | ../FlameGraph/stackcollapse-perf.pl > results/in.perf-folded
../FlameGraph/flamegraph.pl results/in.perf-folded > results/in.svg

echo "$(which python) pointwise.py out" > ./run.sh
perf record -g ./run.sh
mv perf.data results/out.data
perf script -i results/out.data | ../FlameGraph/stackcollapse-perf.pl > results/out.perf-folded
../FlameGraph/flamegraph.pl results/out.perf-folded > results/out.svg
