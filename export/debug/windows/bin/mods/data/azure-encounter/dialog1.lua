local allowCountdown = false

local soundFolder = '1/1-'

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
	startDialogue('dialogue1-1CH', 'dialog1');
    --playSound(soundFolder.."1",.6, "voice")

	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
    --playSound(soundFolder..count+1,.6, "voice")
	--debugPrint("Current Count:"..count,'Current Playing:'..soundFolder..count+1,'-----------')



	if count == 7 then
	setProperty('isLockDialogue',true)
	doTweenAlpha("dialogueA","camDialog",0,.1,'cubeOut')
	doTweenAlpha('cg1-1A7', 'cg1-1', .8, 2,'cubeOut')
	doTweenAlpha('cg1-2A7', 'cg1-2', 1, 1,'cubeOut')
    playSound("fire",.6, "fire")
	end

	if count == 8 then
	doTweenAlpha("dialogueA2","camDialog",1,.3,'cubeOut')
	doTweenAlpha('cg1-2A7', 'cg1-2', 0, 1,'cubeOut')
	end



	if count == 16 then
    playSound("footstep",1, "footstep")
	end

	
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	

end



function onTweenCompleted( tag )

	if tag == 'cg1-1A7' then
	setProperty('isLockDialogue',false)
	end

end

function preloadAssets( ... )
	makeLuaSprite('DarkSolidD', 'DarkSolid', -100, -100);
	setScrollFactor('DarkSolidD', 0, 0);
	scaleObject('DarkSolidD', 1.2, 1.2);
	setObjectCamera('DarkSolidD','camDialogBack')
	addLuaSprite('DarkSolidD', true);
	
	makeLuaSprite('cg1-1', 'cg1-1', -100, -100);
	setScrollFactor('cg1-1', 0, 0);
	scaleObject('cg1-1', 1.2, 1.2);
	setObjectCamera('cg1-1','camDialogBack')
	addLuaSprite('cg1-1', true);
	doTweenAlpha('cg1-1A', 'cg1-1', 0, 0.001)
	
	makeLuaSprite('cg1-2', 'cg1-2', -100, -100);
	setScrollFactor('cg1-2', 0, 0);
	scaleObject('cg1-2', 1.2, 1.2);
	setObjectCamera('cg1-2','camDialogBack')
	addLuaSprite('cg1-2', true);
	doTweenAlpha('cg1-2A', 'cg1-2', 0, 0.001)
end

function onDialogueFinished()
		
		doTweenAlpha("dialogueBackA","Dback",0,.5,'cubeOut')	
		doTweenAlpha("dialogueA","camDialog",0,.5,'cubeOut')
		doTweenAlpha('cg1-1A', 'cg1-1', 0,.5 ,'cubeOut')
		doTweenAlpha('cg1-2A', 'cg1-2', 0,.5 ,'cubeOut')
		doTweenAlpha('DF', 'DarkSolidD', 0,.5 ,'cubeOut')
		playSound("footstep",0, "footstep")
		
		isSkip = getProperty('skipDialogueEndCallback')
		if isSkip == false then
		restartSong(true)
		end
end