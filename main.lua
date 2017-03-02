-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
_W = display.contentWidth
_H = display.contentHeight

local composer = require "composer"

-- sistemo il volume
audio.setMaxVolume( 0.85, { channel=1 } )

-- pre carico l'audio
sounds = {
	pew = audio.loadSound("sounds/pew.wav"),
	boom = audio.loadSound("sounds/boom.wav"),
	gameOver = audio.loadSound("sounds/gameOver.wav")
}

-- load scenetemplate.lua
composer.gotoScene( "welcome" )


