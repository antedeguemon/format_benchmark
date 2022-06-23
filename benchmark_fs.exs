Mix.install([:benchee])
Code.compile_file("lib/mix/tasks/faster_format.exs")

Benchee.run(
  %{
    "Default formatter" => fn path ->
      Mix.Task.run("format", [path])
      Mix.Task.clear()
    end,
    "Faster formatter" => fn path ->
      Mix.Task.run("faster_format", [path])
      Mix.Task.clear()
    end
  },
  inputs: %{
    "single file" => "./elixir/lib/elixir/lib/enum.ex",
    "multiple files" => "./elixir/lib/mix/{lib,unicode,test}/**/*.{ex,exs}"
  },
  time: 30
)
