import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import XMonad.Actions.CycleWS
import System.IO

myManageHook = composeAll
    [ className =? "schismtracker" --> doFloat
    , className =? "Gimp"          --> doFloat
    , className =? "Steam"         --> doFloat
    , className =? "Msgcompose"    --> doFloat
    , className =? "Qjackctl"      --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar ~zero/.xmobarrc"
    xmonad $ defaultConfig 
        { manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  (layoutHook defaultConfig) ||| noBorders (Full)
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        , modMask = mod4Mask
        , terminal = "urxvt"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask, xK_Right), nextWS)
        , ((mod4Mask, xK_Left), prevWS)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftToNext)
        , ((mod4Mask .|. shiftMask, xK_Left), shiftToPrev)
        ]
