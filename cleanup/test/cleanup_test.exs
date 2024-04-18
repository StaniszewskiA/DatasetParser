defmodule CleanupTest do
  use ExUnit.Case
  doctest Cleanup

  test "greets the world" do
    assert Cleanup.hello() == :world
  end

  test "replaces vulgar characters with Greek counterparts" do
    input "i/t se/ems to/ be/ w/o/rki/ng a/s e/xpec/te/d"
    expected_output = "ἰt sἐems tό bἐ ὠόrkἰng άs ἐxpec/tἐd"

    assert Grekifier.devulgarize(input) == expected_output
  end
end
