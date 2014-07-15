{-# LANGUAGE MagicHash #-}

import GHC.Prim
import GHC.Exts

{-
fib :: Int -> Int
fib n | n < 2 = n
fib n = fib (n - 1) + fib (n - 2)
-}

fib :: Int# -> Int#
fib n | n <# 2# = n
fib n = fib (n -# 1#) +# fib (n -# 2#)

main :: IO ()
main = print $ I# (fib 40#)
-- main = print $ fib 40
