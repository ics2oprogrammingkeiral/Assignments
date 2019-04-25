-- Title: CompanyLogoAnimation
-- Name: Keira L
-- Course: ICS2O/3C
-- This program displays the company logo that my group
-- made along with animations and sounds

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 1, 1, 1)

---------------------------------------------------------------
-- VARIABLES -- 
---------------------------------------------------------------
scrollSpeed = 10

---------------------------------------------------------------
-- SOUNDS -- 
---------------------------------------------------------------
local crashSound = audio.loadSound("Sounds/crash.mp3")
local crashSoundsChannel

---------------------------------------------------------------
-- OBJECTS -- 
---------------------------------------------------------------
-- create the plate
	
local plate = display.newImageRect("Images/plate.png", 600, 450)
	plate.x = display.contentWidth/2
	plate.y = display.contentHeight/-2

-- create the slime
local slime = display.newImageRect("Images/slime.png", 600, 400)
	slime.x = display.contentWidth/2
	slime.y = display.contentHeight/-3

-- create the fork
local fork = display.newImageRect("Images/fork.png", 150, 450)
	fork.x = display.contentWidth/8
	fork.y = display.contentHeight/-2

-- create the spoon
local spoon = display.newImageRect("Images/spoon.png", 150, 450)
	spoon.x = 880
	spoon.y = display.contentHeight/-2

---------------------------------------------------------------
-- FUNCTIONS -- 
---------------------------------------------------------------
-- move the plate to the starting poisition
local function MovePlate( event )
	-- add the scroll speed to the y-value
	plate.y = plate.y + scrollSpeed

	-- make the plate stop after it reaches half
	if (plate.y >= display.contentHeight/2) then
		-- stop moving lamp
		Runtime:removeEventListener("enterFrame", MovePlate)
		-- play crash sound
		crashSoundsChannel = audio.play(crashSound )
	end
end

-- move the slime to the starting poisition
local function MoveSlime( event )
	-- add the scroll speed to the y-value
	slime.y = slime.y + scrollSpeed
		-- make the plate stop after it reaches half
	if (slime.y >= display.contentHeight/1.5) then
		-- stop moving lamp
		Runtime:removeEventListener("enterFrame", MoveSlime)
	end
end

-- move the fork to the starting poisition
local function MoveFork( event )
	-- add the scroll speed to the y-value
	fork.y = fork.y + scrollSpeed
		-- make the plate stop after it reaches half
	if (fork.y >= display.contentHeight/2) then
		-- stop moving lamp
		Runtime:removeEventListener("enterFrame", MoveFork)
		-- play crash sound
		crashSoundsChannel = audio.play(crashSound )
	end
end

-- move the spoon to the starting poisition
local function MoveSpoon( event )
	-- add the scroll speed to the y-value
	spoon.y = spoon.y + scrollSpeed
		-- make the plate stop after it reaches half
	if (spoon.y >= display.contentHeight/2) then
		-- stop moving lamp
		Runtime:removeEventListener("enterFrame", MoveSpoon)
		-- play crash sound
		crashSoundsChannel = audio.play(crashSound )
	end
end


    if ( phase == "will" ) then
       
        -- Pre-Setting Transition Options
        local transitionOptions = (
            {
                effect = "fade",
                time = 1000
            })

        -- Creating Transition function
        function Transition( )
            composer.gotoScene( "main_menu", transitionOptions )
        end
     end 

     -- when the sound finishes playing fade out to main menu
     if (plate.y >= display.contentHeight/2) then
     	-- do the transition
     	Transition( )
     end


---------------------------------------------------------------
-- EVENT LISTENERS -- 
---------------------------------------------------------------
Runtime:addEventListener("enterFrame", MovePlate)
Runtime:addEventListener("enterFrame", MoveSlime)
Runtime:addEventListener("enterFrame", MoveFork)
Runtime:addEventListener("enterFrame", MoveSpoon)

