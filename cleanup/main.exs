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

defmodule TokenExtractor do
  def extract_tokens_from_json(json) do
    case Jason.decode(json) do
      {:ok, parsed_data} ->
        all_tokens = extract_tokens(parsed_data)
        print_tokens(all_tokens)
        save_tokens_to_txt(all_tokens)
      {:error, _} -> IO.puts("Error: Unable to extract the tokens")
    end
  end
  defp extract_tokens(parsed_data) do
    tokens = for sentence <- parsed_data["sentences"] || [], token <- sentence["tokens"] || [] do
      token
    end
    tokens
  end
  defp save_tokens_to_txt(tokens) do
    File.write("tokens.txt", Enum.join(format_tokens(tokens), "\n"))
  end
  defp format_tokens(tokens) do
    Enum.map(tokens, fn(token) ->
      "Token: #{token["form"]}, Lemma: #{token["lemma"]["entry"]}"
    end)
  end
  defp print_tokens(tokens) do
    Enum.each(tokens, fn(token) ->
      IO.puts("Token: #{token["form"]}, Lemma: #{token["lemma"]["entry"]}")
    end)
  end
end

Mix.install([:jason])
folder_path = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51"

DatasetParser.choose_json(folder_path, 1)
|> TokenExtractor.extract_tokens_from_json()
