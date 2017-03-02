----------------------------------------------------------------------------------
--
-- welcome.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

	-- display a background image (ridimensionata per coprire i bordi esterni)
	local background = display.newImageRect( "images/happyfish.png", _W*3/2.5 , _H)
	-- centro l'immagine rispetto al display
	background.x, background.y = _W/2, _H/2

	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "images/WelcomeLogo.png", 240, 35 )
	-- posiziono il titolo in posizione centrale e in alto
	titleLogo.x = _W/2
	titleLogo.y = _H/2
	
	-- creo un pulsante "Gioca ora" che una volta premuto scatena l'esecuzione della funzione "playNowTrigger"
	local playNow = display.newImageRect( "images/WelcomePlayNow.png", 190, 26 )
	playNow.x = _W/2
	playNow.y = _H/2 +100
	
	-- Se il pulsante viene premuto lancio l'esecuzione della funzione "play"
	local function playNowTrigger(event)
		if event.phase == "ended" then
			composer.gotoScene( "play" )
		end
	end
	
	-- Aggiungiamo gli Event Listener!!
	playNow:addEventListener("touch", playNowTrigger)
	
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playNow )
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene