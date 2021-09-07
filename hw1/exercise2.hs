{-# OPTIONS_GHC -fno-warn-warnings-deprecations -fno-warn-unused-binds #-}
import CodeWorld

main :: IO ()
main = exercise2

tree :: Picture -> Integer -> Picture
tree b 0 = b
tree b n = translated 0 1 (rotated (pi/10) (tree b (n-1)) & rotated (- pi/10) (tree b (n-1))) &
           polyline [(0,0),(0,1)]

blossom :: Double -> Picture
blossom t = colored yellow (solidCircle ((min t 10) / 25))

animation :: Double -> Picture
animation t = tree (blossom t) 8

exercise2 = animationOf animation
