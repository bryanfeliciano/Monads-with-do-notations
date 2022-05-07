module Main where

import Lib

main :: IO()
main = undefined

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