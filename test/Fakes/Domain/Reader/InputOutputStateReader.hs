{-# LANGUAGE FlexibleInstances #-}

module Fakes.Domain.Reader.InputOutputStateReader where

import Control.Monad.State (State, get, put)
import Fakes.InputOutput
import Domain.Reader

instance Reader (State InputOutput) where
    read = do
        io@InputOutput { input = x:xs } <- get
        put $ io `withInput` xs

        return x
