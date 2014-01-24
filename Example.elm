import open Easing
import open Tweening
import open Graphics.Collage       
      
main = lift (collage 500 500) <| combine 
            [ tween (100, 100) 2000 easeOutQuad <| filled blue (circle 100)
            , tween (0, 200) 2000 easeInBack <| filled red (rect 40 70)
            , tween (200, 200) 1000 linear <| toForm <| plainText "aaa"
            ]

