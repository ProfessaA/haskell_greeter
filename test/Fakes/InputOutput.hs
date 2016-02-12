module Fakes.InputOutput where

import Control.Monad.State

data InputOutput = InputOutput { input  :: [String]
                               , output :: [String]
                               }

withInput :: InputOutput -> [String] -> InputOutput
s `withInput` i = InputOutput { input = i, output = (output s) }

withOutput :: InputOutput -> [String] -> InputOutput
s `withOutput` o = InputOutput { input = (input s), output = o }

getOutput :: InputOutput -> State InputOutput a -> [String]
getOutput fakeState s = output . snd $ runState s fakeState

getRemainingInput :: InputOutput -> State InputOutput a -> [String]
getRemainingInput fakeState s = input . snd $ runState s fakeState
