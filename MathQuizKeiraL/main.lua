-- Title: MathQuiz
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program allows you to play a fun math quiz
-- with random operators, lives, and timers.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 0.6, 0.6, 1)
----------------------------------------------------------------------------------
-- LOCAL VARIABLES --
----------------------------------------------------------------------------------
-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local answerCounter = 0
local numberOfCorrect
local correctAnswers
local answerObject

-- timer variables
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-- lives variables
local lives = 4
local heart1
local heart2
local heart3
local heart4

----------------------------------------------------------------------------------
-- IMAGES --
----------------------------------------------------------------------------------

-- create the lives to display
heart1 = display.newImageRect("Images/heart.png", 40, 40)
heart1.x = display.contentWidth * 5/9
heart1.y = display.contentHeight * 1/10

heart2 = display.newImageRect("Images/heart.png", 40, 40)
heart2.x = display.contentWidth * 6/9
heart2.y = display.contentHeight * 1/10

heart3 = display.newImageRect("Images/heart.png", 40, 40)
heart3.x = display.contentWidth * 7/9
heart3.y = display.contentHeight * 1/10

heart4 = display.newImageRect("Images/heart.png", 40, 40)
heart4.x = display.contentWidth * 8/9
heart4.y = display.contentHeight * 1/10

-- create the game over screen
local gameOver = display.newImage("Images/gameOver.JPG", 0, 0)
	-- set the x and y pos.
	gameOver.x = display.contentCenterX
	gameOver.y = display.contentCenterY

	-- set the width and height
	gameOver.width = display.contentWidth
	gameOver.height = display.contentHeight

	-- sent to front
	gameOver:toFront() 

	-- make invisible
	gameOver.isVisible = false

-- create the good game screen
local goodGame = display.newImage("Images/goodGame.jpeg", 0, 0)
	-- set the x and y pos.
	goodGame.x = display.contentCenterX
	goodGame.y = display.contentCenterY

	-- set the width and height
	goodGame.width = display.contentWidth
	goodGame.height = display.contentHeight

	-- sent to front
	goodGame:toFront() 

	-- make invisible
	goodGame.isVisible = false

----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS -- 
----------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 4

	randomOperator = math.random(1,6)

	-- generate 2 random numbers
	randomNumber1 = math.random(1,8)
	randomNumber2 = math.random(1,8)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- if the first random number is smaller then the second
		-- run the function again until it's correct
		if (randomNumber1 < randomNumber2) then
			runFunction = AskQuestion()
		end
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2

	-- if the random operator is 3, do multiplication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2

	-- if the random operator is 4, do division
	elseif (randomOperator == 4) then
		-- if the first random number is smaller then the second
		-- run the functon again until it's correct
		if (randomNumber1 < randomNumber2) then
			runFunction = AskQuestion()
		end
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2
		correctAnswer = math.floor (correctAnswer + 0.5)

		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2

	-- if the random operator is 5, do a power
	elseif (randomOperator == 5) then
		-- calculate the correct answer
		randomOperator = math.pow(randomNumber1, randomNumber2)

		-- create question in the text object
		questionObject.text = randomNumber1 .. " to the power of "
		 .. randomNumber2

 	-- if the random operator is 6, do a square root
 	elseif (randomOperator == 6) then
 		-- calculate the correct answer
 		randomOperator = math.sqrt(randomNumber1)

 		-- create the question in text object
 		questionObject.text = "the square root of " .. randomNumber1

	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then


	elseif ( event.phase == "submitted" ) then

		-- when the answer is submitted (enter key is pressed)
		-- set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			secondsLeft = totalSeconds
			answerCounter = answerCounter + 1
			numberOfCorrect.text = answerCounter

			timer.performWithDelay(1000, HideCorrect)
		else 
			incorrectObject.isvisible = true
			lives = lives - 1
			timer.performWithDelay(1000, HideIncorrect)
		end
		-- clear text field
		event.target.text = ""
	end
end

local function UpdateTime()

	-- decrese the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if ( phase == "submitted" ) then
		secondsLeft = totalSeconds
	end 

	if (secondsLeft == 0) then
		-- reset the number of seconds left and lose a life
		secondsLeft = totalSeconds
		lives = lives - 1
	end

	if (lives == 3) then
		heart1.isVisible = false
	elseif (lives == 2) then
		heart2.isVisible = false
	elseif (lives == 1) then
		heart3.isVisible = false
	elseif (lives == 0) then
		heart4.isVisible = false
	end

	if (lives == 0) then
		gameOver.isVisible = true
		questionObject.isVisible = false
		numericField.isVisible = false
		clockText.isVisible = false
		correctObject.isVisible = false
		incorrectObject.isvisible = false
		numberOfCorrect.isVisible = false
		correctAnswers.isVisible = false
		timer.cancel(countDownTimer)

	elseif ( answerCounter >= 6 ) then
		goodGame.isVisible = true
		questionObject.isVisible = false
		numericField.isVisible = false
		clockText.isVisible = false
		correctObject.isVisible = false
		incorrectObject.isvisible = false
		numberOfCorrect.isVisible = false
		correctAnswers.isVisible = false
		timer.cancel(countDownTimer)
	end 
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

------------------------------------------------------------------------------------
-- OBJECT CREATION --
------------------------------------------------------------------------------------
-- add the count of corrects answers
numberOfCorrect = display.newText("", display.contentWidth/2,
 display.contentHeight/1.10, nil, 50)
numberOfCorrect:setTextColor(1, 0.8, 0.6)

-- displays the number of correct answers 
correctAnswers = display.newText( "Correct Answers!",
 display.contentWidth/2, display.contentHeight/1.25, nil, 50)
correctAnswers:setTextColor(1, 0.8, 0.6)
-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/4,
 display.contentHeight/2, nil, 40 )
questionObject:setTextColor(1, 0.8, 0.6)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/1.4,
 display.contentHeight*2/4, nil, 50 )
correctObject:setTextColor(1, 0.8, 0.6)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2,
 display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(1, 0.8, 0.6)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2,
 display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- create clock text
clockText = display.newText( "", display.contentWidth/0.5,
 display.contentHeight/0.5, nil, 50)
clockText:setTextColor(1, 0.8, 0.6)
clockText.isVisible = true

-- add the event listener to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------
-- FUNCTION CALLS --
-----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
-- call the function to run the timer
StartTimer()



