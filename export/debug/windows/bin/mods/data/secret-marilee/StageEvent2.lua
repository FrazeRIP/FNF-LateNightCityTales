
secPerBeat=0

frameChange = true

minFrameTransparency = 0.2
maxFrameTransparency = 0.4
---------------------------------
blurTargetAmount = 0
blurCurrentAmount = 0

blurTargetTimer = 0
blurCurrentTimer = 0

blurTemp =10

blurLoop1 = false
blurLoop2 = false

isWhiteFadeOn = false


isBlinking  = false

----------------
monsterOrigPosY = 0
monsterEyeOrigPosY = 270

isMonsterMoving = false
monsterMoveOffset = 10
---------------

sparkleOrigSize = 1

sparkleOrigAlpha = .8

sparkleOrigAngle = 0

finishDuration = 0
-----

isFinished = false

function onCreate()
	setProperty("skipCountdown", true)
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end

--Begin
function onCreatePost()

	doTweenColor('bfColorTween', 'boyfriend', 'C1BDE0', 0.1, 'linear')
	doTweenColor('dadColorTween', 'dad', 'C1BDE0', 0.1, 'linear')
	doTweenColor('gfColorTween', 'gf', 'C1BDE0', 0.1, 'linear')

	setProperty("BlurX", 10)
	setProperty("BlurY", 10)
	blurCurrentAmount = 10
	blurTargetAmount = 10
	setBlur(0,1)
	secPerBeat = 60/curBpm

	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setGlow('normal','9F41CC',1,32,3)
	setGlow('special','9F41CC',1,36,4)
	
	makeLuaSprite('statueGF','statueGF',600,270);
	setScrollFactor('statueGF', 1, 1);
	addLuaSprite('statueGF',false);
	doTweenColor('statueGFC','statueGF','4A4A4A',0.00001)
	doTweenAlpha("statueGFA","statueGF",0,0.001)
	
	makeLuaSprite('BlackEdge2','BlackEdge',-250,-100);
	setScrollFactor('BlackEdge2', 1, 1);
	addLuaSprite('BlackEdge2',false);
	doTweenAlpha("BlackEdge2A","BlackEdge2",0.5,0.00001)
	
	doTweenColor('monsterC','monster','171717',0.01)
	doTweenColor('monsterEyeC','monsterEye','171717',0.01)

	doTweenY('MonsterPos', 'monster', monsterOrigPosY+650,0.01,"linear")
	doTweenY('EyeballsPos', 'Eyeballs', monsterEyeOrigPosY+650,0.01,"linear")
	doTweenY('EyesocketPos', 'Eyesocket', monsterEyeOrigPosY+650,0.01,"linear")
	
	doTweenColor('whiteFade', 'whiteFade', '56D2E6', 0.00001, 'linear')

	doTweenAlpha("whiteFadeA","whiteFade",0,.001,"smootherStepInOut")

	setProperty('isPlayRiseBlueFX',false)

	
	makeLuaSprite('DarkSolidD2', 'DarkSolid', -100, -100);
	setScrollFactor('DarkSolidD2', 0, 0);
	scaleObject('DarkSolidD2', 1.2, 1.2);
	setObjectCamera('DarkSolidD2','game')
	addLuaSprite('DarkSolidD2', true);

	triggerEvent("Change Character", 'bf', "bf-scare")
	triggerEvent("Change Character", 'bf', "bf")
	triggerEvent("Change Character", 'dad', "limulady3")
	triggerEvent("Change Character", 'dad', "limulady2")
	doTweenColor('bfColorTween', 'boyfriend', 'C1BDE0', 0.1, 'linear')
	
	doTweenColor('dadColorTween', 'dad', 'C1BDE0', 0.1, 'linear')
	doTweenAlpha('DF3', 'DarkSolidD2', 0,secPerBeat ,'cubeOut')
	
end


--SetpHit
function onStepHit()

	changeFrameTransparency()
	if curBeat == 96 then
		setProperty('gf.visible', false)
	end

	if mustHitSection == true then
		triggerEvent("Change Character", 2, "gf-right")
		characterDance("gf")
	else 
		triggerEvent("Change Character", 2, "gf-left")
		characterDance("gf")
	end
	
	doTweenColor('gfColorTween', 'gf', 'A19DC0', 0.1, 'linear')

	if curStep == 2 and not isFinished then
	
	--doTweenAlpha("dialogueBackA3","camDialogBack",0,.2,'cubeOut')
	--doTweenAlpha("dialogueA3","camDialog",0,.2,'cubeOut')
	end

end


function onUpdate(elapsed)
	updateTweenBlur(elapsed)
	--noteTweenX("note0X",0, defaultOpponentStrumX0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
	--noteTweenX("note0Y",0, defaultOpponentStrumY0 +5 * math.cos((curBeat+0) * math.pi),0.00001)


end

function onBeatHit()


		if curBeat%8 == 0 then
			--doTweenAlpha("whiteFadeA","whiteFade",1,secPerBeat*4,"smootherStepInOut")
			if isMonsterMoving then
				 doTweenY('MonsterPos', 'monster', monsterOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyeballsP', 'Eyeballs', monsterEyeOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP', 'Eyesocket', monsterEyeOrigPosY-monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP2', 'Eyeballs2', monsterEyeOrigPosY-monsterMoveOffset-1,secPerBeat*4,"cubeOut")
				doTweenAlpha("EyeballsA2","Eyeballs2",0,secPerBeat*4,"smootherStepInOut")
				doTweenAlpha("whiteFadeA","whiteFade",0,secPerBeat*4,"smootherStepInOut")
			end
			
		elseif curBeat%8 == 4 then
			if isMonsterMoving then
				 doTweenY('MonsterPos', 'monster', monsterOrigPosY+monsterMoveOffset,secPerBeat*4,"linear")
				 doTweenY('EyeballsP', 'Eyeballs', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP', 'Eyesocket', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*4,"cubeOut")
				 doTweenY('EyesocketP2', 'Eyeballs2', monsterEyeOrigPosY+monsterMoveOffset+1,secPerBeat*4,"cubeOut")
				doTweenAlpha("EyeballsA2","Eyeballs2",.4,secPerBeat*4,"smootherStepInOut")
				doTweenAlpha("whiteFadeA","whiteFade",.5,secPerBeat*4,"smootherStepInOut")
			end
		end

		if isBlinking then

			if curBeat % 32 == 30 then
		
				objectPlayAnimation('Eyesocket','Eyesocket on')
				objectPlayAnimation('Eyeballs', 'Eyeballs on', false)
				objectPlayAnimation('Eyeballs2', 'Eyeballs on', false)

			else if curBeat %32 == 0 then
		
				objectPlayAnimation('Eyesocket','Eyesocket ding')
				objectPlayAnimation('Eyeballs', 'Eyeballs ding')
				objectPlayAnimation('Eyeballs2', 'Eyeballs ding')
			end
		end


		if curBeat%8 == 0 then
			for i = 0,7 do
				noteTweenAlpha(i.."NoteAlphaTween", i, .7, secPerBeat*4, "smootherStepInOut")
					if isWhiteFadeOn then
						doTweenAlpha("whiteFadeA","whiteFade",1,secPerBeat*2,"smootherStepInOut")
					end
			end
		elseif curBeat%8 == 4 then
			for i = 0,7 do
			noteTweenAlpha(i.."NoteAlphaTween", i, 1, secPerBeat*4, "smootherStepInOut")
			end
					if isWhiteFadeOn then
						doTweenAlpha("whiteFadeA","whiteFade",.5,secPerBeat*2,"smootherStepInOut")
					end
			end
		end
	
	if blurLoop1 then 
		if curBeat%32 == 31 then
			setBlur(0,secPerBeat)
		elseif curBeat%32 == 28 then
			setBlur(15,secPerBeat*3)
		elseif curBeat%32 == 29 then
			cameraShake('game', .0035, secPerBeat*3)
			cameraShake('hud', .0035, secPerBeat*3)
			playSound('earthcrakeShort',.4,'earthcrakeShort')
		end
	end
	
	if blurLoop2 then 
		if curBeat%8 == 0 then
			setBlur(5,secPerBeat*4)
		elseif curBeat%8 == 4 then
			setBlur(0,secPerBeat*4)
		end
	end


	if curBeat == 30 then
    --setProperty('camHUD.visible', true);  
	
	doTweenAlpha("HUDAlpha","camHUD",1,.5)
	doTweenAlpha("HUDAlpha1","camNoteNormal",1,.5)
	doTweenAlpha("HUDAlpha2","camNoteDark",1,.5)
	doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)
	end


	if curBeat == 40 then
	
		minFrameTransparency = 0.3
		maxFrameTransparency = 0.6

	end

	if curBeat ==64 then
	
		minFrameTransparency = 0.5
		maxFrameTransparency = 0.7
	end
	

	if curBeat == 80 then

		doTweenY('MonsterPos', 'monster', monsterOrigPosY,secPerBeat*16,"linear")
		 doTweenY('EyeballsP', 'Eyeballs', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*16,"cubeOut")
		doTweenY('EyesocketP', 'Eyesocket', monsterEyeOrigPosY+monsterMoveOffset,secPerBeat*16,"cubeOut")
			cameraShake('game', .005, secPerBeat*18)
			cameraShake('hud', .005, secPerBeat*18)
		playSound('earthcrake',.4,'earthcrake')
	end

	if curBeat ==88 then
	
		minFrameTransparency = 0.7
		maxFrameTransparency = 0.9

	
		setBlur(10,secPerBeat*(95-88))
		

	end
	

	if curBeat ==95 then
		frameChange = false
		doTweenAlpha("FrameTransparency", 'BlackEdge', 1, 0.3, 'linear')
			cameraShake('game', .0035, secPerBeat*3)
			cameraShake('hud', .0035, secPerBeat*3)
	end

	if curBeat == 96 then
		triggerEvent('Toggle Trail','1','1')

		isMonsterMoving=true
		isWhiteFadeOn = true
		
		setProperty('isPlayRiseBlueFX',true)
		
		setGlow('normal','45BED1',1,32,3)
		setGlow('special','AD4ED9',1,36,4)
		
		frameChange = true
		minFrameTransparency = 0.8
		maxFrameTransparency = 1
		
		doTweenAlpha("FlameLAlpha","FlameR_Red",0,secPerBeat*4)
		doTweenAlpha("FlameRAlpha","FlameL_Red",0,secPerBeat*4)

		objectPlayAnimation('FlameL_Red', 'FlameOn', false)
		objectPlayAnimation('FlameR_Red', 'FlameOn', false)
		objectPlayAnimation('FlameL_Blue', 'FlameOn', false)
		objectPlayAnimation('FlameR_Blue', 'FlameOn', false)
		playSound("fire",.6, "fire")
		setBlur(0,.7)
		
		triggerEvent("Change Character", 'dad', "limulady3")
	doTweenColor('dadColorTween', 'dad', 'C1BDE0', 0.1, 'linear')
		doTweenColor('bgC', '2-back', '9D9D9D', secPerBeat*4, 'linear')

		triggerEvent("Change Character", 'bf', "bf-scare")
		doTweenColor('bfColorTween', 'boyfriend', 'C1BDE0', 0.1, 'linear')

		cameraFlash('game', 'ed49ff',.3 ,false)
		cameraShake('hud', .008, .3)
		cameraShake('game', .008, .3)
		doTweenAlpha("WhiteFrameA","WhiteFrame",1,.01)
		doTweenAlpha("WhiteFrameA2","WhiteFrame",0,secPerBeat*4,'cubeIn')

		isBlinking = true

		
	doTweenAlpha('SparkleA2','Sparkle',1,.001,'cubeIn')
	doTweenX('SparkleX','Sparkle.scale',4,secPerBeat*2,'linear')
	doTweenY('SparkleY','Sparkle.scale',4,secPerBeat*2,'linear')

	doTweenAngle('SparkleAN','Sparkle',360,secPerBeat*2,'cubeIn')
	doTweenAlpha('SparkleA','Sparkle',0,secPerBeat*3,'cubeOut')
	end
	
	if curBeat == 98 then
		objectPlayAnimation('FlameL_Red', 'FlameNormal', false)
		objectPlayAnimation('FlameR_Red', 'FlameNormal', false)
		objectPlayAnimation('FlameL_Blue', 'FlameNormal', false)
		objectPlayAnimation('FlameR_Blue', 'FlameNormal', false)
	end


	if curBeat==100 then
		blurLoop1=true
	end

	if curBeat == 114 then

	end

	if curBeat == 224 then
		blurLoop1 = false
		blurLoop2 = true

	end

	if curBeat == 288 then
		blurLoop2 = false
		setBlur(0,.7)
	end


	if curBeat == 349 then
		isBlinking = false
		isMonsterMoving = false
	end

	if curBeat == 348 then
	
				objectPlayAnimation('Eyesocket','Eyesocket off')
				objectPlayAnimation('Eyeballs', 'Eyeballs off')
				objectPlayAnimation('Eyeballs2', 'Eyeballs off')

				doTweenColor('monsterC','monster','000000',secPerBeat*4,'cubeIn')
				doTweenColor('EyesocketC','Eyesocket','000000',secPerBeat*4,'cubeIn')
				doTweenColor('EyeballsC','Eyeballs','000000',secPerBeat*4,'cubeIn')
				doTweenColor('EyeballsC2','Eyeballs2','000000',secPerBeat*4,'cubeIn')
	end

	if curBeat == 352 then
		blurLoop2 = false
		blurLoop1 = false
		
		setGlow('normal','9F41CC',1,32,3)
		setGlow('special','752E96',1,36,4)
		
		cameraFlash('game', 'ed49ff',.4 ,false)
		cameraShake('hud', .008, .3)
		cameraShake('game', .008, .3)
		doTweenAlpha("WhiteFrameA","WhiteFrame",1,.01)
		doTweenAlpha("WhiteFrameA2","WhiteFrame",0,secPerBeat*4,'cubeIn')

		minFrameTransparency = 0.4
		maxFrameTransparency = 0.6
		triggerEvent('Toggle Trail','0','0')
		
		doTweenAlpha("FlameLAlpha","FlameR_Red",1,secPerBeat*4)
		doTweenAlpha("FlameRAlpha","FlameL_Red",1,secPerBeat*4)

		objectPlayAnimation('FlameL_Red', 'FlameOn', false)
		objectPlayAnimation('FlameR_Red', 'FlameOn', false)
		objectPlayAnimation('FlameL_Blue', 'FlameOn', false)
		objectPlayAnimation('FlameR_Blue', 'FlameOn', false)
		playSound("fire",.4, "fire")
		triggerEvent("Change Character", 'dad', "limulady2")
	doTweenColor('dadColorTween', 'dad', 'C1BDE0', 0.1, 'linear')
		
		doTweenColor('bgC', '2-back', 'FFFFFF', secPerBeat*4, 'linear')
		
		triggerEvent("Change Character", 'bf', "bf")
		doTweenColor('bfColorTween', 'boyfriend', 'C1BDE0', 0.1, 'linear')

		
		isMonsterMoving=false
		isWhiteFadeOn = false
		doTweenAlpha("WhiteFrameA","WhiteFrame",1,.01)
		doTweenAlpha("WhiteFrameA2","WhiteFrame",0,secPerBeat*4,'cubeIn')
		setProperty('isPlayRiseBlueFX',false)
		doTweenAlpha("monsterA","monster",0,0.00001)
		doTweenAlpha("monsterEyeA","Eyeballs",0,0.00001)
		doTweenAlpha("monsterEyeA2","Eyeballs2",0,0.00001)
		doTweenAlpha("monsterEyeA3","Eyesocket",0,0.00001)
		
	doTweenAlpha("statueGFA","statueGF",1,0.001)
		
	end
	
	if curBeat == 354 then
		objectPlayAnimation('FlameL_Red', 'FlameNormal', true)
		objectPlayAnimation('FlameR_Red', 'FlameNormal', true)
		objectPlayAnimation('FlameL_Blue', 'FlameNormal', true)
		objectPlayAnimation('FlameR_Blue', 'FlameNormal', false)
	end

	if curBeat == 390 then
		frameChange = false
		doTweenAlpha("FrameTransparency", 'BlackEdge', .4, 0.5, 'linear')

		doTweenAlpha("HUDAlpha","camHUD",0,1)
		doTweenAlpha("HUDAlpha1","camNoteNormal",0,1)
		doTweenAlpha("HUDAlpha2","camNoteDark",0,1)
		doTweenAlpha("HUDAlpha3","camNoteWhite",0,1)
		setBlur(100,2);
		isFinished = true
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



function changeFrameTransparency()
	if frameChange == true then
		doTweenAlpha("FrameTransparency", 'BlackEdge', getRandomFloat(minFrameTransparency,maxFrameTransparency), 0.05, 'linear')
	end
end