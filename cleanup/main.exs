defmodule DatasetParser do
  def read_json(filepath) do
    case File.read(filepath) do
      {:ok, content} -> {:ok, content}
      {:error, reason} -> {:error, reason}
    end
  end

  def print_json({:ok, content}) do
    IO.puts("JSON content: #{content}")
  end

  def print_json({:error, reason}) do
    IO.puts("Error reading file: #{reason}")
  end
end

filepath = "E:\\Users\\PanSt\\OneDrive\\Pulpit\\Diorisis\\Diorisis\\Achilles Tatius (0532) - Leucippe and Clitophon (001).xml"

DatasetParser.read_json(filepath)
|> DatasetParser.print_json()
