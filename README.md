# Cards

This is the first of two Elixir apps from Stephen Grider's [The Complete Elixir and Phoenix Bootcamp](https://www.udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/).

When the documentation theme is introduced we are told to add `:ex_doc` to the dependencies. Since the course is a bit outdated (for early 2023), the version I used was the most updated `{:ex_doc, "~> 0.29.1"}`.

The app can create a deck from twenty cards, based on the [cartesian product](https://en.wikipedia.org/wiki/Cartesian_product) between `["Ace", "Two", "Three", "Four", "Five"]` and `["Spades", "Clubs" "Hearts", "Diamonds"]`. In other words, the result is:
```
["Ace of Spades", "Two of Spades", "Three of Spades",
 "Four of Spades", "Five of Spades", "Ace of Clubs",
 "Two of Clubs", "Three of Clubs", "Four of Clubs",
 "Five of Clubs", "Ace of Hearts", "Two of Hearts",
 "Three of Hearts", "Four of Hearts", "Five of Hearts",
 "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds",
 "Four of Diamonds", "Five of Diamonds"]
```

`Cards.create_hand/1` receives an integer `hand_size`, then creates the deck described above, shuffles it, and deals it, returning a tuple with two elements which are lists. The first element is the hand of size `hand_size` and the second is the rest of the deck.

There are methods to load a a deck from a file (`Cards.load/1`, which receives a string of the form `path/to/file/desired_deck`) and save a deck to a file (`Cards.save/2` which receives a `deck` and a string `path/to/file/new_deck_name`).

Something to mention as well is the testing via the case tests and the doctests. You'll find that when generating the beautiful documentation by using `@doc """ """` and `@moduledoc """"""` in the code, one can put examples in the `@doc """ """` and these examples, written in the correct format, are taken as tests since they are run as if one was running `iex`.

To run the project's tests (both case tests and doctests) do `mix test`. To generate the documentation do `mix docs`. The documentation can be seen in `html` in `doc/index.html`.

## Examples
### To run
```
mix deps.get
iex -S mix
```
### To play
```
iex(1)> Cards.create_hand(4)
```
The output should be something like:
```
{["Two of Spades", "Four of Clubs", "Ace of Diamonds", "Three of Diamonds"],
 ["Five of Spades", "Two of Hearts", "Five of Diamonds", "Ace of Spades",
  "Three of Hearts", "Two of Diamonds", "Five of Hearts", "Two of Clubs",
  "Ace of Clubs", "Three of Clubs", "Four of Diamonds", "Ace of Hearts",
  "Four of Hearts", "Four of Spades", "Three of Spades", "Five of Clubs"]}
```
### To save a deck to a file
```
iex(1)> deck = Cards.create_deck
iex(2)> Cards.save(deck, "new_deck")
:ok
```
`Cards.create_deck/0` creates the twenty card deck mentioned at the beginning. This could be changed by modifying the lists in the function but as it is it'll return always the same deck. `Cards.save/2` then receives the deck and creates a file called `new_deck` in the top level directory of the project.


### To load a deck from a file
If we wanted to load `new_deck` created above we would do:
```
iex(1)> Cards.load("new_deck")
```
The output shown would be the twenty card deck.
