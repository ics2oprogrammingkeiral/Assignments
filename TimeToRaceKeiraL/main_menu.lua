-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Keira L
-- Date: May 5, 2019
-- Description: This is the main menu, displaying the credits, instructions 
-- & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local creditsRock
local instructionsRock
local cloud
local sunray1
local sunray2
local sunray3
local sunray4

local SPEED = -2
local SPEED2 = 2

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "zoomOutInFadeRotate", time = 500})
end

-- Creating Transition Function to Instructions Page
local function InstructionsTransition( )       
    composer.gotoScene( "instruction_screen", {effect = "zoomOutInFadeRotate", time = 500})
end  

-- Creating Transition Function to Play Page
local function LevelSelectTransition( )       
    composer.gotoScene( "levelSelect_screen", {effect = "zoomOutInFadeRotate", time = 500})
end  

-- this fuction makes the cloud move into frame
local function MoveCloud()
    -- add the scroll speed
    cloud.x = cloud.x + SPEED2
    if (cloud.x >= display.contentWidth/4.5) then
        -- stop moving cloud
        Runtime:removeEventListener("enterFrame", MoveCloud)
    end
end


-- this fuction makes the button move into frame
local function MovePlay()
    -- add the scroll speed
    playButton.x = playButton.x + SPEED2
    if (playButton.x >= display.contentWidth*1/8) then
        -- stop moving the button
        Runtime:removeEventListener("enterFrame", MovePlay)
    end
end

-- this fuction makes the button move into frame
local function MoveIns()
    -- add the scroll speed
    instructionsButton.x = instructionsButton.x + SPEED2
    if (instructionsButton.x >= display.contentWidth*1/8) then
        -- stop moving the button
        Runtime:removeEventListener("enterFrame", MoveIns)
    end
end


-- this fuction makes the button move into frame
local function MoveCred()
    -- add the scroll speed
    creditsButton.x = creditsButton.x + SPEED2
    if (creditsButton.x >= display.contentWidth*1/8) then
        -- stop moving cloud
        Runtime:removeEventListener("enterFrame", MoveCred)
    end
end


-- this fuction makes the button move into frame
local function MoveSunray1()
    -- add the scroll speed
    sunray1.y = sunray1.y + SPEED2
    if (sunray1.y >= display.contentHeight/7.4) then
        -- move the sunray back to it's starting poisition
        sunray1.y = sunray1.y + SPEED
    end
end


Runtime:addEventListener("enterFrame", MoveCloud)
Runtime:addEventListener("enterFrame", MovePlay)
Runtime:addEventListener("enterFrame", MoveIns)
Runtime:addEventListener("enterFrame", MoveCred)
Runtime:addEventListener("enterFrame", MoveSunray1)


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuScreen.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 0,
            y = display.contentHeight*7.25/8,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed.png",
            overFile = "Images/CreditsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

        -- scale down the size
        creditsButton:scale(0.55, 0.55)

    -----------------------------------------------------------------------------------------
   
    -- Creating instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 0,
            y = display.contentHeight*6/8,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

        -- scale down the size
        instructionsButton:scale(0.55, 0.55)

    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = 0,
            y = display.contentHeight*4.75/8,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressed.png",
            overFile = "Images/PlayButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition          
        } )

        -- scale down the size
        playButton:scale(0.55, 0.55)

-----------------------------------------------------------------------------------------
    cloud = display.newImage("Images/cloud.png")
    cloud.x = 0
    cloud.y = 100

    cloud:scale(0.15, 0.15)

    sunray1 = display.newImage("Images/sunray1.png")
    sunray1.x = 1000
    sunray1.y = 160


    sunray2 = display.newImage("Images/sunray1.png")
    sunray2.x = 920
    sunray2.y = 135

    sunray2.rotation = 45


    sunray3 = display.newImage("Images/sunray1.png")
    sunray3.x = 880
    sunray3.y = 80

    sunray3.rotation = 60


    sunray4 = display.newImage("Images/sunray1.png")
    sunray4.x = 875
    sunray4.y = 20

    sunray4.rotation = 90
    -----------------------------------------------------------------------------------------
    -- Associating button widgets with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( playButton )
    sceneGroup:insert( cloud )
    sceneGroup:insert( sunray1 )
    sceneGroup:insert( sunray2 )
    sceneGroup:insert( sunray3 )
    sceneGroup:insert( sunray4 )

end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    
    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
