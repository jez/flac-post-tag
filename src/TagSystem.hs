{-# LANGUAGE NamedFieldPuns #-}

module TagSystem where

data TagSystem = TagSystem { d :: Int
                           , w0 :: BinaryString
                           , w1 :: BinaryString
                           }

type BinaryString = [Bool]

showBinaryString = map (\x -> if x then '1' else '0')

fromChar :: Char -> Bool
fromChar '0' = False
fromChar '1' = True
fromChar _ = error "Not a binary string!"

fromString :: String -> BinaryString
fromString = map fromChar

getTail :: TagSystem -> Bool -> BinaryString
getTail TagSystem {d, w0, w1} c =
  if c then w1 else w0

delete :: TagSystem -> BinaryString -> BinaryString
delete TagSystem {d, w0, w1} = drop d

smallStep :: TagSystem -> BinaryString -> BinaryString
smallStep _ [] = []
smallStep t (c:cs) = delete t $ (c:cs) ++ getTail t c

evens :: [a] -> [a]
evens [] = []
evens [x] = [x]
evens (x0:x1:xs) = x0 : evens xs

bigStep :: TagSystem -> BinaryString -> BinaryString
bigStep _ [] = []
bigStep t word =
  if length word `mod` 2 == 0 then result else drop 1 result
  where result = concatMap (getTail t) . evens $ word
