defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  # Note that the cards may be shuffled and end up in the same
  # order, so this test isn't the best.
  test "shuffling a deck randomises it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)

    # assert ..... != ..... can be written as:
    #  refute ..... == .....
    # refute deck == Cards.shuffle(deck)
  end


end
