module UseCases.GreetUser
    ( greetUser
    , start
    , Greeter
    )
where

import Domain.Reader as R
import Domain.Writer as W

type Greeter = String -> Maybe String

greetUser :: Greeter
greetUser ""   = Nothing
greetUser name = Just $ "Hello " ++ name

start :: (Reader rw, Writer rw) => Greeter -> rw ()
start greeter = do
    W.write "Enter your name:"
    name <- R.read

    case greeter name of
        Just greeting -> W.write greeting
        Nothing       -> start greeter
