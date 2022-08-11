allowEnd = false

function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		setProperty('isFirstDialogue',false)
		setProperty('dialogueCount',0)

		setProperty('skipDialogueEndCallback',true)

		preloadAssets()
		startDialogue('dialogue2-2CN', 'dialog4');
		allowEnd = true

		return Function_Stop;
	end
	return Function_Continue;
end


function onNextDialogueAfter(count)
	
	if count == 24 then
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end
	
	if count == 25 then
	playMusic('dialog3',1,true)
	end

	if count == 40 then
	setProperty('isLockDialogue',true)
	doTweenAlpha("dialogueA","camDialog",0,.1,'cubeOut')
	doTweenAlpha('cg2-3AC', 'cg2-3', 1, 2,'cubeOut')
	end

	if count == 41 then
	doTweenAlpha("dialogueA","camDialog",1,.2,'cubeOut')
	end

	if count == 45 then
	playSound('Thunder2',1)
	cameraShake('camDialog', .0035, .5)	
	cameraShake('camDialogBack', .0035, .5)	
	end

	if count == 54 then
	doTweenAlpha('cg2-3A', 'cg2-3', 0, 1,'cubeOut')
	playMusic('dialog4',1,true)
	end

	if count == 59 then
	playSound('laugh',1)
	end

end


function onTweenCompleted( tag )
	if tag == 'cg2-3AC' then
	setProperty('isLockDialogue',false)
	end

end


function preloadAssets( ... )
	makeLuaSprite('cg2-3', 'cg2-3', 0, 0);
	setScrollFactor('cg2-3', 0, 0);
	--scaleObject('cg2-3', 1.2, 1.2);
	setObjectCamera('cg2-3','camDialogBack')
	addLuaSprite('cg2-3', true);
	doTweenAlpha('cg2-3A', 'cg2-3', 0, 0.001)
	
	doTweenAlpha('bg2A', 'bg2', 1, 0.2,'cubeOut')
	doTweenAlpha("dialogueBackA3","camDialogBack",1,.2,'cubeOut')
	doTweenAlpha("dialogueA3","camDialog",1,.2,'cubeOut')
	doTweenAlpha('DF', 'DarkSolidD',1,.2 ,'cubeOut')
end


function onDialogueFinished()

end