defmodule Wwfcheater do
  def pick(tiles, word), do: pick(tiles, word, '')
  def pick(tiles, word, acc) when tiles=='' or word =='', do: acc
  def pick(tiles, [char|chars], acc) do
    cond do
      Enum.member?(tiles,char) ->
        pick(tiles -- [char], chars, acc ++ [char])
      true ->
        pick(tiles, chars, acc)
    end
  end

  def match(tiles, word), do: word == pick(tiles, word)

  def make_dict(file) do
    {:ok, dict} = File.read(file)
    dict|> String.split("\n") |>
    Enum.map fn word ->
      to_char_list word
    end
  end

  def find(tiles, words), do: Enum.filter(words, fn word ->match tiles, word end)





end
