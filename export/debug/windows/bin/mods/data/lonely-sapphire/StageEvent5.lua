local keepScroll = false

local secPerBeat

local noteBlinKFactor = 16

local breathDark = true

local zoomAmountGame = 1.005
local zoomAmountHUD = 1.005

local zoomDuration 


--------------------
local caAmount = 1.25;
local caFactor = 1;

local glitchAmount = 5;
local glitchFactor = 15;


local autoPeriodCA = 4
local autoPeriodGlitch = 8
----------------------
local isAutoCA = true
local isAutoGlitch = true
local isAutoCamZoom = true

local shadowAnimFactor = 4
local isShadowOn = false
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
	zoomDuration = secPerBeat/2

	setGlow('normal','D119FF',1,32,3)
	setGlow('special','D119FF',1,36,4)
	
	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setWave(0.03,1)
	
	setCameraZoomAmount(0.015)
	
	setProperty('bloomFactor', 0)
	setProperty('blurFactor', 0)
end


--function onUpdate( elapsed )
--	updateTweenWave(elapsed)
--end


function onStepHit( ... )

	if curStep == 1 then
		camShakeNotes(.001,secPerBeat*32)

		
		doTweenAlpha("HUDAlpha","camHUD",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha1","camNoteNormal",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha2","camNoteDark",1,secPerBeat*2)
		doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)
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


		if curStep == 246 then
		
		setProperty('isInvertActive',true)
		end

		if curStep == 248 then
		
		setProperty('isInvertActive',false)
		end

		if curStep == 250 then

		setProperty('isInvertActive',true)

		end

		if curStep == 64*4 then
		
		setProperty('isInvertActive',false)
		end
		------------------------
		if curStep == 770 then
		setProperty('isInvertActive',true)
		end

		if curStep == 771 then
		setProperty('isInvertActive',false)
		end

		if curStep == 772 then
		setProperty('isInvertActive',true)
		end

		if curStep == 773 then
		setProperty('isInvertActive',false)
		end

		if curStep == 774 then
		setProperty('isInvertActive',true)
		end

		if curStep == 783 then
		setProperty('isInvertActive',false)
		end

		if curStep == 1800 then
		setProperty('isInvertActive',true)
		end

		if curStep == 1808 then
		setProperty('isInvertActive',false)
		end

		if curStep == 2056 then
		setProperty('isInvertActive',true)
		end

		if curStep == 2068 then
		setProperty('isInvertActive',false)
		end

		if curStep == 2570 then
		setProperty('isInvertActive',true)
		end

		if curStep == 2576 then
		setProperty('isInvertActive',false)
		end
		---------------------

end



function onBeatHit()

	if curBeat == 32 then
	setCameraZoomAmount(0.02)
	camShakeNotes(.003,secPerBeat*16)
	end

	if curBeat == 48 then
	setCameraZoomAmount(0.025)
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
	
	if curBeat == 59 then
	switchExpressionEvent()
	end

	if curBeat == 60 then
	cameraShake('hud', .01, secPerBeat*4)
	cameraShake('game', .01, secPerBeat*4)
	camShakeNotes(.01,secPerBeat*4)
	
	setCameraZoomAmount(0)
	isShadowOn = true

	
	doTweenX('GoAwayX','GoAway.scale',.8,.15,'cubeOut')
	doTweenY('GoAwayY','GoAway.scale',.8,.15,'cubeOut')
	doTweenAlpha("GoAwayA","GoAway",0.5,.01)
	end


	if curBeat == 64 then
	
	doTweenAlpha("GoAwayA","GoAway",0.0,.0001)

	isAutoCamZoom = true
	
	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	isAutoCA = true

	autoPeriodCA = 1
	caAmount = 1.5
	caFactor = 6

	doTweenColor('LimuHC', 'LimuH', 'B8B8B8', 0.00001, 'linear')
	doTweenColor('LimuH2C', 'LimuH2', '7A7A7A', 0.00001, 'linear')

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

	camShakeNotes(.007,secPerBeat*64)
	isAutoCA = false

	isAutoGlitch = true
	autoPeriodGlitch = 3
	glitchAmount = 3;
	glitchFactor = 15;

	
	doTweenColor('Tentacle2C', 'Tentacle2', '242424', secPerBeat*4, 'cubeOut')
	doTweenColor('LimuH', 'LimuH', 'FFFFFF', secPerBeat*4, 'cubeOut')
	doTweenColor('LimuH2C', 'LimuH2', 'FFFFFF', 0.00001, 'cubeOut')


	end


	if curBeat == 188 then
	isAutoCamZoom = false
	doTweenZoom('camgameZ2','camGame', 1.25,secPerBeat*7, 'cubeIn')

	end

	if curBeat == 191 then
	switchExpressionEvent()
	end

	if curBeat == 192 then

	cameraShake('game', .02, secPerBeat*4)
	camShakeNotes(.02,secPerBeat*4)
	
	doTweenX('OFMSX','OFMS.scale',.8,0.15,'cubeOut')
	doTweenY('OFMSY','OFMS.scale',.8,.15,'cubeOut')
	doTweenAlpha("OFMSA","OFMS",0.5,.01)

	end


	if curBeat == 196 then
	doTweenColor('Tentacle2C', 'Tentacle2', 'A1A1A1', 0.00001, 'linear')

	doTweenColor('LimuHC', 'LimuH', '7A7A7A', secPerBeat*4, 'cubeOut')
	doTweenColor('LimuH2C', 'LimuH2', '7A7A7A', secPerBeat*4, 'cubeOut')
	
	doTweenAlpha("OFMSA","OFMS",0,.01)

	isAutoCamZoom = true
	camShakeNotes(.005,secPerBeat*64*2)
	
	setCameraZoomAmount(0.025)

	zoomDuration = secPerBeat
	
	doTweenAlpha("WaterFilterA","WaterFilter",.9,secPerBeat*2,'cubeOut')
	doTweenAlpha("WaterRayA","WaterRay",.9,secPerBeat*2,'cubeOut')
	doTweenAlpha("WaterSurfaceA","WaterSurface",0.9,secPerBeat*2,'cubeOut')
	
	
	cameraFlash('game', '000130',secPerBeat*32,false)

	isAutoCA = true
	autoPeriodCA = 4
	autoPeriodGlitch = 8

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

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 20;

	autoPeriodCA = 1
	setCameraZoomAmount(0.035)
	end

	if curBeat == 323 then
	switchExpressionEvent()
	end

	if curBeat == 324 then

	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	
	doTweenColor('Tentacle2C', 'Tentacle2', '242424', secPerBeat*4, 'linear')
	doTweenColor('LimuH', 'LimuH', 'FFFFFF', secPerBeat*4, 'cubeOut')
	end


	if curBeat == 388 then

	
	doTweenColor('Tentacle2C', 'Tentacle2', '0D0D0D', secPerBeat*4, 'cubeOut')
	doTweenColor('LimuH2C', 'LimuH2', '383838', secPerBeat*4, 'cubeOut')
	doTweenColor('LimuH', 'LimuH', '383838', secPerBeat*4, 'cubeOut')

	setCameraZoomAmount(0.025)

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
	
	doTweenColor('Tentacle2C', 'Tentacle2', 'A1A1A1', secPerBeat, 'cubeOut')
	doTweenColor('LimuH2C', 'LimuH2', '7A7A7A', secPerBeat, 'cubeOut')
	doTweenColor('LimuH', 'LimuH', '7A7A7A', secPerBeat, 'cubeOut')


	isAutoGlitch = true
	glitchAmount = 5;
	glitchFactor = 15;

	zoomAmountGame = 1.0025
	zoomAmountHUD = 1.004
	camShakeNotes(.005,secPerBeat*64)
	
	autoPeriodCA = 1
	caAmount = 1.5
	caFactor = 6

	setCameraZoomAmount(0.035)
	end

	if curBeat == 515 then
	switchExpressionEvent()
	end

	if curBeat == 516 then
	
	cameraFlash('game', 'FFFFFF',secPerBeat*4,false)
	
	doTweenColor('LimuH', 'LimuH', '7A7A7A', 0.00001, 'cubeOut')
	doTweenColor('whiteSolidC', 'whiteSolid', 'FFFFFF', 0.0001, 'linear')
	doTweenAlpha("whiteSolidA2","whiteSolid",1,0.001)
	doTweenAlpha("whiteSolidA","whiteSolid",0,secPerBeat*4)
	
	doTweenColor('Tentacle2C', 'Tentacle2', 'A1A1A1', secPerBeat, 'cubeOut')
	doTweenColor('LimuH2C', 'LimuH2', 'FFFFFF', secPerBeat, 'cubeOut')
	doTweenColor('LimuH', 'LimuH', 'FFFFFF', secPerBeat, 'cubeOut')


	zoomAmountGame = 1.035
	zoomAmountHUD = 1.01
	camShakeNotes(.007,secPerBeat*64)
	setCameraZoomAmount(0.045)
	
	isAutoGlitch = true
	glitchAmount = 7;
	glitchFactor = 40;
	autoPeriodGlitch = 1;
	
	autoPeriodCA = 1
	caAmount = 1.8
	caFactor = 8
	end

	if curBeat == 576 then
	setProperty('isPlayRisePurpleFX', false)
	end

	if curBeat == 579 then
	switchExpressionEvent()
	end

	if curBeat == 580 then
	
	cameraFlash('game', 'FFFFFF',secPerBeat*8,false)

	isAutoCamZoom = false
	isAutoCA = false
	isAutoGlitch = false
	isShadowOn = false
	
	setProperty('caAmountFactor',9999)
	setProperty('glitchFactor',9999)
	--setProperty('caAmount',0)
	--setProperty('glitchAmount',0)

	doTweenAlpha("WaterFilterA","WaterFilter",0,.01)
	doTweenAlpha("WaterRayA","WaterRay",0,.01)
	doTweenAlpha("Tentacle2A","Tentacle2",0,.01)
	
	doTweenColor('LimuH', 'LimuH', '616161', 0.00001, 'cubeOut')
	end

	if curBeat == 596 then
	cameraFlash('game', 'FFFFFF',secPerBeat,false)
	
	camShakeNotes(.01,secPerBeat/2)
	cameraShake('game', .01, secPerBeat/2)
	doTweenAlpha("break1A","break1",1,.001)
	playSound('glassBreak1',1)
	end

	if curBeat == 612 then
	doTweenColor('LimuH', 'LimuH', '525252', 0.0001, 'cubeOut')
	cameraFlash('game', 'FFFFFF',secPerBeat,false)
	
	camShakeNotes(.015,secPerBeat/2)
	cameraShake('game', .015, secPerBeat/2)
	doTweenAlpha("break1A","break1",0,.001)
	doTweenAlpha("break2A","break2",1,.001)
	playSound('glassBreak1',1)
	end

	if curBeat == 628 then
	doTweenColor('LimuH', 'LimuH', '303030', 0.0001, 'cubeOut')
	cameraFlash('game', 'FFFFFF',secPerBeat,false)
	camShakeNotes(.015,secPerBeat/2)
	cameraShake('game', .015, secPerBeat/2)
	doTweenAlpha("break2A","break2",0,.001)
	doTweenAlpha("break3A","break3",1,.001)
	playSound('glassBreak1',1)
	end

	if curBeat == 640 then
	doTweenColor('LimuH', 'LimuH', '171717', 0.0001, 'cubeOut')
	cameraFlash('game', 'FFFFFF',secPerBeat,false)
	camShakeNotes(.015,secPerBeat/2)
	cameraShake('game', .015, secPerBeat/2)
	doTweenAlpha("break3A","break3",0,.001)
	doTweenAlpha("break4A","break4",1,.001)
	playSound('glassBreak1',1)
	end

	if curBeat == 644 then
	doTweenColor('LimuH', 'LimuH', '0D0D0D', 0.00001, 'cubeOut')
	
	doTweenColor('whiteSolidC', 'whiteSolid', 'FFFFFF', 0.01, 'linear')
	doTweenAlpha("whiteSolidA","whiteSolid",0,.001)
	doTweenAlpha("whiteSolidA2","whiteSolid",1,secPerBeat*16)
	
	cameraFlash('game', 'FFFFFF',secPerBeat*2,false)
	camShakeNotes(.02,secPerBeat)
	cameraShake('game', .02, secPerBeat)
	doTweenAlpha("break4A","break4",0,.001)
	
	doTweenAlpha("BreakFinalBackA","BreakFinalBack",1,.001)
	doTweenAlpha("BreakFinalMidA","BreakFinalMid",1,.001)
	doTweenAlpha("BreakFinalFrontA","BreakFinalFront",1,.001)
	
	doTweenX('BreakFinalBackX','BreakFinalBack.scale',1.2,secPerBeat,'cubeOut')
	doTweenY('BreakFinalBackY','BreakFinalBack.scale',1.2,secPerBeat,'cubeOut')
	
	doTweenX('BreakFinalMidX','BreakFinalMid.scale',1.1,secPerBeat,'cubeOut')
	doTweenY('BreakFinalMidY','BreakFinalMid.scale',1.1,secPerBeat,'cubeOut')
	
	doTweenX('BreakFinalFrontX','BreakFinalFront.scale',1,secPerBeat,'cubeOut')
	doTweenY('BreakFinalFrontY','BreakFinalFront.scale',1,secPerBeat,'cubeOut')

	

	playSound('glassBreak2',1)
	end

	if curBeat == 645 then
	
	doTweenX('BreakFinalBackX','BreakFinalBack.scale',5.5/2,secPerBeat*10,'cubeIn')
	doTweenY('BreakFinalBackY','BreakFinalBack.scale',4.5/2,secPerBeat*10,'cubeIn')
	
	doTweenX('BreakFinalMidX','BreakFinalMid.scale',4.5/2,secPerBeat*10,'cubeIn')
	doTweenY('BreakFinalMidY','BreakFinalMid.scale',3.5/2,secPerBeat*10,'cubeIn')
	
	doTweenX('BreakFinalFrontX','BreakFinalFront.scale',3/2,secPerBeat*10,'cubeIn')
	doTweenY('BreakFinalFrontY','BreakFinalFront.scale',2.5/2,secPerBeat*10,'cubeIn')
	end
	 
	if curBeat % shadowAnimFactor == 0 then

		if isShadowOn then
		LimuShaodwAnim()
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
	
		glitchAmount = 4;
		glitchFactor = 60;
		
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
		LimuShaodwAnimFinish(secPerBeat*shadowAnimFactor)
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
	playSound('glitch',.4)
	
	cameraShake('game', .015, secPerBeat*2)
end
