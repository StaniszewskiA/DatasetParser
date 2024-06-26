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
  end
  def parse_json!(json) do
    Jason.decode!(json)
  end
end

folder_path = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51"

IO.puts DatasetParser.parse_json!(~s(  {  "foo"  :  "bar"  ,  "baz"  :  "quux"  }  ))
