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
physics.setGravity( 0, 25)

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
		physics.addBody( fish, "dynamic", { density=0.5, friction=0.5, bounce=0 } )

		function flyUp(event)
		   if event.phase == "began" then
		      fish:applyForce(0, -400, fish.x, fish.y)
			end
		end

		sceneGroup:insert( fish )


		local ostacoliGroup = display.newGroup()
		local v=0.1

		squaloTabella = {}
		coralloTabella = {}
		amoTabella ={}
		medusaTabella={}

		configTable ={

			squali ={
				{ x=800, y=90, v=v, ty=300  },
				{ x=1900, y=150, v=v, ty=nil  },
				{ x=1900, y=200, v=v, ty=nil  },
				{ x=2300, y=500, v=v, ty=90  },
				{ x=2900, y=-400, v=v,  ty=350  },
				{ x=4200, y=300, v=v, ty=250  },
			},
			coralli ={
				{ x=450, y=285, v=v },
				{ x=1300, y=285, v=v },
				{ x=1400, y=285, v=v },
				{ x=1500, y=285, v=v },
				{ x=2700, y=285, v=v },
				{ x=3100, y=285, v=v },
				{ x=3500, y=285, v=v },
				{ x=3600, y=285, v=v },
				{ x=3700, y=285, v=v },
			},
			ami ={
				{ x=600, y=80, v=v },
				{ x=1700, y=80, v=v },
				{ x=2100, y=80, v=v },
				{ x=3200, y=80, v=v },
			},
			meduse ={
				{ x=1000, y=100, v=v },
				{ x=2500, y=-300, v=v, ty=300  },
				{ x=3300, y=150, v=v },
				{ x=3900, y=250, v=v },
				{ x=3900, y=70, v=v },
			}

		}

		stella= display.newImageRect("images/stella.png",300,300)
		stella.anchorX = 0.5
		stella.anchorY = 0.5
		stella.x = 4500
		stella.y = _H/2;
		stella.myName = "stella"
		stella.isVisible = true;
		physics.addBody( stella, "kinematic", { bounce=0.0, friction=0.3 } )
		transition.to( stella, {time=stella.x/v, x=-200, y=stella.y})


		for i=1, #configTable.squali do
			squaloTabella[i] = display.newImageRect("images/squalo.png",120,100)
			squalo = squaloTabella[i]
			print("Creo squalo "..i)
			squalo.anchorX = 0.5
			squalo.anchorY = 1
			squalo.x = configTable.squali[i].x
			squalo.y = configTable.squali[i].y;
			squalo.myName = "squalo"
			squalo.collType = "passthru"
			physics.addBody( squalo, "kinematic", { bounce=0.0, friction=0.3 } )
			ty = squalo.y
			if configTable.squali[i].ty ~=nil then
				ty=configTable.squali[i].ty
			end
			transition.to(squalo, {time=squalo.x /v, x=(-200), y=ty})

			sceneGroup:insert( squalo )
			--physics.addBody( squalo, "kinematic", { density=0.5, bounce=0.5, friction=0.2} )
		end

		for i=1, #configTable.coralli do
			
			coralloTabella[i] = display.newImageRect("images/corallo.png",90,90)
			corallo=coralloTabella[i]
			print("Creo corallo "..i)

			corallo.anchorX = 0.5
			corallo.anchorY = 1
			corallo.x = configTable.coralli[i].x
			corallo.y = configTable.coralli[i].y;
			corallo.myName = "corallo"
       		corallo.isVisible = true;
			physics.addBody( corallo,"kinematic", { bounce=0.0, friction=0.3 } )
			transition.to( corallo, {time=corallo.x/v, x=-200, y=corallo.y})
			sceneGroup:insert( corallo )

		end
		
		for i=1, #configTable.ami do

			amoTabella[i] = display.newImageRect("images/amo.png",50,50)
			amo =amoTabella[i]
			print("Creo amo "..i)

			amo.anchorX = 0.5
			amo.anchorY = 1
			amo.x = configTable.ami[i].x
			amo.y = configTable.ami[i].y
			amo.myName = "amo"
			physics.addBody( amo, "kinematic", { bounce=0.0, friction=0.3 } )
			transition.to(amo, {time=amo.x /v, x=(-200), y=amo.y})

			sceneGroup:insert( amo )

		end


--
		for i=1, #configTable.meduse do

			medusaTabella[i] = display.newImageRect("images/medusa.png",50,75)
			medusa=medusaTabella[i]
			print("Creo medusa "..i)

			medusa.anchorX = 0.5
			medusa.anchorY = 1
			medusa.x = configTable.meduse[i].x
			medusa.y = configTable.meduse[i].y
			medusa.myName="medusa"
			physics.addBody( medusa, "kinematic", { bounce=0.0, friction=0.3 } )
			ty = medusa.y
			if configTable.meduse[i].ty ~=nil then
				ty=configTable.meduse[i].ty
			end
			transition.to(medusa, {time=medusa.x/v, x=(-200), y=ty})
			sceneGroup:insert( medusa )

		end


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
		stella:removeSelf()


		for i=1, #configTable.squali do
			squaloTabella[i]:removeSelf()
		end

		for i=1, #configTable.coralli do
			coralloTabella[i]:removeSelf()
		end
		
		for i=1, #configTable.ami do
			amoTabella[i]:removeSelf()
		end

		for i=1,#configTable.meduse do
			medusaTabella[i]:removeSelf()
		end

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