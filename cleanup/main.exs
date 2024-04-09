defmodule DatasetParser do
  def count_jsons(folder_path) do
    folder_path
    |> Path.expand()
    |> File.ls!()
    |> Enum.filter(&Path.extname(&1) == ".json")
    |> length()
    |> IO.puts()
  end
  def list_jsons(folder_path) do
    folder_path
    |> Path.expand()
    |> File.ls!()
    |> Enum.each(&IO.puts(&1))
  end
  def choose_json(folder_path, index) do
    folder_path
    |> Path.expand()
    |> File.ls!()
    |> Enum.filter(&Path.extname(&1) == ".json")
    |> Enum.at(index - 1)
    |> case do
      nil -> IO.puts("No JSON found")
      file -> read_json_file(file)
    end
  end
  defp read_json_file(file) do
    IO.puts(file)
  end
end

Mix.install([:jason])
folder_path = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51"

DatasetParser.choose_json(folder_path, 1)
