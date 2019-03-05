-- Title: DisplayShapes
-- Name: Keira L
-- Course: ICS2O/3C
-- This program displays different shapes/polygons 
-- with its name underneath it on iPad simulator 

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 1, 0.8, 0.8)

-- create my local variables
local height = display.contentHeight * 0.2
local topTextH = height - 150
local bottomTextH = height + 150
local textSize = 40
local heightLineTwo = display.contentHeight * 0.7
local bottomTextHTwo = heightLineTwo + 150
local starTrailHeightTwo = display.contentHeight * 0.7
local starTrailHeightThree = display.contentHeight * 0.8
-------------------------------------------------------------------------

-- vertices for the pentagon
local pentagonVertices = {100,-320,200,-400,300,-320,250,-200,150,-200}

-- location of the pentagon
local pentagonx = 130

-- create the pentagon
local pentagon = display.newPolygon(pentagonx, height, pentagonVertices)

-- colour the pentagon
pentagon:setFillColor(1, 1, 0.4)

-- set border width
pentagon.strokeWidth = 8

-- set the border colour
pentagon:setStrokeColor(0.87, 0.87, 0.87)

-- create pentagon text
local pentagonText = display.newText("Pentagon", pentagonx, bottomTextH, Arial, textSize)
------------------------------------------------------------------------

-- vertices for the rhombus
local rhombusVertices = {960,-360,1200,-360,1100,-240,880,-240}

-- location of the rhombus
local rhombusx = 850

-- create the rhombus
local rhombus  = display.newPolygon(rhombusx, height, rhombusVertices)

-- colour the rhombus
rhombus:setFillColor(0.69, 1, 0.4)

-- set border width
rhombus.strokeWidth = 8

-- set the border colour
rhombus:setStrokeColor(0.87, 0.87, 0.87)

-- create rhombus text
local rhombusText = display.newText("Rhombus", rhombusx, bottomTextH, Arial, textSize)
------------------------------------------------------------------------

-- vertices for the triangle
local triangleVertices = {480,-360,400,-200,560,-200}

-- location of the triangle
local trianglex = 480

-- create the triangle
local triangle = display.newPolygon(trianglex, height, triangleVertices)

-- colour the triangle
triangle:setFillColor(0.4, 0.69, 1)

-- set border width
triangle.strokeWidth = 8

-- set the border colour
triangle:setStrokeColor(0.87, 0.87, 0.87)

-- create triangle text
local triangleText = display.newText("Isosceles Triangle", trianglex, bottomTextH, Arial, textSize)
-----------------------------------------------------------------------

-- vertices for hexagon
local hexagonVertices = {50,-50,150,-50,200,20,200,80,150,140,50,140,0,80,0,20}

-- location of the hexagon
local hexagonx = 300

--create the hexagon
local hexagon = display.newPolygon(hexagonx, heightLineTwo, hexagonVertices)

-- colour the hexagon
hexagon:setFillColor(0.69, 0.4, 1)

-- set border width
hexagon.strokeWidth = 8

-- set the border colour
hexagon:setStrokeColor(0.87, 0.87, 0.87)

-- create hexagon text
local hexagonText = display.newText("Hexagon", hexagonx, bottomTextHTwo, Arial, textSize)
-----------------------------------------------------------------------

-- vertices for the star
local starVertices = {0,-110,27,-35,105,-35,43,16,65,90,0,45,-65,90,-43,15,-105,-35,-27,-35,}

-- location of the star
local starx = 680

-- create the star
local star = display.newPolygon(starx, heightLineTwo, starVertices)

-- fill the star
star.fill = { type="image", filename="Images/galaxy.jfif" }

-- set the border width
star.strokeWidth = 10

-- set the border colour
star:setStrokeColor(0.87, 0.87, 0.87)

-- create shooting star text
local starText = display.newText("Shooting Star", starx, bottomTextHTwo, Arial, textSize)
-------------------------------------

--vertices for star trail one
local starTrailVertices = {105,-20,250,-45,145,-10,}

-- location of the star trail
local starTrailx = 820

-- location on the y-axis 
local starTrailHeight = display.contentHeight * 0.6

-- create the star trail
local starTrail = display.newPolygon(starTrailx, starTrailHeight, starTrailVertices)

-- colour the star trail
starTrail:setFillColor(1, 1, 0.4)
------------------------------------

-- vertices for star trail two
local starTrailVerticesTwo = {105,-20,250,-45,145,-10}

-- location of the star trail
local starTrailx = 860

-- location on the y-axis 
local starTrailHeightTwo = display.contentHeight * 0.7

-- create the star trail
local starTrailTwo = display.newPolygon(starTrailx, starTrailHeightTwo, starTrailVerticesTwo)

-- colour the star trail
starTrailTwo:setFillColor(1, 1, 0.4)
------------------------------------

-- vertices for star trail two
local starTrailVerticesThree = {105,-20,250,-45,145,-10}

-- location of the star trail
local starTrailx = 820

-- location on the y-axis 
local starTrailHeightThree = display.contentHeight * 0.8

-- create the star trail
local starTrailThree = display.newPolygon(starTrailx, starTrailHeightThree, starTrailVerticesThree)

-- colour the star trail
starTrailThree:setFillColor(1, 1, 0.4)
-------------------------------------

