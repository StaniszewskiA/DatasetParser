defmodule Grekifier do
  def count_vowels(string) do
    missprinted_regex = ~r/[aeiouAEIOU](?=[^\s\w])/
    missprinted_vowels = Regex.scan(missprinted_regex, string)
    missprinted_count = Enum.count(missprinted_vowels)
    IO.puts(missprinted_count)
  end
  def devulgarize(string) do
    vulgar_to_greek = %{
      "a/": "ά"
    }
    IO.puts(string)
  end
end

greek_phrase = "Μεταφυσικά"
vulgarized = "Metaphysika/"

Grekifier.count_vowels(vulgarized)
