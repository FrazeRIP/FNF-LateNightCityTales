local keepScroll = false

local secPerBeat

local noteBlinKFactor = 16

local breathDark = true

local zoomAmountGame = 1.005
local zoomAmountHUD = 1.005

local zoomDuration 


--------------------
-----------------------
local caAmount = 1.25;
local caFactor = 1;

local glitchAmount = 5;
local glitchFactor = 15;


local autoPeriodCA = 4
local autoPeriodGlitch = 16
----------------------
local isAutoCA = true
local isAutoGlitch = true
local isAutoCamZoom = true

local isShadowOn = false
local isSpeaking = false
----------------------
local currentIdleAnimType = 'LimuDefaultIdle'


------------------------------
waveTargetAmount = 0
waveCurrentAmount = 0

waveTargetTimer = 0
waveCurrentTimer = 0

waveTemp =10
--------------------

function onCreate()

	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
	
	setProperty("skipCountdown", true)

	setProperty('gf.visible', false)
	setProperty('lockDadAnim', true);
	setProperty('health', 2);



end

function onCreatePost( ... )
	setProperty('gf.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('dad.visible', false)

	secPerBeat = 60/curBpm
	zoomDuration = secPerBeat

	setGlow('normal','D119FF',1,32,3)
	setGlow('special','D119FF',1,36,4)
	
	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setWave(0.03,1)
	
	setCameraZoomAmount(0.01)
	
	setProperty('bloomFactor', 0)
	setProperty('blurFactor', 0)
end


--function onUpdate( elapsed )
--	updateTweenWave(elapsed)
--end


function onStepHit( ... )

	if curStep == 1 then
		camShakeNotes(.001,secPerBeat*32)
		isSpeaking = true
		objectPlayAnimation('LimuH', 'LimuDefaultSpeak', true)
		objectPlayAnimation('LimuH2', 'LimuDefaultSpeak', true)

		
		doTweenAlpha("HUDAlpha","camHUD",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha1","camNoteNormal",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha2","camNoteDark",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)
	end


	if curStep == 16 then
	setTextData(
	--width,size,delay,color
	300,32,0.05,'D119FF')
	createFXText(
	--x,y,angle,content
	500,300,0,"testadsfasdfas dfasdfdsaf asdfasdfsa")
	end
	


		currentFactor = noteBlinKFactor/2

		if curStep% noteBlinKFactor == 0 then
		
			for i = 0,3 do
				noteTweenAlpha(i.."NoteAlphaTween", i, 0,secPerBeat*currentFactor/4, "smootherStepInOut")
			end
			for i = 4,7 do
				noteTweenAlpha(i.."NoteAlphaTween", i, .8, secPerBeat*currentFactor/4, "smootherStepInOut")
			end

		elseif curStep%noteBlinKFactor == currentFactor then
		
			for i = 0,3 do
				noteTweenAlpha(i.."NoteAlphaTween", i, 0,secPerBeat*currentFactor/4, "smootherStepInOut")
			end

			for i = 4,7 do
				noteTweenAlpha(i.."NoteAlphaTween", i, 1, secPerBeat*currentFactor/4, "smootherStepInOut")
			end
		end
end



function onBeatHit()


	if curBeat == 32 then
	setCameraZoomAmount(0.015)
	camShakeNotes(.003,secPerBeat*16)

	end

	if curBeat == 48 then
	setCameraZoomAmount(0.02)
	camShakeNotes(.005,secPerBeat*8)
	end

	if curBeat == 52 then
	
	isAutoCamZoom = false
	doTweenZoom('camgameZ2','camGame', 1.25,secPerBeat*7, 'cubeIn')
	end

	if curBeat == 56 then
	setCameraZoomAmount(0.025)
	camShakeNotes(.008,secPerBeat*4)

	end
	
	if curBeat == 60 then
	cameraShake('hud', .01, secPerBeat*4)
	cameraShake('game', .01, secPerBeat*4)
	camShakeNotes(.01,secPerBeat*4)
	
	setCameraZoomAmount(0)
	isShadowOn = true

	end


	if curBeat == 64 then
	
	isAutoCamZoom = true

	isAutoGlitch = true
	isAutoCA = true

	autoPeriodCA = 1
	caAmount = 1.4
	caFactor = 5


	isSpeaking = false
	doTweenColor('LimuHC', 'LimuH', 'B8B8B8', 0.01, 'linear')

	noteBlinKFactor = 4

	doTweenAlpha("whiteSolidA","whiteSolid",1,.01)
	doTweenAlpha("whiteSolidA2","whiteSolid",0,secPerBeat*8,'cubeOut')

	doTweenAlpha("WaterFilterA","WaterFilter",.5,.01)

	doTweenAlpha("WaterRayA","WaterRay",.5,.01)

	doTweenAlpha("Tentacle2A","Tentacle2",1,.01)

	setProperty('isPlayRisePurpleFX', true)

	cameraShake('game', .015, secPerBeat*2)

	camShakeNotes(.005,secPerBeat*64)
	
	setCameraZoomAmount(0.035)
	end


	if curBeat == 127 then
	switchExpressionEvent()
	end

	if curBeat == 128 then
	isSpeaking = true
	currentIdleAnimType = 'LimuLaughIdle'
	objectPlayAnimation('LimuH','LimuLaughSpeak')
	objectPlayAnimation('LimuH2','LimuLaughSpeak')

	camShakeNotes(.007,secPerBeat*64)
	isAutoCA = false

	isAutoGlitch = true
	autoPeriodGlitch = 3
	glitchAmount = 3;
	glitchFactor = 20;
	end

	if curBeat == 191 then
	switchExpressionEvent()
	end

	if curBeat == 192 then
	currentIdleAnimType = 'LimuAngryIdle'
	objectPlayAnimation('LimuH','LimuAngrySpeak')
	objectPlayAnimation('LimuH2','LimuAngrySpeak')

	cameraShake('game', .015, secPerBeat*4)
	end


	if curBeat == 196 then
	
	currentIdleAnimType = 'LimuLaughIdle'
	objectPlayAnimation('LimuH','LimuLaughIdle')
	objectPlayAnimation('LimuH2','LimuLaughIdle')

	isSpeaking = false

	isAutoCamZoom = true
	camShakeNotes(.005,secPerBeat*64*2)
	
	setCameraZoomAmount(0.015)

	zoomDuration = secPerBeat
	
	doTweenAlpha("WaterFilterA","WaterFilter",.9,secPerBeat*2,'cubeOut')
	doTweenAlpha("WaterRayA","WaterRay",.9,secPerBeat*2,'cubeOut')
	doTweenAlpha("WaterSurfaceA","WaterSurface",0.9,secPerBeat*2,'cubeOut')
	
	
	cameraFlash('game', '000130',secPerBeat*32,false)

	isAutoCA = true
	autoPeriodCA = 4
	autoPeriodGlitch = 16

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	end

	if curBeat == 244 then
	
	doTweenAlpha("WaterFilterA","WaterFilter",.5,secPerBeat*16,'cubeIn')

	doTweenAlpha("WaterRayA","WaterRay",.5,secPerBeat*16,'cubeIn')
	doTweenAlpha("WaterSurfaceA","WaterSurface",0,secPerBeat*16,'cubeIn')
	end

	if curBeat == 259 then
	switchExpressionEvent()
	end

	if curBeat == 260 then
	currentIdleAnimType = 'LimuDefaultIdle'
	objectPlayAnimation('LimuH', 'LimuDefaultIdle', true)
	objectPlayAnimation('LimuH2', 'LimuDefaultIdle', true)

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	autoPeriodCA = 1
	setCameraZoomAmount(0.035)
	end

	if curBeat == 323 then
	switchExpressionEvent()
	end

	if curBeat == 324 then
	isSpeaking = true
	currentIdleAnimType = 'LimuSadIdle'
	objectPlayAnimation('LimuH','LimuSadSpeak')
	objectPlayAnimation('LimuH2','LimuSadSpeak')

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;
	end


	if curBeat == 388 then
	setCameraZoomAmount(0.015)

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;
	autoPeriodGlitch = 4;

	isAutoCA = true
	autoPeriodCA = 4

	zoomDuration = secPerBeat
	camShakeNotes(.003,secPerBeat*64)
	isAutoCamZoom = true
	end

	if curBeat == 451 then
	switchExpressionEvent()
	end

	if curBeat == 452 then
	isSpeaking = true
	currentIdleAnimType = 'LimuAngryIdle'
	objectPlayAnimation('LimuH','LimuAngrySpeak')
	objectPlayAnimation('LimuH2','LimuAngrySpeak')
	
	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	zoomAmountGame = 1.0025
	zoomAmountHUD = 1.004
	camShakeNotes(.005,secPerBeat*64)
	
	autoPeriodCA = 1
	caAmount = 1.4
	caFactor = 5

	setCameraZoomAmount(0.035)
	end

	if curBeat == 516 then
	isSpeaking = false

	zoomAmountGame = 1.035
	zoomAmountHUD = 1.01
	camShakeNotes(.007,secPerBeat*64)
	setCameraZoomAmount(0.045)
	
	glitchAmount = 5;
	glitchFactor = 40;
	autoPeriodGlitch = 1;
	
	autoPeriodCA = 1
	caAmount = 1.6
	caFactor = 7
	end

	if curBeat == 579 then
	switchExpressionEvent()
	end

	if curBeat == 580 then
	isSpeaking = true
	objectPlayAnimation('LimuH','LimuCryIdle')
	objectPlayAnimation('LimuH2','LimuCryIdle')


	isAutoCamZoom = false
	isAutoCA = false
	isAutoGlitch = false

	end

	 
	if curBeat %4 == 0 then

		if isShadowOn then
		LimuShaodwAnim()
		end

		if isSpeaking == false then
		objectPlayAnimation('LimuH', currentIdleAnimType, true)
		objectPlayAnimation('LimuH2', currentIdleAnimType, true)
		end
	end

	if isAutoCamZoom then
		camZoomEvent()
	end

	if curBeat %8 ==0 then
		if breathDark then
			doTweenAlpha("BlackEdgeA","BlackEdge",.6,secPerBeat*4,"smootherStepInOut")
		end

	elseif curBeat % 8 == 4 then
	
		if breathDark then
			doTweenAlpha("BlackEdgeA","BlackEdge",.3,secPerBeat*4,"smootherStepInOut")
		end

	end

	if curBeat % autoPeriodCA == 0 then

		if isAutoCA then
			setCA()
		end
	end
	
	if curBeat % autoPeriodGlitch ==0 then

		if isAutoGlitch then
			setGlitch()
		end

	end

end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if curBeat >= 128 and curBeat <= 192 then
		isAutoCamZoom = false
		isAutoCA = false

		zoomDuration = secPerBeat/4
		camShakeNotes(.007,secPerBeat/4)
		cameraShake('game', .004, secPerBeat/4)
		camZoomEvent()
		setCA()
	end

	if curBeat>=324 and curBeat <=387 then
	
		glitchAmount = 5;
		glitchFactor = 45;
		
		isAutoCamZoom = false
		isAutoCA = false
		isAutoGlitch = false

		zoomDuration = secPerBeat/2
		camShakeNotes(.007,secPerBeat/2)
		cameraShake('game', .004, secPerBeat/2)
		setCA()
		setGlitch()
	end
end



function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end

function camShakeNotes(strength,duration )
	cameraShake('camNoteNormal', strength, duration)
	cameraShake('camNoteDark',  strength, duration)
	cameraShake('camNoteWhite',  strength, duration)
end


function camZoomEvent()

	doTweenZoom('camgameZ1','camGame', zoomAmountGame,zoomDuration/2, 'cubeOut')
	doTweenZoom('camHUDZ1','camHUD', zoomAmountHUD,zoomDuration/2, 'cubeOut')
	doTweenZoom('camNoteNormalZ1','camNoteNormal', zoomAmountHUD,zoomDuration/2, 'cubeOut')
end

function onTweenCompleted ( tag )

	if tag == 'camgameZ1' then
		doTweenZoom('camgameZ2','camGame', 1,zoomDuration/2, 'cubeOut')
		doTweenZoom('camHUDZ2','camHUD', 1,zoomDuration/2, 'cubeOut')
		doTweenZoom('camNoteNormalZ2','camNoteNormal', 1,zoomDuration/2, 'cubeOut')
	end

	if tag == 'LimuH2X' then
		LimuShaodwAnimFinish(secPerBeat*4)
	end
end


function setCameraZoomAmount(amount)
		zoomAmountGame = 1+amount
		zoomAmountHUD = 1+amount/2

end

function LimuShaodwAnimFinish( duration )
	doTweenAlpha("LimuH2A2","LimuH2",0,duration,'cubeOut')
	doTweenX('LimuH2X2','LimuH2.scale',1.2,duration,'cubeOut')
	doTweenY('LimuH2Y2','LimuH2.scale',1.2,duration,'cubeOut')
end


function LimuShaodwAnim()
	doTweenAlpha("LimuH2A","LimuH2",1,.0001)
	doTweenX('LimuH2X','LimuH2.scale',1,0.0001,'cubeIn')
	doTweenY('LimuH2Y','LimuH2.scale',1,0.0001,'cubeIn')
end

function setCA( )
	setProperty('caAmount',caAmount)
	setProperty('caAmountFactor',caFactor)
end

function setGlitch()
	setProperty('glitchAmount',glitchAmount)
	setProperty('glitchFactor',glitchFactor)
end

function switchExpressionEvent()
	isAutoGlitch = false
	glitchAmount = 25;
	glitchFactor = 60;
	setGlitch()
	playSound('glitch',.5)
	
	cameraShake('game', .015, secPerBeat*2)
end
