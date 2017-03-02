----------------------------------------------------------------------------------
--
-- play.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.

	local background = display.newImageRect( "images/HAIVINTO.png", _W, _H )
	-- centro l'immagine rispetto al display
	background.x, background.y = _W/2, _H/2
	
	
	-- creo un pulsante "Game Over" che una volta premuto scatena l'esecuzione della funzione "endGameTrigger"
	local playAgain = display.newImageRect( "images/GameoverPlayAgain.png", 190, 23 )
	playAgain.x = _W/2
	playAgain.y = _H*2/3

	
	-- Se il pulsante viene premuto vado alla scena "gameover"
	local function endGameTrigger(event)
		if event.phase == "ended" then
		
			-- Con una apposita funzione stoppo gli eventi associati a Runtime
			stopRuntimeListener()
			-- Fermo il gioco
			composer.gotoScene( "welcome" )
		end
	end

	function stopRuntimeListener()
	
		-- Se hai creato degli eventi Runtime ricordati di rimuoverli da qui!!!
--		Runtime:removeEventListener("enterFrame", moveSpaceship)
--		Runtime:removeEventListener("enterFrame", createRock)
--		Runtime:removeEventListener("touch", stop )
	
	end
	
	-- Aggiungiamo tutti gli elementi al gruppo "playGroup"
	sceneGroup:insert( background )	
	sceneGroup:insert( playAgain )

	-- Aggiungiamo gli Event Listener!!
	playAgain:addEventListener("touch", endGameTrigger)
	
	-- Se hai bisogno della Fisica falla partire decommentando qui sotto!!
	--	physics.start()
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
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