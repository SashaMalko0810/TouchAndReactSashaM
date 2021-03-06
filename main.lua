-- Title: TouchAndReact
-- Name: Sasha Malko
-- Course: ICS2O/3C
-- This program displays a button that when I click on it, 
-- turns colour and displays text and another object.

--create local variables for the sound
local correctSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")
local correctSoundChannel
local wrongSound = audio.loadSound("Sounds/Wrong Buzzer Sound Effect.mp3")
local wrongSoundChannel

--set background colour
display.setDefault("background", 5/255, 35/255, 156/255) 

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

--create blue button, set its position and make it invisible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--set an image for when the blue button is not clicked
local redX = display.newImageRect("Images/red_x.png", 100, 100)
redX.x = display.contentWidth/2
redX.y = 150
redX.isVisible = true

--create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--set an image for when the blue button is clicked
local greenCheck = display.newImageRect("Images/checkmark.png",198, 96)
greenCheck.x = display.contentWidth/2
greenCheck.y = 150
greenCheck.isVisible = false

--create text object, set its postion and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0,1,0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		greenCheck.isVisible = true
		redX.isVisible = false
		correctSoundChannel = audio.play(correctSound)
	    
	end

	if (touch.phase == 'ended') then 
	    blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		greenCheck.isVisible = false
		redX.isVisible = true
		wrongSoundChannel = audio.play(wrongSound)
	end
end

--add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is clicked, it will make the blue button appear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == 'ended') then 
	    blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
end

--add the respective listeners to each object
redButton:addEventListener("touch", RedButtonListener)