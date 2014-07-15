{- |
Module      : Main
Description : sequential fibonacci benchmark.
Copyright   : (c) liquid_amber, 2014
License     : MIT
Maintainer  : liquid.amber.ja@gmaill.com
Stability   : experimental
Portability : non-portable

This example runs fibonacci implemented as unboxed int function.
-}

{-# LANGUAGE MagicHash #-}

import GHC.Prim
import GHC.Exts

{-
fib :: Int -> Int
fib n | n < 2 = n
fib n = fib (n - 1) + fib (n - 2)
-}

-- | Calculate fibonacci n.
fib :: Int# -> Int#
fib n | n <# 2# = n
fib n = fib (n -# 1#) +# fib (n -# 2#)

main :: IO ()
main = print $ I# (fib 40#)
-- main = print $ fib 40
