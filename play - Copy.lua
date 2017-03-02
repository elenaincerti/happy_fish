----------------------------------------------------------------------------------
--
-- play.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local centerX = display.contentCenterX
local centerY = display.contentCenterY

physics = require( "physics" )
physics.start()
physics.setGravity( 0, 85)

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.

	--local background = display.newImageRect( "images/sfondovero.png",_W + 70, _H )
	-- centro l'immagine rispetto al display
	--background.x, background.y = _W/2, _H/2

	bg = display.newImageRect("images/sfondovero.png",_W+200,_H)
 	bg.anchorX = 0.2
 	bg.anchorY = 1
 	bg.x = 0
 	bg.y = display.contentHeight
 	bg.speed = 4
 	sceneGroup:insert(bg)
 

	local soffitto = display.newImageRect( "images/PlayGround.png", _W, 20 )
	soffitto.myName = "ground"
	soffitto.isVisible=false
	soffitto.x = _W/2
	soffitto.y = 0
	physics.addBody( soffitto, "static", { friction=0, bounce=0 } )

	local ground = display.newImageRect( "images/PlayGround.png", _W, 20 )
	ground.myName = "ground"
	ground.isVisible=false
	ground.x = _W/2
	ground.y = _H
	physics.addBody( ground, "static", { friction=0, bounce=0 } )
	-- creo un pulsante "Game Over" che una volta premuto scatena l'esecuzione della funzione "endGameTrigger"
	local endGame = display.newImageRect( "images/PlayEndGame.png", 159, 22 )
	endGame.x = _W/2
	endGame.y = _H*1/3
	endGame.isVisible=false
	endGame.isVisible=false
	-- Se il pulsante viene premuto vado alla scena "gameover"
	local function endGameTrigger(collision)
		if collision.phase == "ended" then
		
			-- Con una apposita funzione stoppo gli eventi associati a Runtime
			stopRuntimeListener()
			-- Fermo il gioco
			composer.gotoScene( "gameover" )
		end
	end

	function stopRuntimeListener()
		-- Se hai creato degli eventi Runtime ricordati di rimuoverli da qui!!!
--		Runtime:removeEventListener("enterFrame", moveSpaceship)
--		Runtime:removeEventListener("touch", stop )
	end
	
	-- Aggiungiamo tutti gli elementi al gruppo "playGroup"
	--sceneGroup:insert( background )
	sceneGroup:insert( ground )
	sceneGroup:insert( endGame )

	-- Aggiungiamo gli Event Listener!!
	endGame:addEventListener("touch", endGameTrigger)
	
end





function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-------------------------------------------------------------------------------------------
		-- INSERIAMO HAPPI
		-------------------------------------------------------------------------------------------

		fish = display.newImageRect( "images/fish.png", 55,40)
		fish.x = _W/2 - 150
		fish.y = _H/2
		fish.myName = "fish"
		physics.addBody( fish, "dynamic", { density=0.3, friction=0.5, bounce=0.3 } )

		function flyUp(event)
		   if event.phase == "began" then
		      fish:applyForce(0, -500, fish.x, fish.y)
			end
		end

		sceneGroup:insert( fish )


		local ostacoliGroup = display.newGroup()

		squalo = display.newImageRect("images/squalo.png",120,100)
		squalo.anchorX = 0.5
		squalo.anchorY = 1
		squalo.x = 4200
		squalo.y = 90;
		squalo.myName = "squalo"
		squalo.isVisible = true;
		squalo.collType = "passthru"
		physics.addBody( squalo, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
--
		transition.to( squalo, {time=6000, x=(-200), y=300})
--


		squalo2 = display.newImageRect("images/squalo.png",120,100)
		squalo2.anchorX = 0.5
		squalo2.anchorY = 1
		squalo2.x = 6000
		squalo2.y = 150;
		squalo2.myName = "squalo"
		squalo2.isVisible = true;
		squalo2.collType = "passthru"
		physics.addBody( squalo2, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})

		transition.to( squalo2, {time=9400, x=(-200), y=150})

		squalo3 = display.newImageRect("images/squalo.png",120,100)
		squalo3.anchorX = 0.5
		squalo3.anchorY = 1
		squalo3.x = 6000
		squalo3.y = 200;
		squalo3.myName = "squalo"
		squalo3.isVisible = true;
		squalo3.collType = "passthru"
		physics.addBody( squalo3, "kinematic", { bounce=0.0, friction=0.3 } )
		--physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})

		transition.to( squalo3, {time=9400, x=(-200), y=200})
		squalo4 = display.newImageRect("images/squalo.png",120,100)
		squalo4.anchorX = 0.5
		squalo4.anchorY = 1
		squalo4.x = 7500
		squalo4.y = 3500;
		squalo4.myName = "squalo"
		squalo4.isVisible = true;
		squalo4.collType = "passthru"
		physics.addBody( squalo4, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})

		transition.to( squalo4, {time=10700, x=(-200), y=90})
		squalo5 = display.newImageRect("images/squalo.png",120,100)
		squalo5.anchorX = 0.5
		squalo5.anchorY = 1
		squalo5.x = 9200
		squalo5.y = 120;
		squalo5.myName = "squalo"
		squalo5.isVisible = true;
		squalo5.collType = "passthru"
		physics.addBody( squalo5, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
---
		transition.to( squalo5, {time=14000, x=(-200), y=120})
		squalo6 = display.newImageRect("images/squalo.png",120,100)
		squalo6.anchorX = 0.5
		squalo6.anchorY = 1
		squalo6.x = 12100
		squalo6.y = 80;
		squalo6.myName = "squalo"
		squalo6.isVisible = true;
		squalo6.collType = "passthru"
		physics.addBody( squalo6, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
--
		transition.to( squalo6, {time=17400, x=(-200), y=80})
		squalo7 = display.newImageRect("images/squalo.png",120,100)
		squalo7.anchorX = 0.5
		squalo7.anchorY = 1
		squalo7.x = 12100
		squalo7.y = 300;
		squalo7.myName = "squalo"
		squalo7.isVisible = true;
		squalo7.collType = "passthru"
		physics.addBody( squalo7, "kinematic", { bounce=0.0, friction=0.3 } )
		physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})

		transition.to( squalo7, {time=17400, x=(-200), y=250})
--squalo8 = display.newImageRect("images/squalo.png",120,100)
--		squalo8.anchorX = 0.5
--		squalo8.anchorY = 1
--		squalo8.x = 600
--		squalo8.y = 90;
--		squalo8.myName = "squalo"
--		squalo8.isVisible = true;
--		squalo8.collType = "passthru"
--		physics.addBody( squalo8, "kinematic", { bounce=0.0, friction=0.3 } )
--		--physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
--
--		transition.to( squalo8, {time=1500, x=(-200), y=400})
--squalo9 = display.newImageRect("images/squalo.png",120,100)
--		squalo9.anchorX = 0.5
--		squalo9.anchorY = 1
--		squalo9.x = 600
--		squalo9.y = 90;
--		squalo9.myName = "squalo"
--		squalo9.isVisible = true;
--		squalo9.collType = "passthru"
--		physics.addBody( squalo9, "kinematic", { bounce=0.0, friction=0.3 } )
		--physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
--
--		transition.to( squalo9, {time=1500, x=(-200), y=400})
--squalo10 = display.newImageRect("images/squalo.png",120,100)
--		squalo10.anchorX = 0.5
--		squalo10.anchorY = 1
--		squalo10.x = 600
---		squalo10.y = 90;
	--	squalo10.myName = "squalo"
	--	squalo10.isVisible = true;
	--	squalo10.collType = "passthru"
	--	physics.addBody( squalo10, "kinematic", { bounce=0.0, friction=0.3 } )
	--	--physics.addBody(squalo, "kinematic", {density=0.5, bounce=0.5, friction=0.2})
--
--		transition.to( squalo10, {time=1500, x=(-200), y=400})
--
		corallo = display.newImageRect("images/corallo.png",90,90)
		corallo.anchorX = 0.5
		corallo.anchorY = 1
		corallo.x = 450
		corallo.y = 285;
		corallo.myName = "corallo"
       corallo.isVisible = true;
		physics.addBody( corallo,"kinematic", { bounce=0.0, friction=0.3 } )

		transition.to( corallo, {time=4000, x=-200, y=(285)})
---
		corallo2 = display.newImageRect("images/corallo.png",90,90)
		corallo2.anchorX = 0.5
		corallo2.anchorY = 1
		corallo2.x = 4800
		corallo2.y = 285;
		corallo2.myName = "corallo"
		corallo2.isVisible = true;
		physics.addBody( corallo2,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo2, {time=8000, x=-200, y=(285)})
		
		corallo3 = display.newImageRect("images/corallo.png",90,90)
		corallo3.anchorX = 0.5
		corallo3.anchorY = 1
		corallo3.x = 4900
		corallo3.y = 285;
		corallo3.myName = "corallo"
		corallo3.isVisible = true;
		physics.addBody( corallo3,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo3, {time=8100, x=-200, y=(285)})
		corallo4 = display.newImageRect("images/corallo.png",90,90)
		corallo4.anchorX = 0.5
		corallo4.anchorY = 1
		corallo4.x = 5000
		corallo4.y = 285;
		corallo4.myName = "corallo"
		corallo4.isVisible = true;
		physics.addBody( corallo4,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo4, {time=8200, x=-200, y=(285)})
		corallo5 = display.newImageRect("images/corallo.png",90,90)
		corallo5.anchorX = 0.5
		corallo5.anchorY = 1
		corallo5.x = 8600
		corallo5.y = 285;
		corallo5.myName = "corallo"
		corallo5.isVisible = true;
		physics.addBody( corallo5,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo5, {time=13000, x=-200, y=(285)})
		corallo6 = display.newImageRect("images/corallo.png",90,90)
		corallo6.anchorX = 0.5
		corallo6.anchorY = 1
		corallo6.x = 9600
		corallo6.y = 285;
		corallo6.myName = "corallo"
		corallo6.isVisible = true;
		physics.addBody( corallo6,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo6, {time=14500, x=-200, y=(285)})
		corallo7 = display.newImageRect("images/corallo.png",90,90)
		corallo7.anchorX = 0.5
		corallo7.anchorY = 1
		corallo7.x = 10900
		corallo7.y = 285;
		corallo7.myName = "corallo"
		corallo7.isVisible = true;
		physics.addBody( corallo7,"kinematic", { bounce=0.0, friction=0.3 } )

		transition.to( corallo7, {time=16200, x=-200, y=(285)})
		corallo8 = display.newImageRect("images/corallo.png",90,90)
		corallo8.anchorX = 0.5
		corallo8.anchorY = 1
		corallo8.x = 10700
		corallo8.y = 285;
		corallo8.myName = "corallo"
		corallo8.isVisible = true;
		physics.addBody( corallo8,"kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( corallo8, {time=16000, x=-200, y=(285)})
		corallo9 = display.newImageRect("images/corallo.png",90,90)
		corallo9.anchorX = 0.5
		corallo9.anchorY = 1
		corallo9.x = 10800
		corallo9.y = 285;
		corallo9.myName = "corallo"
		corallo9.isVisible = true;
		physics.addBody( corallo9,"kinematic", { bounce=0.0, friction=0.3 } )

		transition.to( corallo9, {time=16100, x=-200, y=(285)})
--corallo10 = display.newImageRect("images/corallo.png",90,90)
--		corallo10.anchorX = 0.5
--		corallo10.anchorY = 1
--		corallo10.x = 450
--		corallo10.y = 285;
--		corallo10.myName = "corallo"
--		corallo10.isVisible = true;
--		physics.addBody( corallo10, { bounce=0.0, friction=0.3 } )
--
--		transition.to( corallo10, {time=4000, x=-200, y=(285)})
--corallo11 = display.newImageRect("images/corallo.png",90,90)
--		corallo11.anchorX = 0.5
---		corallo11.anchorY = 1
	--	corallo11.x = 450
	--	corallo11.y = 285;
	--	corallo11.myName = "corallo"
	--	corallo11.isVisible = true;
	--	physics.addBody( corallo11, { bounce=0.0, friction=0.3 } )
--
--		transition.to( corallo11, {time=4000, x=-200, y=(285)})
--corallo12 = display.newImageRect("images/corallo.png",90,90)
--		corallo12.anchorX = 0.5
--		corallo12.anchorY = 1
--		corallo12.x = 450
--		corallo12.y = 285;
----		corallo12.myName = "corallo"
	--	corallo12.isVisible = true;
	--	physics.addBody( corallo12, { bounce=0.0, friction=0.3 } )
---
	--	transition.to( corallo12, {time=4000, x=-200, y=(285)})
--corallo13 = display.newImageRect("images/corallo.png",90,90)
--		corallo13.anchorX = 0.5
--		corallo13.anchorY = 1
--		corallo13.x = 450
---		corallo13.y = 285;
	--	corallo13.myName = "corallo"
	---	corallo13.isVisible = true;
		----physics.addBody( corallo13, { bounce=0.0, friction=0.3 } )

		--transition.to( corallo13, {time=4000, x=-200, y=(285)})
		stella= display.newImageRect("images/stella.png",300,300)
		stella.anchorX = 0.5
		stella.anchorY = 1
		stella.x = 14000
		stella.y = 80;
		stella.myName = "stella"
		stella.isVisible = true;
		
		physics.addBody( stella, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( stella, {time=18400, x=-200, y=(80)})
--
		amo3 = display.newImageRect("images/amo.png",50,50)
		amo3.anchorX = 0.5
		amo3.anchorY = 1
		amo3.x = 6800
		amo3.y = 80;
		amo3.myName = "amo"
		amo3.isVisible = true;
		physics.addBody( amo3, "kinematic", { bounce=0.0, friction=0.3 } )
--
		transition.to( amo3, {time=10200, x=-200, y=(80)})
--
		amo4 = display.newImageRect("images/amo.png",50,50)
		amo4.anchorX = 0.5
		amo4.anchorY = 1
		amo4.x = 10000
		amo4.y = 80;
		amo4.myName = "amo"
		amo4.isVisible = true;
		physics.addBody( amo4, "kinematic", { bounce=0.0, friction=0.3 } )

		transition.to( amo4, {time=15500, x=-200, y=(80)})

--amo5 = display.newImageRect("images/amo.png",50,50)
--		amo5.anchorX = 0.5
--		amo5.anchorY = 1
--		amo5.x = 450
--		amo5.y = 80;
--		amo5.myName = "amo"
--		amo5.isVisible = true;
--		physics.addBody( amo5, "kinematic", { bounce=0.0, friction=0.3 } )
--
----		transition.to( amo5, {time=3000, x=-200, y=(80)})

--amo6 = display.newImageRect("images/amo.png",50,50)
--		amo6.anchorX = 0.5
--		amo6.anchorY = 1
--		amo6.x = 450
--		amo6.y = 80;
--		amo6.myName = "amo"
--		amo6.isVisible = true;
--		physics.addBody( amo6, "kinematic", { bounce=0.0, friction=0.3 } )
--
--		transition.to( amo6, {time=3000, x=-200, y=(80)})
--

		medusa = display.newImageRect("images/medusa.png",50,75)
		medusa.anchorX = 0.5
		medusa.anchorY = 1
		medusa.x = 4500
		medusa.y = 0
		medusa.isVisible = true;
		medusa.myName="medusa"
		physics.addBody( medusa, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( medusa, {time=7000, x=(-200), y=(4000)})

		medusa2 = display.newImageRect("images/medusa.png",50,75)
		medusa2.anchorX = 0.5
		medusa2.anchorY = 1
		medusa2.x = 8100
		medusa2.y = 150;
		medusa2.myName ="medusa"
		medusa2.isVisible = true;
		physics.addBody( medusa2, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( medusa2, {time=12000, x=(-200), y=(250)})


--
--
		medusa3 = display.newImageRect("images/medusa.png",50,75)
		medusa3.anchorX = 0.5
		medusa3.anchorY = 1
		medusa3.x = 11400
		medusa3.y = 150;
		medusa3.isVisible = true;
		medusa3.myName="medusa"
		physics.addBody( medusa3, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( medusa3, {time=16800, x=-200, y=150})

		medusa4 = display.newImageRect("images/medusa.png",50,75)
		medusa4.anchorX = 0.5
		medusa4.anchorY = 1
		medusa4.x = 11400
		medusa4.y = 200;
		medusa4.isVisible = true;
		medusa4.myName="medusa"
		physics.addBody( medusa4, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( medusa4, {time=16800, x=-200, y=200})
		medusa5 = display.newImageRect("images/medusa.png",50,75)
		medusa5.anchorX = 0.5
		medusa5.anchorY = 1
		medusa5.x = 11400
		medusa5.y = 100;
		medusa5.isVisible = true;
		medusa5.myName="medusa"
		physics.addBody( medusa5, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( medusa5, {time=16800, x=-200, y=100})
--medusa6 = display.newImageRect("images/medusa.png",50,75)
--		medusa6.anchorX = 0.5
--		medusa6.anchorY = 1
--		medusa6.x = 450
--		medusa6.y = 150;
--		medusa6.isVisible = true;
--		physics.addBody( medusa6, "kinematic", { bounce=0.0, friction=0.3 } )
--
--		transition.to( medusa6, {time=3000, x=(_W-450), y=(250)})
--medusa7= display.newImageRect("images/medusa.png",50,75)
--		medusa7.anchorX = 0.5
---		medusa7.anchorY = 1
	--	medusa7.x = 450
	--	medusa7.y = 150;
	--	medusa7.isVisible = true;
	--	physics.addBody( medusa7, "kinematic", { bounce=0.0, friction=0.3 } )
--	--	transition.to( medusa7, {time=3000, x=(_W-450), y=(250)})
--

		sceneGroup:insert( squalo )
		sceneGroup:insert( squalo2 )
		sceneGroup:insert( squalo3 )
		sceneGroup:insert( squalo4 )
		sceneGroup:insert( squalo5 )
		sceneGroup:insert( squalo6 )
		sceneGroup:insert( squalo7 )
--		sceneGroup:insert( squalo8 )
--		sceneGroup:insert( squalo9 )
--		sceneGroup:insert( squalo10 )
		sceneGroup:insert( corallo )
		sceneGroup:insert( corallo2 )
		sceneGroup:insert( corallo3 )
		sceneGroup:insert( corallo4 )
		sceneGroup:insert( corallo5 )
		sceneGroup:insert( corallo6 )
		sceneGroup:insert( corallo7 )
		sceneGroup:insert( corallo8 )
		sceneGroup:insert( corallo9 )
--		sceneGroup:insert( corallo10 )
--		sceneGroup:insert( corallo11 )
---		sceneGroup:insert( corallo12 )
--		sceneGroup:insert( corallo13 )
		sceneGroup:insert( amo )
		sceneGroup:insert( amo2 )
		sceneGroup:insert( amo3 )
		sceneGroup:insert( amo4 )
		sceneGroup:insert ( stella )
--		sceneGroup:insert( amo5 )
--		sceneGroup:insert( amo6 )
		sceneGroup:insert ( medusa )
		sceneGroup:insert ( medusa2 )
		sceneGroup:insert ( medusa3 )
		sceneGroup:insert ( medusa4 )
		sceneGroup:insert ( medusa5 )
		
--		sceneGroup:insert ( medusa7 )
--		sceneGroup:insert

		Runtime:addEventListener( "touch", flyUp )
			--

		--local endGame = display.newImageRect( "images/PlayEndGame.png", 159, 22 )
		--	endGame.x = _W/2
		--	endGame.y = _H*1/3
		--endGame.isVisible=true

		----------------------------------------------------------
		-- RILEVO LE COLLISIONI
		----------------------------------------------------------
		local function onLocalCollision( self, event )
			if ( event.phase == "began" ) then
				print(event.phase)
				print( self.myName .. ": collision began with " .. event.other.myName );
				if event.other.myName =="stella" then
					composer.gotoScene("win")
				elseif event.other.myName ~= "ground" then
					composer.gotoScene("gameover")
				end 
				-- AUDIO
				audio.play(sounds.gameOver);
			elseif ( event.phase == "ended" ) then
				print( self.myName .. ": collision ended with " .. event.other.myName );
				
				--self:removeSelf()
				if event.other.myName ~= "ground" then
					composer.gotoScene("gameover")
				end 

				-- Play Sound
				-- audio.play(sounds.gameOver);end

			end
		end

		fish.collision = onLocalCollision
		fish:addEventListener( "collision" )


	elseif phase == "did" then
		-- Called when the scene is now on screen
		
		physics.start()
		
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		physics.pause()
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
		Runtime:removeEventListener( "touch", flyUp )

		fish:removeSelf()
		amo:removeSelf()
		amo2:removeSelf()
		amo3:removeSelf()
		amo4:removeSelf()
--		amo5:removeSelf()
--		amo6:removeSelf()
		squalo:removeSelf()
		squalo2:removeSelf()
		squalo3:removeSelf()
		squalo4:removeSelf()
		squalo5:removeSelf()
		squalo6:removeSelf()
		squalo7:removeSelf()
--		squalo8:removeSelf()
--		squalo9:removeSelf()
--		squalo10:removeSelf()
		corallo:removeSelf()
		corallo2:removeSelf()
		corallo3:removeSelf()
		corallo4:removeSelf()
		corallo5:removeSelf()
		corallo6:removeSelf()
		corallo7:removeSelf()
		corallo8:removeSelf()
		corallo9:removeSelf()
--		corallo10:removeSelf()
--		corallo11:removeSelf()
--		corallo12:removeSelf()
--		corallo13:removeSelf()
        medusa :removeSelf ()
        medusa2 :removeSelf ()
        medusa3 :removeSelf ()
        medusa4 :removeSelf ()
        medusa5 :removeSelf ()
        stella :removeSelf ()
     --   medusa7 :removeSelf ()
--
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