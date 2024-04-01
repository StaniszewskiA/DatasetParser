defmodule DatasetParser do
  Mix.install([
    {:jason, "~> 1.4"},
    {:poison, "~> 5.0"},
    {:elixir_xml_to_map, "~> 2.0"},
    {:sweet_xml, "~> 0.7.4"}
  ])
  @derive [Poison.Encoder]
  @derive SweetXml

  def read_file(filepath)do
    case File.read(filepath) do
      {:ok, file_content} ->
        case SweetXml.parse(file_content) do
          {:ok, xml} ->
            json = Poison.encode!(xml)
            IO.puts(filepath)
          {:error, _reason} -> IO.puts("Unable to parse file content")
        end
      {:error, reason} -> IO.puts(reason)
    end
  end
end

filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\Diorisis\\Achilles Tatius (0532) - Leucippe and Clitophon (001).xml"

DatasetParser.read_file(filepath)
