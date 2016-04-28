module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

data Fixture = Tub | Shower
derive instance eqFixture :: Eq Fixture
derive instance ordFixture :: Ord Fixture

data Kitchen
  = Kitchen Fixture Fixture
instance eqKitchen :: Eq Kitchen where
  eq (Kitchen a b) (Kitchen c d)
    = (a == c && b == d)
   || (a == d && b == c)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  let a = Kitchen Tub Shower
  let b = Kitchen Shower Tub
  let c = Kitchen Tub Shower

  log $ "this is true:  " ++ (show $ a == a)
  log $ "this is true:  " ++ (show $ a == b)
  log $ "this is true:  " ++ (show $ a == c)

  log $ "this is true:  " ++ (show $ Tub < Shower)
  log $ "this is true:  " ++ (show $ Shower > Tub)
  log $ "this is false: " ++ (show $ Tub > Shower)
