local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
	--if not isStoryMode then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		
	
	makeLuaSprite('DarkSolidD', 'DarkSolid', -100, -100);
	setScrollFactor('DarkSolidD', 0, 0);
	scaleObject('DarkSolidD', 1.2, 1.2);
	setObjectCamera('DarkSolidD','camDialogBack')
	addLuaSprite('DarkSolidD', true);
	--doTweenAlpha('DarkSolidD', 'DarkSolidD', 0, 0.001)

	setProperty('isFirstDialogue',true)
	return Function_Stop;
	end

	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue2-1CN', 'dialog1');
		preloadAssets()
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	
	
	if count == 7 then
	playMusic('dialog2',1,true)
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 24 then
	setProperty('isLockDialogue',true)
	doTweenAlpha("dialogueA","camDialog",0,.1,'cubeOut')
    playSound("footstep2",1, "footstep2")
	doTweenAlpha('cg1-1A7', 'cg1-1',0, 2,'cubeOut')
	doTweenAlpha('bg2A', 'bg2',1, 2,'cubeOut')
	doTweenAlpha('cg2-1AC', 'cg2-1', 1, 2,'cubeOut')
	end

	if count == 25 then
	doTweenAlpha("dialogueA","camDialog",1,.2,'cubeOut')
	end

	if count == 34 then
	doTweenAlpha('cg2-1A', 'cg2-1', 0, 1,'cubeOut')
	objectPlayAnimation('cg2-1', 'cg2', false)
	end 

	if count == 45 then
	setProperty('isLockDialogue',true)
	doTweenAlpha("dialogueA","camDialog",0,.1,'cubeOut')
	doTweenAlpha('cg2-2AC', 'cg2-2',  1, 2,'cubeOut')
	end 

	if count == 46 then
	doTweenAlpha("dialogueA","camDialog",1,.2,'cubeOut')
	end

	if count == 49 then
	doTweenAlpha('cg2-2A', 'cg2-2', 0, 1,'cubeOut')
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	

end



function onTweenCompleted( tag )

	if tag == 'cg2-1AC' then
	setProperty('isLockDialogue',false)
	end

	if tag == 'cg2-2AC' then
	setProperty('isLockDialogue',false)
	end

end

function preloadAssets( ... )


	makeLuaSprite('cg1-1', 'cg1-1', -100, -100);
	setScrollFactor('cg1-1', 0, 0);
	scaleObject('cg1-1', 1.2, 1.2);
	setObjectCamera('cg1-1','camDialogBack')
	addLuaSprite('cg1-1', true);
	--doTweenAlpha('cg1-1A', 'cg1-1', 0, 0.001)
	
	makeLuaSprite('bg2', 'bg2', -100, -100);
	setScrollFactor('bg2', 0, 0);
	scaleObject('bg2', 1.2, 1.2);
	setObjectCamera('bg2','camDialogBack')
	addLuaSprite('bg2', true);
	doTweenAlpha('bg2A', 'bg2', 0, 0.001)

	makeLuaSprite('cg2-1', 'cg2-1', 0, 0);
	setScrollFactor('cg2-1', 0, 0);
	--scaleObject('cg2-1', 1.2, 1.2);
	setObjectCamera('cg2-1','camDialogBack')
	addLuaSprite('cg2-1', true);
	doTweenAlpha('cg2-1A', 'cg2-1', 0, 0.001)

	makeLuaSprite('cg2-2', 'cg2-2', 0, 0);
	setScrollFactor('cg2-2', 0, 0);
	--scaleObject('cg2-2', 1.2, 1.2);
	setObjectCamera('cg2-2','camDialogBack')
	addLuaSprite('cg2-2', true);
	doTweenAlpha('cg2-2A', 'cg2-2', 0, 0.001)
	
end

function onDialogueFinished()
		doTweenAlpha("dialogueBackA3","camDialogBack",0,.2,'cubeOut')
		doTweenAlpha("dialogueA3","camDialog",0,.2,'cubeOut')
		doTweenAlpha('K1', 'cg1-1', 0,.2 ,'cubeOut')
		doTweenAlpha('K2', 'cg2-1', 0,.2 ,'cubeOut')
		doTweenAlpha('K3', 'cg2-2', 0,.2 ,'cubeOut')
		doTweenAlpha('bg2A', 'bg2', 0, 0.2,'cubeOut')
		doTweenAlpha('DF', 'DarkSolidD', 0,.2 ,'cubeOut')
		
		isSkip = getProperty('skipDialogueEndCallback')
		if isSkip == false then
		restartSong(true)
		end
end