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

import GHC.Exts

{-
fib :: Int -> Int
fib n | n < 2 = n
fib n = fib (n - 1) + fib (n - 2)
-}

-- | Calculate fibonacci n.
-- | n must positive integer!!
fib :: Word# -> Word#
fib 0## = 0##
fib 1## = 1##
fib n = fib (n `minusWord#` 1##) `plusWord#` fib (n `minusWord#` 2##)

{-
fib :: Int# -> Int#
fib 0# = 0#
fib 1# = 1#
fib n = fib (n -# 1#) +# fib (n -# 2#)
-}

main :: IO ()
-- main = print $ I# (fib 40#)
main = print $ W# (fib 40##)
-- main = print $ fib 40
