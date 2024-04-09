defmodule Main do
  import DatasetParser
  import TokenExtractor

  folder_path = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\DiorisisCorpus1.51"

  DatasetParser.choose_json(folder_path, 1)
  |> TokenExtractor.extract_tokens_from_json()
end

Mix.install([:jason])
