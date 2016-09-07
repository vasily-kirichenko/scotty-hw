module Main where

import Lib

main :: IO ()
main =
  putStrLn "Hello" >> putStrLn " World" >> run
