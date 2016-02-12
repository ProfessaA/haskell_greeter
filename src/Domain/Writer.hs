module Domain.Writer
    ( Writer(write)
    )
where

class (Monad m) => Writer m where
    write :: String -> m ()

instance Writer IO where
    write = putStrLn
