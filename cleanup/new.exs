defmodule DatasetParser do
  def read_json(filepath) do
    IO.puts(filepath)
  end
end

filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\Diorisis\\Achilles Tatius (0532) - Leucippe and Clitophon (001).xml"

DatasetParser.read_json(filepath)
