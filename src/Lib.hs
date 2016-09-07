{-# LANGUAGE OverloadedStrings #-}

module Lib(run) where

import Web.Scotty
import Data.Monoid (mconcat)

run :: IO ()
run = scotty 31000 $ get "/" $ html "Hello World!"
