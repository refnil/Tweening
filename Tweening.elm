{- Daniël Heres 2014 -}

module Tweening where

{-| Library for tweening Forms.
    @docs tween, tweenWith
-}

import open Easing
import open Graphics.Collage

{-| Move the x and y positions of a form with `EaseOptions` -}
tweenWith : EaseOptions -> EaseOptions -> Form -> Signal Form
tweenWith ox oy f = lift2 (\x y -> move (x.value, y.value) f) (ease ox) (ease oy)

{-| Tween form to (x,y) with a duration and an easing function -}
tween : (Float, Float) -> Time -> Easing -> Form -> Signal Form
tween (x, y) d e f =
    let
        x' = {from = f.x, to = x, duration = d, easing = e}
        y' = {from = f.y, to = y, duration = d, easing = e}
    in
        tweenWith x' y' f


