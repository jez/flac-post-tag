{-# LANGUAGE QuasiQuotes #-}

module Main where

import System.Environment (getArgs)
import Control.Monad
import System.Console.Docopt
import Data.List

import TagSystem

patterns :: Docopt
patterns = [docopt|
  Usage:
    post [options] (small|big) <iterations> <word>

  Options:
    --intersperse  Intersperse <word> with 0's (because only evens will be read)
|]

getArgOrExit = getArgOrExitWith patterns

dumpTrace = mapM_ (putStrLn . showBinaryString)

main :: IO ()
main = do
  let t = TagSystem {d = 2, w0 = fromString "1", w1 = fromString "100"}

  args <- parseArgsOrExit patterns =<< getArgs

  iterations <- args `getArgOrExit` (argument "iterations")
  let n = read iterations :: Int
  word <- args `getArgOrExit` (argument "word")
  let iWord = if args `isPresent` (longOption "intersperse")
              then (intersperse '0' word) ++ "0" else word

  when (args `isPresent` (command "small")) $ do
    dumpTrace . take n . iterate (smallStep t) . fromString $ iWord

  when (args `isPresent` (command "big")) $ do
    dumpTrace . take n . iterate (bigStep t) . fromString $ iWord

