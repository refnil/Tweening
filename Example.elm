import Easing
import Tweening

main = lift (collage 500 500) <| combine
            [ Tweening.tween (100, 100) 2000 Easing.easeInOutQuad <| filled blue (circle 100)
            , Tweening.tween (0, 200) 2000 Easing.easeInOutQuart <| filled red (rect 40 70)
            , Tweening.tween (200, 200) 1000 Easing.easeInOutCubic <| toForm <| plainText "aaa"
            , Tweening.tweenTransform 0.0 1.0 1000 alpha Easing.linear <| filled orange (rect 40 70)
            ]
