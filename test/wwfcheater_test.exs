defmodule WwfcheaterTest do
  use ExUnit.Case
  doctest Wwfcheater

  test "pick" do
    assert Wwfcheater.pick('','') ==''
    assert Wwfcheater.pick('abc','')==''
    assert Wwfcheater.pick('abc', 'd') == ''
    assert Wwfcheater.pick('abc','b') == 'b'
    assert Wwfcheater.pick('abc','ab') == 'ab'
    assert Wwfcheater.pick('abcssss','abc') == 'abc'
    assert Wwfcheater.pick('acssssb','abc') == 'abc'
    assert Wwfcheater.pick('abc','acssssb') == 'acb'
    assert Wwfcheater.pick('muebjl','jumble') == 'jumble'
    refute Wwfcheater.pick('muebjl','mumble') == 'mumble'

  end

  test "match" do
    assert Wwfcheater.match('','') == true
    assert Wwfcheater.match('abc','')== true
    assert Wwfcheater.match('abcssss','abc') == true
    assert Wwfcheater.match('muebjl','mumble') == false
    assert Wwfcheater.match('', 'abc')== false
  end

  test "find" do
    words = Wwfcheater.make_dict("words.txt")
    matches = Wwfcheater.find('ujmebl', words)
    assert Enum.member? matches, 'jumble'
    refute Enum.member? matches, 'mumble'
    refute Enum.member? matches, 'bell'
  end

  test "Jumble" do
    assert 'jumble' == 'jumble'
    refute 'jumble' == "jumble"
    assert 'jumble'== "jumble"|> to_char_list
    assert 'jumble' |> Enum.sort =='bejlmu'
  end


end
