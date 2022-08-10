local allowCountdown = false

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
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
		startDialogue('dialogue5', 'dialog4');
	end

	if tag == 'finish' then
	setProperty('isLockDialogue',false)
	end
end 

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	--doTweenAlpha("dialogueA2","camDialog",1,.3,'cubeOut')
	--cameraShake('camDialog', .0035, .5)	
	--cameraShake('camDialogBack', .0035, .5)	

	
end

function onSkipDialogue(count)
	

end




function preloadAssets( ... )
end

function onDialogueFinished()
		doTweenAlpha("dialogueBackA","Dback",0,.5,'cubeOut')
		doTweenAlpha("dialogueA","camDialog",0,.5,'cubeOut')
end