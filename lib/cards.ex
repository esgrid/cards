defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  # @doc """
  # Hello world.

  # ## Examples

  #     iex> Cards.hello()
  #     :world

  # """
  # def hello do
  #   :world
  # end

  @doc """
    Returns a list of strings representing a deck of cards. For example: ["Ace", "Two", "Three", "Four", "Five"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Note that this "for loop" **returns a list**, it is in fact called a list comprehension
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)

    # List comprehensions have this kind of product of all elements with all elements
    # It performs a kind of cartesian product of suits and values
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_sieze` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(cards, hand_size) do
    # .split returns a tuple {with curly braces}
    Enum.split(cards, hand_size)
  end

  @doc """
    Shuffle the deck list using Enum library
    and shuffle method.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # @doc """
  #  first load function
  #   Remember: :something (with the ":" colon) means an atom
  #   Atoms are like strings but they normally give a status, internal
  #   for programmers, not for the user to see (for that we would use strings.)
  # """
  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   case status do
  #     :ok -> :erlang.binary_to_term binary
  #     :error -> "That file does not exist."
  #   end
  # end

  @doc """
    Second load function with pattern matching
    It is very much like destructuring in JS but here
    you also compare, not just destructure.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _} -> "That file does not exist"
    end
  end

  @doc """
    Introduction of the pipe |> operator: we need **consistent first arguments**
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
