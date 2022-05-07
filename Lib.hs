module Lib where

data Grade = F | D | C | B | A deriving (Eq, Ord, Enum, Show, Read)

data Degree = HS | BA | MS | PhD deriving (Eq, Ord, Enum, Show, Read)

data Candidate = Candidate
                          { candidateId :: Int
                          , codeReview :: Grade
                          , cultureFit :: Grade
                          , education :: Degree } deriving Show

testCandidate :: Candidate
testCandidate = Candidate
                           { candidateId = 1
                           , codeReview = A
                           , cultureFit = A
                           , education = PhD }


viable :: Candidate -> Bool
viable candidate = all (== True) tests
    where 
        passedCoding = codeReview candidate > B
        passedCultureFit = cultureFit candidate > C
        educationMin = education candidate >= MS
        tests = [passedCoding
                ,passedCultureFit
                ,educationMin]

readInt :: IO Int
readInt = getLine >>= (return . read)

readGrade :: IO Grade
readGrade = getLine >>= (return . read)

readDegree :: IO Degree
readDegree = getLine >>= (return . read)