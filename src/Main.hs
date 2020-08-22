-- Haskell TUI for displaying text taken from/inspired by 'Oblique Strategies'
module Main where

import Strategies
import TUI

main :: IO ()
main = do
  path <- getFilePath
  strats <- getStrategies path
  strategy <- getStrategy strats
  showStrategy strategy
