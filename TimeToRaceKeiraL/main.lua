-- Title: SampleVideoGame
-- Name: Keira L
-- Course: ICS2O/3C
-- This program runs my video game that my team and I made
-- with a working main menu screen
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
