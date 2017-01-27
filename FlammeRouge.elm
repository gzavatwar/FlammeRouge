import Html exposing (beginnerProgram,div,span,text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

type CardEvent = PickCard


view model = 
  let (deck,played) = model
      topOfDeck = List.head deck
      cardName = case topOfDeck of
        Just name -> name
        Nothing -> "No card"
      deckStyle = style [("width", "200px"),("height", "300px"),("border", "1px solid black")]
  in
    div [] [
      div [deckStyle, onClick PickCard] [text cardName],
      div [deckStyle] [text "No card"]
     ]

update msg model =
  let (deck,played) = model
      newDeck = case List.tail deck of
        Just remainingDeck -> remainingDeck
        Nothing -> []
  in (newDeck, played)

startingDeck = (["2","3","4","5","6","7"],[])

main = beginnerProgram
  {
  model=startingDeck,
  view=view,
  update=update
  }

