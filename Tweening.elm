{- Daniël Heres 2014 -}

module Tweening where

{-| Library for tweening Forms.
    @docs tween, tweenTransform, tweenMove
    
    
```haskell

import open Easing
import open Tweening
import open Graphics.Collage       
      
main = lift (collage 500 500) <| combine 
            [ tween (100, 100) 2000 easeInOutQuad <| filled blue (circle 100)
            , tween (0, 200) 2000 easeInOutQuart <| filled red (rect 40 70)
            , tween (200, 200) 1000 easeInOutCubic <| toForm <| plainText "aaa"
            , tweenTransform 0.0 1.0 1000 alpha linear <| filled orange (rect 40 70)
            ]

```
-}

import open Easing
import open Graphics.Collage

{-| Move the x and y positions of a form with `EaseOptions` -}
tweenMove : EaseOptions -> EaseOptions -> Form -> Signal Form
tweenMove ox oy f = (\x y -> move (x.value, y.value) f) <~ ease ox ~ ease oy


{-| Tween form to (x,y) with a duration and an easing function 

```haskell
tween (200, 200) 1000 easeInOutCubic <| toForm <| plainText "aaa"
```

-}
tween : (Float, Float) -> Time -> Easing -> Form -> Signal Form
tween (x, y) d e f =
    let
        x' = {from = f.x, to = x, duration = d, easing = e}
        y' = {from = f.y, to = y, duration = d, easing = e}
    in
        tweenMove x' y' f

{-| Transform a form with an easing function. Takes as fourth argument a transformation function.

```haskell
tweenTransform 0.0 1.0 1000 alpha linear <| filled orange (rect 40 70)
```

-}
tweenTransform : Float -> Float -> Time -> (Float -> Form -> Form) -> Easing -> Form -> Signal Form
tweenTransform from to d t e f =
    (\x -> t x.value f) <~ 
        ease {from = from, to = to, duration = d, easing = e}
