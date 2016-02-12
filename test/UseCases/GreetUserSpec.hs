module UseCases.GreetUserSpec(spec) where

import Test.Hspec

import Fakes.InputOutput
import Fakes.Domain.Reader.InputOutputStateReader
import Fakes.Domain.Writer.InputOutputStateWriter

import UseCases.GreetUser

-- Fakes

fakeGreeter :: Greeter
fakeGreeter "Bad Input" = Nothing
fakeGreeter "Good Input" = Just "Hi"

-- Specs

spec :: Spec
spec = do
    describe "the user greeter" $ do

        it "it returns a greeting if given a non-blank name" $ do
            greetUser "Young Thugger" `shouldBe` Just "Hello Young Thugger"

        it "returns nothing if given a blank name" $ do
                    greetUser "" `shouldBe` Nothing

    describe "the greet loop" $ do

        it "calls the writer when a greeting is returned" $ do
            getOutput
                InputOutput { input  = [ "Bad Input"
                                       , "Bad Input"
                                       , "Good Input"
                                       , "Bad Input"
                                       ]
                            , output = []
                            }
                (UseCases.GreetUser.start fakeGreeter)

            `shouldBe`

            [ "Enter your name:"
            , "Enter your name:"
            , "Enter your name:"
            , "Hi"]

        it "gets input until a greeting is returned" $ do
            getRemainingInput
                InputOutput { input  = [ "Bad Input"
                                       , "Bad Input"
                                       , "Good Input"
                                       , "Bad Input"
                                       ]
                            , output = []
                            }
                (UseCases.GreetUser.start fakeGreeter)

            `shouldBe` ["Bad Input"]
