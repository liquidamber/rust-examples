{- |
Module      : Main
Description : parallel fibonacci benchmark.
Copyright   : (c) liquid_amber, 2014
License     : MIT
Maintainer  : liquid.amber.ja@gmaill.com
Stability   : experimental
Portability : portable

This example runs fibonacci in parallel.
-}

import Control.Concurrent.Async

-- | Calculate fibonacci n in parallel.
fib :: Int -> IO Int
fib n | n < 2 = return n
fib n = do
  (r1, r2) <- (n -1 `seq` fib (n - 1)) `concurrently` (n - 2 `seq` fib (n - 2))
  r1 `seq` r2 `seq` return (r1 + r2)

main :: IO ()
main = print =<< fib 40
