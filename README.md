# Format Benchmark

This is an experiment for speeding up the Elixir formatter.

## Running the benchmark script

```shell
# Makes sure current version of Elixir is from `main` elixir-lang branch
asdf local elixir system
cd elixir && make clean_elixir compile && cd ..

# Runs benchmark against Mix source code
./elixir/bin/elixir benchmark.exs "./elixir/lib/mix/{lib,unicode,test}/**/*.{ex,exs}"

# Runs benchmark again Enum module
./elixir/bin/elixir benchmark.exs "./elixir/lib/elixir/lib/enum.ex"
```

## Results

### Formatting Mix source code (192 files)

```
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

Benchmarking Default formatter ...
Benchmarking Faster formatter ...

Name                        ips        average  deviation         median         99th %
Faster formatter           8.37      119.45 ms    ±10.34%      117.16 ms      183.86 ms
Default formatter          4.36      229.22 ms    ±11.92%      221.35 ms      308.27 ms

Comparison: 
Faster formatter           8.37
Default formatter          4.36 - 1.92x slower +109.77 ms
```

## Formatting `Enum` module (single file)

```
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

Benchmarking Default formatter ...
Benchmarking Faster formatter ...

Name                        ips        average  deviation         median         99th %
Faster formatter          16.80       59.52 ms    ±15.03%       57.54 ms       89.39 ms
Default formatter          8.02      124.69 ms    ±37.09%      116.89 ms      468.85 ms

Comparison:
Faster formatter          16.80
Default formatter          8.02 - 2.09x slower +65.17 ms
```
