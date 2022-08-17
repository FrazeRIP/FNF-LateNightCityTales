local keepScroll = false

local secPerBeat=0


local finishYUp = -290
local finishYDown = 650

local blurTargetAmount = 0
local blurCurrentAmount = 0

local blurTargetTimer = 0
local blurCurrentTimer = 0

local blurTemp =10

function onCreate()

setProperty("skipCountdown", true)

setProperty("showCombo",false)

	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end

end

--Begin
function onCreatePost()
	 doTweenColor('bfColorTween', 'boyfriend', 'A19DC0', 0.1, 'linear')
	 doTweenColor('dadColorTween', 'dad', 'A19DC0', 0.1, 'linear')
	 doTweenColor('gfColorTween', 'gf', 'A19DC0', 0.1, 'linear')


	setProperty("BlurX", 10)
	setProperty("BlurY", 10)
	blurCurrentAmount = 50
	blurTargetAmount = 50
	secPerBeat = 60/curBpm
	setBlur(0,secPerBeat*16)
	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setGlow('normal','45BED1',1,32,3)
	setGlow('special','AD4ED9',1,36,4)
	
	setProperty('gf.visible', false)
	
end


function onBeatHit()

		if curBeat%8 == 0 then
			
			for i = 0,3 do
			noteTweenAlpha(i.."NoteAlphaTween", i,0, secPerBeat*4, "smootherStepInOut")
			end

			for i = 4,7 do
			noteTweenAlpha(i.."NoteAlphaTween", i, .7, secPerBeat*4, "smootherStepInOut")
			end
		elseif curBeat%8 == 4 then
			for i = 0,3 do
			noteTweenAlpha(i.."NoteAlphaTween", i,0, secPerBeat*4, "smootherStepInOut")
			end

			for i = 4,7 do
			noteTweenAlpha(i.."NoteAlphaTween", i, 1, secPerBeat*4, "smootherStepInOut")
			end
		end


	if curBeat == 1 then
	
	doTweenColor('heartbeatColor', 'heartbeat', 'FF2244', secPerBeat*400, 'linear')
	end


	if curBeat == 19 then
	cameraFlash('game','FFFFFF',2,false)
	end

	if curBeat == 24 then
	doTweenAlpha("cg-gone",'4-cg',0,secPerBeat*24,'cubeOut')
	end


	if curBeat>40 and curBeat%4 == 0 then
	objectPlayAnimation('heartbeat', 'heartbeat', true)
	doTweenAlpha("heartbeatAlphaRise","heartbeat",1,.000001,'cubeOut')
	doTweenAlpha("heartbeatAlphaDown","heartbeat",.3,secPerBeat*8,'cubeOut')
	end
	

	if curBeat == 40 then
	doTweenAlpha("heartbeatAlpha","heartbeat",.9,secPerBeat*8,'cubeOut')
	doTweenX('bfPosX', 'boyfriend',930, secPerBeat*8,'cubeOut')
	
	setProperty('isPlayRiseBlueFX',true)
	end

	
	if curBeat == 44 then
    --setProperty('camHUD.visible', true);  
	doTweenAlpha("HUDAlpha","camHUD",1,.5)
	doTweenAlpha("HUDAlpha1","camNoteNormal",1,.5)
	doTweenAlpha("HUDAlpha2","camNoteDark",1,.5)
	doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)
	end

	if curBeat == 400 then
	doTweenAlpha("HUDAlpha","camHUD",0,1)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,1)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,1)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,1)
	
	doTweenAlpha("DarkSolidUp","Broken",0,1)
	doTweenAlpha("DarkSolidDown","Broken",0,1)
	doTweenAlpha("OldMovieAlpha","OldMovie",0,1)
	doTweenAlpha("OldMovieAlpha","MovieDots",0,1)
	end


	if curBeat == 401 then
	setProperty('dad.visible', false)
	doTweenAlpha("normal_gfAlpha","normal_gf",1,0.00001)
	objectPlayAnimation('normal_gf', 'recover', false)
	setProperty('isPlayRiseBlueFX',false)

	end

	if curBeat == 404 then

	setBlur(100,secPerBeat*4);
	doTweenAlpha("whiteSolidAlpha","whiteSolid",1,secPerBeat*4)
	end

end


function onStepHit( ... )
	if curStep == 1 then

	--for i = 0, 3 do
	--	setPropertyFromGroup('opponentStrums', i, 'x', -900);
	--end

	--setPropertyFromGroup('playerStrums', 0, 'x', 600-225);
	--setPropertyFromGroup('playerStrums', 1, 'x', 600-75);
	--setPropertyFromGroup('playerStrums', 2, 'x', 600+75);
	--setPropertyFromGroup('playerStrums', 3, 'x', 600+225);
	
	doTweenZoom('cg1', 'camGame', .9, .001, 'linear')
	doTweenZoom('cg', 'camGame', 1, secPerBeat*48, 'linear')
	cameraFlash('game','FFFFFF',secPerBeat*16,false)
	
	doTweenAlpha("normal_gfAlpha","normal_gf",0,0.00001)
	doTweenAlpha("whiteSolidAlpha","whiteSolid",0,0.00001)
	

	setObjectCamera('boyfriend', 'camNoteNormal')
	--doTweenX('bfPosX', 'boyfriend',1500, .001)
	doTweenX('bfPosX', 'boyfriend',900, .001)
	doTweenY('bfPosY', 'boyfriend', 420, .001)
	
	--doTweenAlpha("boyfriendA","boyfriend",0,0.00001)

	doTweenY('DarkSolidUpY', 'DarkSolidUp', finishYUp, secPerBeat*48,'smootherStepInOut')
	doTweenY('DarkSolidDownY', 'DarkSolidDown', finishYDown, secPerBeat*48,'smootherStepInOut')
	cameraShake('game', .0005, secPerBeat*48)

end
end

function onUpdate(elapsed)
	updateTweenBlur(elapsed)
	--noteTweenX("note0X",0, defaultOpponentStrumX0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
	--noteTweenX("note0Y",0, defaultOpponentStrumY0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
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


function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end