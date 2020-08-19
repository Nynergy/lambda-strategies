-- Haskell TUI for displaying text taken from/inspired by 'Oblique Strategies'
module Main where

import Brick
import Brick.Widgets.Center
import Brick.Widgets.Border
import Brick.Widgets.Border.Style

import System.Environment
import System.Random

ui :: String -> Widget ()
ui s = withBorderStyle unicode $ border $ center (str s)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "USAGE: strategies [FILEPATH]"
    _  -> do
      content <- readFile $ head args
      let strategies = lines content
      idx <- randomRIO (0, length strategies)
      let strategy = strategies !! idx
      simpleMain (ui strategy)
