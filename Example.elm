import open Easing
import open Tweening
import open Graphics.Collage       
      
main = lift (collage 500 500) <| combine 
            [ tween (100, 100) 2000 easeInOutQuad <| filled blue (circle 100)
            , tween (0, 200) 2000 easeInOutQuart <| filled red (rect 40 70)
            , tween (200, 200) 1000 easeInOutCubic <| toForm <| plainText "aaa"
            , tweenTransform 0.0 1.0 1000 alpha linear <| filled orange (rect 40 70)
            ]

