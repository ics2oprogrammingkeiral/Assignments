-- Title: CompanyLogoAnimation
-- Name: Keira L
-- Course: ICS2O/3C
-- This program displays the company logo that my group
-- made along with animations and sounds

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0.96078, 0.96078, 0.96078)

-- load physics
local physics = require("physics")

-- start physics
physics.start()


---------------------------------------------------------------
-- OBJECTS -- 
---------------------------------------------------------------
-- plate
local plate = display.newImage("Images/plate.png", 0, 0)