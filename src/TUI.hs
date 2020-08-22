module TUI where

import Brick
import Brick.Widgets.Center
import Brick.Widgets.Border
import Brick.Widgets.Border.Style

-- Construct a brick Widget with a given String
ui :: String -> Widget ()
ui s = withBorderStyle unicode $ border $ center (str s)

-- Show the brick Widget with custom String
showStrategy :: String -> IO ()
showStrategy strat = simpleMain $ ui strat
