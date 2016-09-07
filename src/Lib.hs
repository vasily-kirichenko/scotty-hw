{-# LANGUAGE OverloadedStrings, TemplateHaskell #-}

module Lib(run) where

import Web.Scotty
import qualified Data.Text as T
import Data.Text.Lazy.Encoding (decodeUtf8)
import Data.Aeson hiding (json)
import Data.Aeson.TH
import Network.HTTP.Types

data Person = Person
  { name :: T.Text,
    age :: Int }

deriveJSON defaultOptions ''Person

root = do
  get "/" $ html "Hello World!"

  get "/person/:name/:age" $ do
    name <- param "name"
    age <- param "age"
    json [Person { name = name, age = i } | i <- [1..age]]

  post "/foo" $ do
    b <- body
    case decode b :: Maybe Person of
      Just person -> json person
      Nothing -> status status500

run :: IO ()
run = scotty 31000 root
