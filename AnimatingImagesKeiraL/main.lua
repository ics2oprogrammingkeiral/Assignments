-- Title: AnimatingImages
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create my local variables
local backgroundImage = display.newImageRect("Images/backyard2.jpg", 2048, 1536)

local trampoline = display.newImageRect("Images/trampoline.png", 400, 200)
local picnicBlanket = display.newImageRect("Images/picnicBlanket.png", 500, 500)

local austin = display.newImageRect("Images/austin.png", 250, 250)
local austinWidth = austin.width 
local austinHeight = austin.height 

local tasha = display.newImageRect("Images/tasha.png", 250, 250)
local tashaWidth = tasha.width 
local tashaHeight = tasha.height 

local tyrone = display.newImageRect("Images/tyrone.png", 250, 250)
local tyroneWidth = tyrone.width 
local tyroneHeight = tyrone.height 

local uniqua = display.newImageRect("Images/uniqua.png", 250, 250)
local uniquaWidth = uniqua.width 
local uniquaHeight = uniqua.height

local pablo = display.newImageRect("Images/pablo.png", 250, 250)
local pabloWidth = pablo.width 
local pabloHeight = pablo.height 

-- create my global variables
scrollSpeed = -4

-- boolean variables
local uniquaReachesEdge
local tyroneReachesEdge

-- set the initial x and y poisitions
austin.x = 850
austin.y = 600

pablo.x = 200
pablo.y = 500

tasha.x = 700
tasha.y = 550

tyrone.x = 900
tyrone.y = display.contentHeight/2.5
 
uniqua.x = 750
uniqua.y = display.contentHeight/2.5

picnicBlanket.x = 750
picnicBlanket.y = 575

trampoline.x = 225
trampoline.y = 650

-- flip austin vertically
austin.xScale = -1

-- Function: MoveUniqua
-- Input: 
-- Output:
-- Description:
local function MoveUniqua(event)
	-- add the scroll speed to uniquas x-value
	uniqua.x = uniqua.x + scrollSpeed

end

-- MoveUniqua will be called over and over again
Runtime:addEventListener("enterFrame", MoveUniqua)

-- Function: MoveTyrone
-- Input: 
-- Output:
-- Description:
local function MoveTyrone(event)
	-- add the scroll speed to uniquas x-value
	tyrone.x = tyrone.x + scrollSpeed
end

-- MoveTyrone will be called over and over again
Runtime:addEventListener("enterFrame", MoveTyrone)