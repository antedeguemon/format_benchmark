# Format Benchmark

This is an experiment for speeding up the Elixir formatter.

## Running the benchmark script

```shell
# Makes sure current version of Elixir is from `main` elixir-lang branch
asdf local elixir system
cd elixir && make clean_elixir compile && cd ..

# Runs benchmark formatting from file system
./elixir/bin/elixir benchmark_fs.exs

# Runs benchmark formatting from stdin
./elixir/bin/elixir benchmark_stdin.exs
```

## Results

### From file system

```
$ ./elixir/bin/elixir benchmark_fs.exs

Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.14.0-dev
Erlang 24.3.3

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 30 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: multiple files (192), single file
Estimated total run time: 2.13 min

Benchmarking Default formatter with input multiple files (192) ...
Benchmarking Default formatter with input single file ...
Benchmarking Faster formatter with input multiple files (192) ...
Benchmarking Faster formatter with input single file ...

##### With input multiple files (192) #####
Name                        ips        average  deviation         median         99th %
Faster formatter           7.46      134.13 ms    ±37.79%      123.47 ms      351.11 ms
Default formatter          3.88      257.47 ms    ±48.68%      232.31 ms     1252.00 ms

Comparison: 
Faster formatter           7.46
Default formatter          3.88 - 1.92x slower +123.34 ms

##### With input single file #####
Name                        ips        average  deviation         median         99th %
Faster formatter          15.30       65.37 ms    ±15.64%       62.37 ms       95.63 ms
Default formatter          8.16      122.49 ms    ±32.11%      116.00 ms      355.19 ms

Comparison: 
Faster formatter          15.30
Default formatter          8.16 - 1.87x slower +57.12 ms

```

### From stdin

```
$ ./elixir/bin/elixir benchmark_stdin.exs

Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.14.0-dev
Erlang 24.3.3

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 30 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 1.07 min

Benchmarking Default formatter from stdin ...
Benchmarking Faster formatter from stdin ...

Name                                   ips        average  deviation         median         99th %
Faster formatter from stdin          13.21       75.67 ms    ±17.97%       72.01 ms      134.35 ms
Default formatter from stdin          6.98      143.32 ms    ±17.83%      135.90 ms      226.81 ms

Comparison:
Faster formatter from stdin          13.21
Default formatter from stdin          6.98 - 1.89x slower +67.65 ms

```
