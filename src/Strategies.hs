module Strategies where

import System.Directory
import System.Environment
import System.Exit
import System.Random

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

-- Report an error to the console and exit
-- NOTE: This is really just syntactic sugar
reportError :: String -> IO a
reportError = die
