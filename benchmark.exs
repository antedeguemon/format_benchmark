Mix.install([:benchee])
Code.compile_file("lib/mix/tasks/faster_format.exs")

format_path = "./elixir/lib/mix/{lib,unicode,test}/**/*.{ex,exs}"

Benchee.run(%{
  "Default formatter" => fn ->
    Mix.Task.run("format", [format_path])
    Mix.Task.clear()
  end,
  "Faster formatter" => fn ->
    Mix.Task.run("faster_format", [format_path])
    Mix.Task.clear()
  end,
}, time: 30); nil