{-# OPTIONS_GHC -fno-warn-warnings-deprecations -fno-warn-unused-binds #-}
import CodeWorld

main :: IO ()
main = exercise1

-- Fill in the blanks! (When I say blanks, I mean undefineds)

-- Exercise 1

lightBulb :: Color -> Double -> Picture
lightBulb c dx = colored c (translated 0 (dx) (solidCircle 1))

frame :: Picture
frame = rectangle 2.5 7.5

trafficLight :: Color -> Color -> Color -> Picture
trafficLight a b c = 
  lightBulb a 2.5 &
  lightBulb b 0 &
  lightBulb c (-2.5) &
  frame

isBetween a b c = (a < b) && (b <= c)

trafficController :: Integer -> Picture
trafficController s
  | isBetween 2 s 3 = trafficLight black yellow black
  | isBetween 3 s 5 = trafficLight red black black
  | isBetween 5 s 6 = trafficLight red yellow black
  | otherwise                = trafficLight black black green

trafficLightAnimation :: Double -> Picture
trafficLightAnimation t = trafficController (round t `mod` 8)

exercise1 :: IO ()
exercise1 = animationOf trafficLightAnimation
