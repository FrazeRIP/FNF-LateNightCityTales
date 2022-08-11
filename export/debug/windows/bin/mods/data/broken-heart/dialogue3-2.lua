allowEnd = false

function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		setProperty('isFirstDialogue',false)
		setProperty('dialogueCount',0)
		setProperty('skipDialogueEndCallback',true)
		preloadAssets()
		startDialogue('dialogue3-2CN', 'dialog1');
		allowEnd = true

		return Function_Stop;
	end
	return Function_Continue;
end


function onNextDialogueAfter(count)
	
	if count == 3 then
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end
	

end


function onTweenCompleted( tag )

end


function preloadAssets( ... )
	
	doTweenAlpha('cg1-1A', 'cg1-1', 1, 0.2)
	doTweenAlpha('bg2A', 'bg2', 1, 0.2,'cubeOut')
	doTweenAlpha("dialogueBackA3","camDialogBack",1,.2,'cubeOut')
	doTweenAlpha("dialogueA3","camDialog",1,.2,'cubeOut')
	doTweenAlpha('DF', 'DarkSolidD',1,.2 ,'cubeOut')
end


function onDialogueFinished()

end