local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		preloadAssets()
		setProperty('isFirstDialogue',true)
		return Function_Stop;
	end

	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue4CN', 'dialog4');
	end

	if tag == 'finish' then
	setProperty('isLockDialogue',false)
	end
end 

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	if count == 4 then
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 9 then
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 13 then
	playSound('heartbeat',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 16 then
	playSound('heartbeat',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end
	if count == 17 then
	playSound('heartbeat',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end
	if count == 18 then
	playSound('heartbeat',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 19 then
	setProperty('isLockDialogue',true)
	--doTweenAlpha("dialogueA","camDialog",0,.1,'cubeOut')
	doTweenAlpha('cg4-1A7', 'cg4-1', .8, 1,'cubeOut')
	runTimer('finish',3);
	playSound('riseString',1);
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 20 then
	--doTweenAlpha("dialogueA2","camDialog",1,.3,'cubeOut')
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	
end

function onSkipDialogue(count)
	

end




function preloadAssets( ... )
	makeLuaSprite('DarkSolidD', 'DarkSolid', -100, -100);
	setScrollFactor('DarkSolidD', 0, 0);
	scaleObject('DarkSolidD', 1.2, 1.2);
	setObjectCamera('DarkSolidD','camDialogBack')
	addLuaSprite('DarkSolidD', true);
	
	makeLuaSprite('bg2', 'bg2', -100, -100);
	setScrollFactor('bg2', 0, 0);
	scaleObject('bg2', 1.2, 1.2);
	setObjectCamera('bg2','camDialogBack')
	addLuaSprite('bg2', true);

	makeLuaSprite('cg4-1', 'cg4-1', 0, 0);
	setScrollFactor('cg4-1', 0, 0);
	--scaleObject('cg4-1', 1.2, 1.2);
	setObjectCamera('cg4-1','camDialogBack')
	addLuaSprite('cg4-1', true);
	doTweenAlpha('cg4-1A', 'cg4-1', 0, 0.001)
end

function onDialogueFinished()
		doTweenAlpha("dialogueBackA","Dback",0,.5,'cubeOut')
		doTweenAlpha("dialogueA","camDialog",0,.5,'cubeOut')
		doTweenAlpha('cg4-1A', 'cg4-1', 0,.5 ,'cubeOut')
		doTweenAlpha('DF', 'DarkSolidD', 0,.5 ,'cubeOut')
		doTweenAlpha('bg2A', 'bg2', 0,.5 ,'cubeOut')

		
		restartSong(true)
end