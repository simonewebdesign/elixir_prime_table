defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "generates the right output" do
    assert """
    |   | 2 | 3 |
    | 2 | 4 | 6 |
    | 3 | 6 | 9 |
    """ == capture_io(fn -> assert :ok == CLI.main(["2"]) end)
  end

  test "prints synopsis when no arg is provided" do
    stdout = capture_io(fn -> assert :ok == CLI.main([]) end)
    assert "usage: bin/prime-table <NUMBER>\n" == stdout
  end

  test "prints an error when a bad arg is provided" do
    assert "argument error: duh" == CLI.main(["duh"]) |> catch_exit
  end

  test "prints an error when zero is provided" do
    stdout = capture_io(fn -> assert :ok == CLI.main(["0"]) end)
    assert "please provide a number greater than zero\n" == stdout
  end
end
