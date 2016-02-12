module Domain.Reader
    ( Reader(read)
    )
where

class (Monad m) => Reader m where
    read :: m String

instance Reader IO where
    read = getLine