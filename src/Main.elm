module Main where

import Html exposing (..)

type Fixture = Tub | Shower

type Kitchen
  = Kitchen Fixture Fixture

main : Html
main =
  let
    a = Kitchen Tub Shower
    b = Kitchen Shower Tub
    c = Kitchen Tub Shower
  in
    div
      []
      [ p [] [ text <| "This is true: " ++ (toString <| a == a) ]
      , p [] [ text <| "This is NOT true: " ++ (toString <| a == b) ]
      , p [] [ text <| "This is true: " ++ (toString <| a == c) ]

--    these throw errors as Fixture (is not/cannot be) a comparable
--      , p [] [ text <| "This is ???: " ++ (toString <| Tub < Shower) ]
--      , p [] [ text <| "This is ???: " ++ (toString <| Shower > Tub) ]
--      , p [] [ text <| "This is ???: " ++ (toString <| Tub > Shower) ]

      ]
