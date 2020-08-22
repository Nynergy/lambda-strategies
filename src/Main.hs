-- Haskell TUI for displaying text taken from/inspired by 'Oblique Strategies'
module Main where

import Brick
import Brick.Widgets.Center
import Brick.Widgets.Border
import Brick.Widgets.Border.Style

import System.Directory
import System.Environment
import System.Random

-- Construct a brick Widget with a given String
ui :: String -> Widget ()
ui s = withBorderStyle unicode $ border $ center (str s)

-- Attempt to get a FilePath from the command line
getFilePath :: IO (Maybe FilePath)
getFilePath = do
  args <- getArgs
  if (args == [])
    then do
      reportError $ "USAGE: strategies [FILEPATH]"
      return (Nothing)
    else return (Just $ head args)

-- Attempt to read strategies from file
getStrategies :: FilePath -> IO (Maybe [String])
getStrategies path = do
  fileExists <- doesFileExist path
  if fileExists
    then do
      content <- readFile path
      return (Just $ lines content)
    else do
      reportError $ "File " ++ (show path) ++ " does not exist!"
      return (Nothing)

-- Grab a random strategy from the list of strategies
getStrategy :: [String] -> IO (String)
getStrategy strats = do
  idx <- randomRIO (0, length strats)
  return (strats !! idx)

-- Show the brick Widget with custom String
showStrategy :: String -> IO ()
showStrategy strat = simpleMain $ ui strat

-- Report an error to the console
-- NOTE: This is really just syntactic sugar
reportError :: String -> IO ()
reportError = putStrLn

main :: IO ()
main = do
  filepath <- getFilePath
  case filepath of
    Nothing   -> return ()
    Just path -> do
      strategies <- getStrategies path
      case strategies of
        Nothing     -> return ()
        Just strats -> do
          strategy <- getStrategy strats
          showStrategy strategy
