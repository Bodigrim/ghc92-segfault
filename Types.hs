module Types where

import qualified Data.Vector as V

data Value = Unit Double | Number Int
  deriving (Show)

mkArray :: [Value] -> Value
mkArray = mkVector . V.fromList

mkVector :: V.Vector Value -> Value
mkVector vs = case traverse extractNumber vs of
  Nothing -> Unit 43.5
  Just{}  -> Number 42

extractNumber :: Value -> Maybe Int
extractNumber (Number i) = Just i
extractNumber _ = Nothing
