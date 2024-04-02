defmodule DatasetParser do
  def read_file(filepath) do
    IO.puts(filepath)
  end
end

# dupa

filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51\\Achilles Tatius (0532) - Leucippe and Clitophon (001).json"

DatasetParser.read_file(filepath)
