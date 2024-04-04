defmodule DatasetParser do
  def traverse_directory(folder_path) do
    folder_path
    |> Path.expand()
    |> File.ls!()
    |> Enum.each(&IO.puts(&1))
  end
end

folder_path = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51"

DatasetParser.traverse_directory(folder_path)
