{-# LANGUAGE FlexibleInstances #-}

module Fakes.Domain.Writer.InputOutputStateWriter where

import Control.Monad.State (State, get, put)
import Fakes.InputOutput
import Domain.Writer

instance Writer (State InputOutput) where
    write string = do
        io@InputOutput { output = o } <- get
        put $ io `withOutput` (o ++ [string])

        return ()
