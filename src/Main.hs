-- Haskell TUI for displaying text taken from/inspired by 'Oblique Strategies'
module Main where

import Brick
import Brick.Widgets.Center
import Brick.Widgets.Border
import Brick.Widgets.Border.Style

import System.Directory
import System.Environment
import System.Exit
import System.Random

-- Construct a brick Widget with a given String
ui :: String -> Widget ()
ui s = withBorderStyle unicode $ border $ center (str s)

-- Attempt to get a FilePath from the command line
getFilePath :: IO FilePath
getFilePath = do
  args <- getArgs
  if (args == [])
    then reportError $ "USAGE: strategies [FILEPATH]"
    else return (head args)

-- Attempt to read strategies from file
getStrategies :: FilePath -> IO [String]
getStrategies path = do
  fileExists <- doesFileExist path
  if fileExists
    then do
      content <- readFile path
      return (lines content)
    else reportError $ "File " ++ (show path) ++ " does not exist!"

-- Attempt to grab a random strategy from the list
getStrategy :: [String] -> IO String
getStrategy strats = do
  if (length strats <= 0)
    then reportError $ "Provided file is empty!"
    else do
      idx <- randomRIO (0, length strats)
      return (strats !! idx)

-- Show the brick Widget with custom String
showStrategy :: String -> IO ()
showStrategy strat = simpleMain $ ui strat

-- Report an error to the console and exit
-- NOTE: This is really just syntactic sugar
reportError :: String -> IO a
reportError = die

main :: IO ()
main = do
  path <- getFilePath
  strats <- getStrategies path
  strategy <- getStrategy strats
  showStrategy strategy
