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
      file -> read_json_file(folder_path, file)
    end
  end
  defp read_json_file(folder_path, file) do
    full_path = Path.join(folder_path, file)
    case File.read(full_path) do
      {:ok, contents} -> contents
      {:error, reason} -> IO.puts("Dupa")
    end
  end
end
