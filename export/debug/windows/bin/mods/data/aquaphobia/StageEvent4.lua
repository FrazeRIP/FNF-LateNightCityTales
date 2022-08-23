
secPerBeat=0

origZoom = .9

blurTargetAmount = 0
blurCurrentAmount = 0

blurTargetTimer = 0
blurCurrentTimer = 0

blurTemp =10

darkColor = '2B2B2B'

fxAlpha = .7


---------------
monsterOrigPosY = 0
monsterEyeOrigPosY = 270

isWhiteFadeOn = false
isEyesFX = false
isMonsterMoving = false
monsterMoveOffset = 5
----------------------
isSparkleOn = false

sparkleCD = 8

sparkleOrigSize = 1

sparkleOrigAlpha = .8

sparkleOrigAngle = 0

finishDuration = 0



opponentArrowFadeAmount = 1
-----
function onCreate()

setProperty("skipCountdown", true)

		setPropertyFromClass('ClientPrefs', 'middleScroll', false);


end

function onCreatePost()

	secPerBeat = 60/curBpm
	
	triggerEvent("Change Character", 'bf', "bf")
	triggerEvent("Change Character", 'bf', "bf-scare")
	 doTweenColor('bfColorTween', 'boyfriend', 'A19DC0', 0.001, 'linear')
	 doTweenColor('dadColorTween', 'dad', 'A19DC0', 0.001, 'linear')
	 doTweenColor('gfColorTween', 'gf', 'A19DC0', 0.001, 'linear')
	 doTweenX('gfPosX', 'gf', 1100, .001)
	 doTweenY('gfPosY', 'gf', 300, .001)
	 
	 doTweenX('limuPosX', 'dad', -100, .001)
	 doTweenX('bfPosX', 'boyfriend', 800, .001)

	setProperty("BlurX", 10)
	setProperty("BlurY", 10)
	blurCurrentAmount = 10
	blurTargetAmount = 10
	setBlur(0,1)

	
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.6,0.001)

	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setGlow('normal','45BED1',1,32,3)
	setGlow('special','AD4ED9',1,36,4)

	makeAnimatedLuaSprite('glitchLiquid', 'glitchLiquid', -80, -50)
	setScrollFactor('glitchLiquid',0,0);
	scaleObject('glitchLiquid', 1.2, 1.2);
	addAnimationByPrefix('glitchLiquid', 'glitchLiquid', 'glitchLiquid', 24, true)
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.001, 'elasticOut')
	setBlendMode('glitchLiquid','multiply')
	addLuaSprite('glitchLiquid', true);
	
	makeAnimatedLuaSprite('glitchSlide', 'glitchSlide', -80, -50)
	setScrollFactor('glitchSlide',0,0);
	scaleObject('glitchSlide', 1.2, 1.2);
	addAnimationByPrefix('glitchSlide', 'glitchSlide', 'glitchSlide', 24, true)
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	setBlendMode('glitchSlide','multiply')
	addLuaSprite('glitchSlide', true);
	
	makeAnimatedLuaSprite('glitchStrip', 'glitchStrip', -80, -50)
	setScrollFactor('glitchStrip',0,0);
	scaleObject('glitchStrip', 1.2, 1.2);
	addAnimationByPrefix('glitchStrip', 'glitchStrip', 'glitchStrip', 24, true)
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001)
	setBlendMode('glitchStrip','multiply')
	addLuaSprite('glitchStrip', true);
	
	doTweenZoom('camZoom', 'camGame', origZoom,.001)
	
	
	doTweenAlpha("WaterFilterA","WaterFilter",0,.01)
	doTweenAlpha("WaterRayA","WaterRay",0,.01)
	doTweenAlpha("WaterSurfaceA","WaterSurface",0,.001)

	doTweenAlpha("FlameL_RedA","FlameL_Red",0,.01)
	doTweenAlpha("FlameR_RedA","FlameR_Red",.0,.01)

	makeLuaSprite('whiteSolid','whiteSolid',-100,-100);
	setScrollFactor('whiteSolid', 0, 0);
	scaleObject('whiteSolid', 1.2,1.2);
	addLuaSprite('whiteSolid', true);
	doTweenAlpha('whiteSolidA', 'whiteSolid', 0, 0.001)
	setObjectCamera('whiteSolid', 'other')
	
	makeAnimatedLuaSprite('BrokenGlassFX', 'BrokenGlassFX',-100, -50)
	setScrollFactor('BrokenGlassFX',0,0);
	scaleObject('BrokenGlassFX', 1.2,1.2);
	addAnimationByPrefix('BrokenGlassFX', 'Idle', 'Idle', 24, false)
	addAnimationByPrefix('BrokenGlassFX', 'Break', 'Break', 24, false)
	addLuaSprite('BrokenGlassFX', true);
	objectPlayAnimation('BrokenGlassFX','Idle',true)
	doTweenAlpha('BrokenGlassFXA', 'BrokenGlassFX', 0, 0.001)
	
	
	makeAnimatedLuaSprite('Sparkle2', 'Sparkle', 535,245)
	setScrollFactor('Sparkle2', .7, .7);
	addAnimationByPrefix('Sparkle2', 'Sparkle', 'Sparkle',36, true)
	addLuaSprite('Sparkle2', true);
	doTweenColor('SparkleCs2', 'Sparkle2', 'C22EFF', 0.00001, 'linear')
	setBlendMode('Sparkle2','add')
	
	doTweenAlpha('Sparkle2Alpha', 'Sparkle2', 0, 0.001)
	doTweenAlpha('Sparkle1Alpha', 'Sparkle', 0, 0.001)

	


	setObjectCamera('BrokenGlassFX', 'other')

	setProperty('isPlayRisePurpleFX',false)
	setProperty('isPlayRiseBlueFX',false)

	doTweenAlpha("whiteFadeA","whiteFade",0,0.1,"smootherStepInOut")

	
	makeAnimatedLuaSprite('eyes', 'eyes', 300, 190)
	addAnimationByPrefix('eyes', 'eyes off', 'eyes off', 24, false)
	addAnimationByPrefix('eyes', 'eyes on', 'eyes on', 24, true)
	setScrollFactor('eyes', 1, 1);
	addLuaSprite('eyes', true);
	scaleObject('eyes', 1.1, 1.1);

	

	
	makeAnimatedLuaSprite('eyes2', 'eyes', 300, 190)
	addAnimationByPrefix('eyes2', 'eyes off', 'eyes off', 24, false)
	addAnimationByPrefix('eyes2', 'eyes on', 'eyes on', 24, true)
	setScrollFactor('eyes2', 1, 1);
	addLuaSprite('eyes2', true);
	scaleObject('eyes2', 1.1, 1.1);
	setBlendMode('eyes2','add')
	

	objectPlayAnimation('eyes','eyes on',false)
	objectPlayAnimation('eyes2','eyes on',false)
	doTweenAlpha("eyesAD","eyes",0,0.01,"smootherStepInOut")
	doTweenColor('eyes2C', 'eyes2', 'FF4FF6',.00001, 'cubeIn')
	doTweenAlpha("eyes2AF","eyes2",0,0.01,"smootherStepInOut")
	
	doTweenAlpha("fish1A","fish1",0,0.01,"smootherStepInOut")
	doTweenAlpha("fish2A","fish2",0,0.01,"smootherStepInOut")
	doTweenAlpha("fish3A","fish3",0,0.01,"smootherStepInOut")

	
	makeLuaSprite('BlackEdge720AAA','BlackEdge720',0,0);
	setScrollFactor('BlackEdge720AAA', 0, 0);
	addLuaSprite('BlackEdge720AAA', true);
	doTweenAlpha('BlackEdge720AAAA', 'BlackEdge720AAA', 0.1, 0.001)
	setObjectCamera('BlackEdge720AAA', 'other')

end



function onBeatHit()


			if curBeat%13==0 then
					doTweenX('fish1_1','fish1',1500,0.001,'linear')
					doTweenX('fish1_2','fish1',-500,secPerBeat*4,'linear')
				end

			if curBeat%32 == 0 then
					doTweenX('fish3_1','fish3',1500,0.001,'linear')
					doTweenX('fish3_2','fish3',-1500,secPerBeat*3,'linear')
				end

			if curBeat%12 == 0 then
					doTweenX('fish2_1','fish2',-1000,0.001,'linear')
					doTweenX('fish2_2','fish2',1500,secPerBeat*3,'linear')
			end

			if curBeat%4 == 0 then
					if isWhiteFadeOn then
					doTweenAlpha("whiteFadeA","whiteFade",1,secPerBeat*2,"smootherStepInOut")
					end

					for i = 0,3 do
					noteTweenAlpha(i.."NoteAlphaTween", i, opponentArrowFadeAmount-0.2, secPerBeat*2, "smootherStepInOut")
					end

					for i = 4,7 do
					noteTweenAlpha(i.."NoteAlphaTween", i, .8, secPerBeat*2, "smootherStepInOut")
					end

					if isEyesFX then
					doTweenAlpha("eyes2A","eyes2",1,0.01,"smootherStepInOut")
					doTweenAlpha("eyes2Aa","eyes2",0,secPerBeat*3.75,"cubeOut")

					doTweenX('eyes2X','eyes2.scale',1.1,.001,'cubeOut')
					doTweenY('eyes2Y','eyes2.scale',1.1,.001,'cubeOut')
					
					doTweenX('eyes2X1','eyes2.scale',1.25,secPerBeat*3.75,'cubeOut')
					doTweenY('eyes2X2','eyes2.scale',1.25,secPerBeat*3.75,'cubeOut')
					
					end
			
				elseif curBeat%4 == 2 then
					if isWhiteFadeOn then
						doTweenAlpha("whiteFadeA","whiteFade",.5,secPerBeat*2,"smootherStepInOut")
					end

					for i = 0,3 do
					noteTweenAlpha(i.."NoteAlphaTween", i, opponentArrowFadeAmount, secPerBeat*2, "smootherStepInOut")
					end

					for i = 4,7 do
					noteTweenAlpha(i.."NoteAlphaTween", i, 1, secPerBeat*2, "smootherStepInOut")
					end

				end

		if curBeat%8 == 0 then
			if isMonsterMoving then
				 doTweenY('MonsterPos', 'monster', monsterOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyeballsP2', 'Eyeballs2', monsterEyeOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyeballsP', 'Eyeballs', monsterEyeOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP', 'Eyesocket', monsterEyeOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenAlpha("EyeballsA2","Eyeballs2",.7,secPerBeat*4,"smootherStepInOut")

				 
					if isEyesFX then
					doTweenAlpha("eyesAdc","eyes",.7,secPerBeat*4,"smootherStepInOut")
					end
			end
			
			
		elseif curBeat%8 == 4 then
			if isMonsterMoving then
				 doTweenY('MonsterPos', 'monster', monsterOrigPosY+monsterMoveOffset,secPerBeat*4,"linear")
				 doTweenY('EyeballsP2', 'Eyeballs2', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyeballsP', 'Eyeballs', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP', 'Eyesocket', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenAlpha("EyeballsA2","Eyeballs2",.5,secPerBeat*4,"smootherStepInOut")
			end
			 
					if isEyesFX then
					
						doTweenAlpha("eyesAdc","eyes",1,secPerBeat*4,"smootherStepInOut")
					end
		end

		if curBeat%sparkleCD == 0 then
		 if isSparkleOn then
			sparkle2Anim()
			end
		end
		
	
	if curBeat == 12 then
    --setProperty('camHUD.visible', true);  
	
	doTweenAlpha("HUDAlpha","camHUD",1,.5)
	doTweenAlpha("HUDAlpha1","camNoteNormal",1,.5)
	doTweenAlpha("HUDAlpha2","camNoteDark",1,.5)
	doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)
	
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",1,secPerBeat*36)
	end

	if curBeat == 40 then
	
	objectPlayAnimation('Eyeballs','Eyeballs off',true)
	objectPlayAnimation('Eyeballs2','Eyeballs off',true)
	objectPlayAnimation('Eyesocket','Eyesocket off',true)
	end

	if curBeat == 44 then
	doTweenZoom('camZoom', 'camGame', origZoom+.1, secPerBeat*4)
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",1,secPerBeat*4,cubeIn)
	cameraShake('camGame', .006, secPerBeat*4)
	end

	if curBeat == 46 then
	objectPlayAnimation('FlameL_Blue', 'FlameOff', false)
	objectPlayAnimation('FlameR_Blue', 'FlameOff', false)
	objectPlayAnimation('Eyeballs','Eyeballs on',true)
	objectPlayAnimation('Eyeballs2','Eyeballs on',true)
	objectPlayAnimation('Eyesocket','Eyesocket on',true)
	end
	
	if curBeat == 48 then
	objectPlayAnimation('Eyeballs','Eyeballs ding',true)
	objectPlayAnimation('Eyeballs2','Eyeballs ding',true)
	objectPlayAnimation('Eyesocket','Eyesocket ding',true)
	
	doTweenAlpha("Eyeballs2A","Eyeballs2",.6,secPerBeat*2,'cubeOut')
	isWhiteFadeOn = true
	isMonsterMoving = true

	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.4,secPerBeat*16,'cubeOut')
	
	setProperty('isPlayBubbleFX',true)
	
	doTweenAlpha("WhiteFrameA","WhiteFrame",1,.01)
	doTweenAlpha("WhiteFrameA2","WhiteFrame",0,secPerBeat*4,'cubeIn')
	cameraFlash('game', 'ed49ff',.3 ,false)
		
	sparkleAnimStart(3,360,1,secPerBeat*2)
	isSparkleOn = true
	cameraShake('camNoteNormal', .003, secPerBeat*64)
	cameraShake('camNoteDark', .003, secPerBeat*64)
	cameraShake('camNoteWhite', .003, secPerBeat*64)

	
	doTweenAlpha("WaterFilterA","WaterFilter",1,0.01)
	doTweenAlpha("WaterRayA","WaterRay",.8,0.01)
	doTweenAlpha("WaterSurfaceA","WaterSurface",.4,.01)

	
	doTweenAlpha("fish1A","fish1",1,0.01,"smootherStepInOut")
	doTweenAlpha("fish2A","fish2",1,0.01,"smootherStepInOut")
	doTweenAlpha("fish3A","fish3",1,0.01,"smootherStepInOut")

	
	doTweenAlpha("BlackEdge5A","BlackEdge5",.6,secPerBeat*4)

	
	doTweenAlpha('BlackEdge720AAAA', 'BlackEdge720AAA', 0.3, 0.001)
	end


	if curBeat == 104 then
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",1,secPerBeat*16,'cubeOut')
	end

	if curBeat == 112 then
	
		sparkleAnimStart(3,360*2,1,secPerBeat*1.5)
	end

	if curBeat == 136 then
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.6,secPerBeat*16,'cubeOut')
	end

	if curBeat == 144 then
		sparkleAnimStart(3,360,1,secPerBeat*2)
	end

	if curBeat == 376 then
		cameraFlash('game', 'FFFFFF',.7 ,false)
		doTweenAlpha("WaterFilterA","WaterFilter",0,.01)
		doTweenAlpha("WaterRayA","WaterRay",0,.01)
	doTweenAlpha("WaterSurfaceA","WaterSurface",0,.01)
		triggerEvent("Change Character", 'bf', "bf")
		doTweenColor('bfColorTween', 'boyfriend', 'A19DC0', 0.00001, 'linear')
	end
	------------------

	if curBeat == 96 then
	doTweenZoom('camZoom', 'camGame', origZoom+.2, secPerBeat*8)
	end
	
	if curBeat == 140 then
	doTweenZoom('camZoom', 'camGame', origZoom+.15, secPerBeat*4)
	end

	if curBeat == 144 then
	cameraShake('camNoteNormal', .003, secPerBeat*64)
	cameraShake('camNoteDark', .003, secPerBeat*64)
	cameraShake('camNoteWhite', .003, secPerBeat*64)
	end

	if curBeat == 208 then 
	doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat*32)
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.9,secPerBeat*32,'cubeOut')
	cameraShake('camNoteNormal', .004, secPerBeat*32)
	cameraShake('camNoteDark', .004, secPerBeat*32)
	cameraShake('camNoteWhite', .004, secPerBeat*32)
	sparkleAnimStart(3,360,1,secPerBeat*2)
	sparkleCD=4
	end
	
	
	if curBeat == 236 then 
	doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat*16)
	end

	if curBeat == 240 then 
	doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat*32)
	cameraShake('camNoteNormal', .005, secPerBeat*32)
	cameraShake('camNoteDark', .005, secPerBeat*32)
	cameraShake('camNoteWhite', .005, secPerBeat*32)

	end

	if curBeat == 256 then
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",1,secPerBeat*16,'cubeIn')
	doTweenAlpha("BlackEdge4A","BlackEdge4",1,secPerBeat*16,'cubeIn')
	doTweenColor('gfColorTween', 'gf', '000000', secPerBeat*16, 'cubeIn')
	doTweenColor('limuColorTween', 'dad', '000000', secPerBeat*16, 'cubeIn')
	doTweenColor('2-backC', '2-back', darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('monsterC', 'monster',darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('monsterEyeC', 'monsterEye',darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('whiteFadeC', 'whiteFade', darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('2-frontC', '2-front', darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('1_net_left', '1_net_left',darkColor, secPerBeat*16, 'cubeIn')
	doTweenColor('1_net_right', '1_net_right',darkColor, secPerBeat*16, 'cubeIn')
	 doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', secPerBeat*16, 'linear')
	end

	if curBeat == 268 then
	isSparkleOn=false
	doTweenAlpha("FF","Sparkle2",0,secPerBeat*4,'cubeOut')
	doTweenAlpha("FFd","Sparkle",0,secPerBeat*4,'cubeOut')
	end

	if curBeat == 272 then
	opponentArrowFadeAmount=0


	setProperty('isPlayBubbleFX',false)
	
		
	doTweenAlpha("fish1A","fish1",0,0.01,"smootherStepInOut")
	doTweenAlpha("fish2A","fish2",0,0.01,"smootherStepInOut")
	doTweenAlpha("fish3A","fish3",0,0.01,"smootherStepInOut")
	doTweenAlpha("WaterFilterA","WaterFilter",0,secPerBeat*8)
	doTweenAlpha("WaterRayA","WaterRay",0,secPerBeat*8)
	doTweenAlpha("WaterSurfaceA","WaterSurface",0,.001)
	end

	if curBeat == 280 then

	doTweenAlpha("eyesA","eyes",1,secPerBeat,"smootherStepInOut")
	isEyesFX = true
	cameraFlash('game', 'ed49ff',.3 ,false)
	cameraShake('camGame', .01, .3)
	end

	if curBeat ==336 then
	
		setProperty('isPlayRiseBlueFX',true)

	end

	if curBeat ==368 then
	
	isEyesFX = false
	objectPlayAnimation('eyes','eyes off',false)
	objectPlayAnimation('eyes2','eyes off',false)
	end

	if curBeat == 376 then
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",0.6,secPerBeat,'cubeIn')
	doTweenAlpha("BlackEdge4A","BlackEdge4",0,secPerBeat,'cubeIn')
	doTweenColor('gfColorTween', 'gf', 'A19DC0', secPerBeat, 'cubeIn')
	doTweenColor('limuColorTween', 'dad', 'FFFFFF', secPerBeat, 'cubeIn')
	doTweenColor('2-backC', '2-back', 'FFFFFF', secPerBeat, 'cubeIn')
	doTweenColor('monsterC', 'monster','434343', secPerBeat, 'cubeIn')
	doTweenColor('monsterEyeC', 'monsterEye','434343', secPerBeat, 'cubeIn')
	doTweenColor('whiteFadeC', 'whiteFade', 'A01BFF', secPerBeat, 'cubeIn')
	doTweenColor('2-frontC', '2-front', 'FFFFFF', secPerBeat, 'cubeIn')
	doTweenColor('1_net_left', '1_net_left','A19DC0', secPerBeat, 'cubeIn')
	doTweenColor('1_net_right', '1_net_right','A19DC0', secPerBeat, 'cubeIn')
	doTweenColor('bfColorTween', 'boyfriend', 'A19DC0', secPerBeat, 'linear')
	
		opponentArrowFadeAmount=1
	end

	if curBeat == 440 then 
	doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat*32)
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.9,secPerBeat*16,'cubeOut')
	end
	if curBeat == 472 then 
	doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat*32)
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.6,secPerBeat*32,'cubeOut')
	end

	if curBeat == 143 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 144 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.01, 'elasticOut')
	end
	
	if curBeat == 147 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 148 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.01, 'glitchSlide')
	end

	if curBeat == 149 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 150 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.01, 'glitchStrip')
	end
	
	if curBeat == 151 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 152 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.01, 'elasticOut')
	end

	if curBeat == 153 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 154 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 155 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	if curBeat == 157 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 158 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.01, 'elasticOut')
	end



	if curBeat == 161 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 162 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	if curBeat == 167 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end

	if curBeat == 168 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	end

	if curBeat == 175 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 176 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end

	
	if curBeat == 360 then
	doTweenAlpha('whiteSolidA', 'whiteSolid',1,  secPerBeat*12,'cubeIn')
	end

	if curBeat == 374 then
	doTweenAlpha('whiteSolidA', 'whiteSolid',0,  0.001,'cubeOut')
	doTweenAlpha('BrokenGlassFXA', 'BrokenGlassFX', 1, 0.001)
	cameraShake('other', .015,  secPerBeat*2)
	playSound("glassBreak1",1, "glassBreak1")
	end

	if curBeat == 376 then
		objectPlayAnimation('BrokenGlassFX','Break',true)
		objectPlayAnimation('FlameL_Blue', 'FlameOn', true)
		objectPlayAnimation('FlameR_Blue', 'FlameOn', true)
		playSound("glassBreak2",1, "glassBreak2")
		cameraShake('other', .015, .3)
		doTweenAlpha('BrokenGlassFXA', 'BrokenGlassFX', 0,secPerBeat*4)
		setProperty('isPlayRisePurpleFX',true)
		setProperty('isPlayRiseBlueFX',false)
		
	cameraShake('camNoteNormal', .0025, secPerBeat*64)
	cameraShake('camNoteDark', .0025, secPerBeat*64)
	cameraShake('camNoteWhite', .0025, secPerBeat*64)
	
	isSparkleOn=true
	doTweenAlpha("FF","Sparkle2",1,secPerBeat*4,'cubeOut')
	doTweenAlpha("FFd","Sparkle",1,secPerBeat*4,'cubeOut')
	sparkleAnimStart(3,360*2,1,secPerBeat*1.5)
	sparkleCD = 8
	sparkle2Anim()
	 doTweenColor('dadColorTween', 'dad', 'A19DC0', 0.0001, 'linear')
	 
	doTweenAlpha('BlackEdge720AAAA', 'BlackEdge720AAA', 0.1, 0.001)
	end

	if curBeat == 377 then
		objectPlayAnimation('FlameL_Blue', 'FlameNormal', true)
		objectPlayAnimation('FlameR_Blue', 'FlameNormal', true)
	end





	if curBeat == 440 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	
	cameraShake('camNoteNormal', .0035, secPerBeat*32)
	cameraShake('camNoteDark', .0035, secPerBeat*32)
	cameraShake('camNoteWhite', .0035, secPerBeat*32)

	sparkleAnimStart(3,360*2,1,secPerBeat*1.5)
	sparkleCD = 4
	end
	
	if curBeat == 441 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.001, 'elasticOut')
	end

	if curBeat == 443 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 444 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	end

	
	if curBeat == 445 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 446 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 447 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end

	
	if curBeat == 449 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 450 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	
	if curBeat == 452 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', fxAlpha, 0.001, 'glitchSlide')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 453 then
	doTweenAlpha('glitchSlideA', 'glitchSlide', 0, 0.001, 'glitchSlide')
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	if curBeat == 454 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	if curBeat == 458 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 459 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.001, 'elasticOut')
	end
	

	if curBeat == 463 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 464 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	if curBeat == 465 then
	doTweenAlpha('glitchStripA', 'glitchStrip', fxAlpha, 0.001, 'glitchStrip')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 466 then
	doTweenAlpha('glitchStripA', 'glitchStrip', 0, 0.001, 'glitchStrip')
	end
	
	if curBeat == 471 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', fxAlpha, 0.001, 'elasticOut')
	cameraShake('camGame', .01, secPerBeat)
	end
	
	if curBeat == 472 then
	doTweenAlpha('glitchLiquidA', 'glitchLiquid', 0, 0.001, 'elasticOut')
	
	cameraShake('camNoteNormal', .0055, secPerBeat*32)
	cameraShake('camNoteDark', .0055, secPerBeat*32)
	cameraShake('camNoteWhite', .0055, secPerBeat*32)
	end

	if curBeat == 504 then
	
	cameraShake('camNoteNormal', .004, secPerBeat*32)
	cameraShake('camNoteDark', .004, secPerBeat*32)
	cameraShake('camNoteWhite', .0034, secPerBeat*32)

	isSparkleOn=false
	sparkle2Anim();
	sparkleAnimStart(3,360*2,1,secPerBeat*1.5)
	

	doTweenX('SparkleX','Sparkle.scale',0,secPerBeat*32,'cubeOut')
	doTweenY('SparkleY','Sparkle.scale',0,secPerBeat*32,'cubeOut')

	doTweenAlpha('SparkleA','Sparkle',0,secPerBeat*32,'cubeOut')

	
	doTweenColor('EyeballsC', 'Eyeballs', '303030', secPerBeat*32, 'cubeOut')
	doTweenColor('EyeballsC', 'Eyeballs2', '303030',secPerBeat*32, 'cubeOut')
	doTweenColor('EyesocketC', 'Eyesocket', '303030', secPerBeat*32, 'cubeOut')
	end

	if curBeat == 527 then
		isMonsterMoving = false
		doTweenY('MonsterPosA', 'monster', monsterOrigPosY,0.01,"cubeIn")
		doTweenY('EyeballsPA', 'Eyeballs', monsterEyeOrigPosY,0.01,"cubeIn")
		doTweenY('EyeballsP2A', 'Eyeballs2', monsterEyeOrigPosY,0.01,"cubeIn")
		doTweenY('EyesocketDPA', 'Eyesocket', monsterEyeOrigPosY,0.01,"cubeIn")

	end

	if curBeat == 528 then
		doTweenY('MonsterPosA', 'monster', monsterOrigPosY+650,secPerBeat*32,"cubeIn")
		doTweenY('EyeballsPA', 'Eyeballs', monsterEyeOrigPosY+650,secPerBeat*32,"cubeIn")
		doTweenY('EyeballsP2A', 'Eyeballs2', monsterEyeOrigPosY+650,secPerBeat*32,"cubeIn")
		doTweenY('EyesocketDPA', 'Eyesocket', monsterEyeOrigPosY+650,secPerBeat*32,"cubeIn")
		cameraShake('game', .0055, secPerBeat*32)
		cameraShake('hud', .0055, secPerBeat*32)
		playSound('earthcrake',.4,'earthcrake')
	end

	if curBeat == 536 then
	isWhiteFadeOn = false
	setProperty('isPlayRisePurpleFX',false)
	doTweenAlpha("WhiteFrameA","whiteFade",0,secPerBeat*32)
	doTweenAlpha('SparkleA','Sparkle',0,secPerBeat*32,'cubeOut')
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",0,secPerBeat*32,'cubeOut')
	doTweenAlpha("FlameL_RedA","FlameL_Red",1,.01)
	doTweenAlpha("FlameR_RedA","FlameR_Red",1,.01)
	doTweenAlpha("FlameL_BlueA","FlameL_Blue",0,secPerBeat*32,'cubeOut')
	doTweenAlpha("FlameR_BlueA","FlameR_Blue",0,secPerBeat*32,'cubeOut')
	objectPlayAnimation('FlameL_Red', 'FlameNormal', true)
	objectPlayAnimation('FlameR_Red', 'FlameNormal', true)
	objectPlayAnimation('FlameL_Blue', 'FlameNormal', true)
	objectPlayAnimation('FlameR_Blue', 'FlameNormal', true)
	cameraShake('camNoteNormal', .003, secPerBeat*32)
	cameraShake('camNoteDark', .003, secPerBeat*32)
	cameraShake('camNoteWhite', .003, secPerBeat*32)
	end

	if curBeat == 568 then
	objectPlayAnimation('FlameL_Red', 'FlameOff', true)
	objectPlayAnimation('FlameR_Red', 'FlameOff', true)
	objectPlayAnimation('FlameL_Blue', 'FlameOff', true)
	objectPlayAnimation('FlameR_Blue', 'FlameOff', true)
	doTweenAlpha("BlackEdgeAlpha","BlackEdge",.9,secPerBeat*4,'cubeOut')
	
	doTweenAlpha('BlackEdge720AAAA', 'BlackEdge720AAA', 0.3, secPerBeat*4)
	end

	if curBeat == 572 then
	
	setBlur(35,secPerBeat*4)
	doTweenAlpha("HUDAlpha","camHUD",0,secPerBeat*4)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,secPerBeat*4)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,secPerBeat*4)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,secPerBeat*4)
	end



end

function onStepHit()


end


function onUpdate(elapsed)
	updateTweenBlur(elapsed)
	--noteTweenX("note0X",0, defaultOpponentStrumX0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
	--noteTweenX("note0Y",0, defaultOpponentStrumY0 +5 * math.cos((curBeat+0) * math.pi),0.00001)


	if curBeat >= 272 and curBeat <= 372 then
		doTweenZoom('camZoom', 'camGame', origZoom+.25, secPerBeat)
	end

end

function setBlur(targetBlurAmount,elapsedTime)
	blurCurrentTimer = 0

	blurTargetAmount = targetBlurAmount

	blurTargetTimer = elapsedTime

	blurTemp = blurCurrentAmount

end

function updateTweenBlur(elapsed)

	blurCurrentTimer = blurCurrentTimer + elapsed
	
	progess = blurCurrentTimer/blurTargetTimer
	
	if progess > 1 then 
		progess = 1
	end
	
	scaler = progess*progess*progess
	
	if blurCurrentAmount > blurTargetAmount then
		scaler = 1 - scaler
		else
		blurTemp = blurTargetAmount
	end
	
	if scaler<1 then
		blurCurrentAmount = blurTemp*scaler
	end

	--debugPrint(blurCurrentAmount)
	
	setProperty("BlurX", blurCurrentAmount)
	setProperty("BlurY", blurCurrentAmount)

	
end

function sparkleAnimStart(size,angle,alpha,duration)
	finishDuration = duration/2

	doTweenX('SparkleX','Sparkle.scale',size,finishDuration,'cubeIn')
	doTweenY('SparkleY','Sparkle.scale',size,finishDuration,'cubeIn')

	doTweenAngle('SparkleAN','Sparkle',angle,duration,'linear')
	doTweenAlpha('SparkleA','Sparkle',alpha,finishDuration,'cubeIn')
end

function sparkleAnimEnd()
	doTweenX('SparkleX2','Sparkle.scale',sparkleOrigSize,finishDuration,'cubeOut')
	doTweenY('SparkleY2','Sparkle.scale',sparkleOrigSize,finishDuration,'cubeOut')

	doTweenAlpha('SparkleA2','Sparkle',sparkleOrigAlpha,finishDuration,'cubeOut')
end

function onTweenCompleted(tag)
	if tag == 'SparkleX' then
		sparkleAnimEnd()
	end
end

function sparkle2Anim()
	doTweenX('AA','Sparkle2.scale',1,.001,'expoOut')
	doTweenY('BB','Sparkle2.scale',1,.001,'expoOut')
	doTweenX('CC','Sparkle2.scale',4,secPerBeat*4,'expoOut')
	doTweenY('DD','Sparkle2.scale',4,secPerBeat*4,'expoOut')
	doTweenAlpha("EE","Sparkle2",.7,.01,'cubeOut')
	doTweenAlpha("FF","Sparkle2",0,secPerBeat*4,'cubeOut')
end

