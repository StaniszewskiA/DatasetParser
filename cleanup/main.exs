defmodule DatasetParser do
  Mix.install([
    {:jason, "~> 1.4"},
    {:poison, "~> 5.0"},
    {:elixir_xml_to_map, "~> 2.0"}
  ])

  def read_xml(filepath) do
    case File.read(filepath) do
      {:ok, content} -> {:ok, content}
      {:error, reason} -> {:error, reason}
    end
  end

  def xml_to_json({:ok, content}) do
    case XmlToMap.naive_map(content) do
      {:ok, xml_map} -> {:ok, Jason.encode!(xml_map)}
      {:error, reason} -> {:error, reason}
    end

  end

  def xml_to_json({:error, reason}) do
    {:error, reason}
  end

  def save_json(filepath, json_content) do
    case File.write(filepath, json_content) do
      :ok -> {:ok, "JSON content saved to #{filepath}"}
      {:error, reason} -> {:error, reason}
    end
  end

  def print_xml({:ok, content}) do
    IO.puts(content)
  end

  def print_xml({:error, reason}) do
    Io.puts("Error while reading XML file: #{reason}")
  end
end

filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\Diorisis\\Achilles Tatius (0532) - Leucippe and Clitophon (001).xml"
output_filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Eliksir\\cleanup\\filedump"

case DatasetParser.read_xml(filepath) do
  {:ok, xml_content} ->
    case DatasetParser.xml_to_json({:ok, xml_content}) do
      {:ok, json_content} ->
        case DatasetParser.save_json(output_filepath, json_content) do
          {:ok, _} -> IO.puts("JSON content saved.")
          {:error, reason} -> IO.puts("Failes to save content")
        end
        {:error, reason} -> IO.puts("Failed to convert XML to JSON")
    end
    {:error, reason} -> IO.puts("Failed to read XML file")
end
