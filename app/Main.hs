module Main where

import UseCases.GreetUser

main :: IO ()
main = UseCases.GreetUser.start greetUser
