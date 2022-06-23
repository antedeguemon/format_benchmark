Mix.install([:benchee])
Code.compile_file("lib/mix/tasks/faster_format.exs")

content = File.read!("./elixir/lib/elixir/lib/enum.ex")

Benchee.run(
  %{
  "Default formatter from stdin" => fn ->
    ExUnit.CaptureIO.capture_io(content, fn ->
      Mix.Task.run("format", ["-"])
      Mix.Task.clear()
    end)
  end,
  "Faster formatter from stdin" => fn ->
    ExUnit.CaptureIO.capture_io(content, fn ->
      Mix.Task.run("faster_format", ["-"])
      Mix.Task.clear()
    end)
  end,
  },
  time: 30)
