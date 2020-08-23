# perf on some pt microbenchmarks

Tests pointwise add, empty, contig.

Tests and runner are in the root. 

Runner assumes ../pytorch checked out at the commit you want to test.

Results are written to a subdir named after the commit hash.

Each subdir has 
- README.md with HEAD commit message and (imprecise) timeit numbers for tests
- perf data and flamegraph svg files for each test
