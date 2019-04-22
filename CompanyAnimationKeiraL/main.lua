-- Title: CompanyLogoAnimation
-- Name: Keira L
-- Course: ICS2O/3C
-- This program displays the company logo that my group
-- made along with animations and sounds

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0.96078, 0.96078, 0.96078)

---------------------------------------------------------------
-- VARIABLES -- 
---------------------------------------------------------------
scrollSpeed = 10

---------------------------------------------------------------
-- OBJECTS -- 
---------------------------------------------------------------
-- create the plate
local plate = display.newImage("Images/plate.png", 0, 0)
	plate.x = display.contentWidth/2
	plate.y = display.contentHeight/-2

-- create the fork
local fork = display.newImage("Images/fork.png", 0, 0)
	fork.x = display.contentWidth/2
	fork.y = display.contentHeight/-2

-- create the spoon
local spoon = display.newImage("Images/spoon.png", 0, 0)
	spoon.x = display.contentWidth/2
	spoon.y = display.contentHeight/-2
-- create the slime
local slime = display.newImage("Images/slime.png", 0, 0)
	slime.x = display.contentWidth/2
	slime.y = display.contentHeight/-2

---------------------------------------------------------------
-- FUNCTIONS -- 
---------------------------------------------------------------
-- move the plate to the starting poisition
local function MovePlate( event )
	-- add the scroll speed to the y-value
	plate.y = plate.y + scrollSpeed
end

-- move the fork to the starting poisition
local function MoveFork( event )
	-- add the scroll speed to the y-value
	fork.y = fork.y + scrollSpeed
end

-- move the spoon to the starting poisition
local function MoveSpoon( event )
	-- add the scroll speed to the y-value
	spoon.y = spoon.y + scrollSpeed
end

-- move the slime to the starting poisition
local function MoveSlime( event )
	-- add the scroll speed to the y-value
	slime.y = slime.y + scrollSpeed
end

---------------------------------------------------------------
-- EVENT LISTENERS -- 
---------------------------------------------------------------
Runtime:addEventListener("EnterFrame", MovePlate, 300)
Runtime:addEventListener("EnterFrame", MoveSlime)
Runtime:addEventListener("EnterFrame", MoveFork)
Runtime:addEventListener("EnterFrame", MoveSpoon)
---------------------------------------------------------------
-- DELAYS -- 
---------------------------------------------------------------
timer.performWithDelay(0, MovePlate)
timer.performWithDelay(0, MoveSlime)
timer.performWithDelay(200, MoveFork)
timer.performWithDelay(200, MoveSpoon)

---------------------------------------------------------------
-- START FUNCTIONS -- 
---------------------------------------------------------------
MovePlate()
MoveSlime()
MoveFork()
MoveSpoon()