module Main where

import Lib
import qualified Data.Map as Map

main :: IO()
main = do
    putStrLn "everything looks good! "

readCandidate :: IO Candidate
readCandidate = do
    putStrLn "enter id:"
    cId <- readInt
    putStrLn "enter code grade:"
    codeGrade <- readGrade
    putStrLn "enter culture fit grade:"
    cultureGrade <- readGrade
    putStrLn "enter education:"
    degree <- readDegree
    return (Candidate { candidateId = cId
    , codeReview = codeGrade
    , cultureFit = cultureGrade
    , education = degree })

assessCandidateIO :: IO String
assessCandidateIO = do
     candidate <- readCandidate
     let passed = viable candidate
     let statement = if passed
                     then "passed"
                     else "failed"
     return statement

assessCandidateMaybe :: Int -> Maybe String
assessCandidateMaybe cId = do
      candidate <- Map.lookup cId candidateDB
      let passed = viable candidate
      let statement = if passed
                      then "passed"
                      else "failed"
      return statement

assessCandidateList :: [Candidate] -> [String]
assessCandidateList candidates = do
       candidate <- candidates
       let passed = viable candidate
       let statement = if passed
                       then "passed"
                       else "failed"
       return statement

    --    The monadic assessCandidate works on IO, Maybe, and List   --
assessCandidate :: Monad m => m Candidate -> m String
assessCandidate candidates = do
      candidate <- candidates
      let passed = viable candidate
      let statement = if passed 
                     then "passed"
                     else "failed"
      return statement