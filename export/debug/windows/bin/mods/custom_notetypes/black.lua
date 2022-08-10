
local noteName = 'black'

local missCount = 0

----------------------------
--Custon splash sht
local hit0 = 0
local hit1 = 0
local hit2 = 0
local hit3 = 0

local offset0X = -100
local offset0Y = -100

local offset1X = -89
local offset1Y = -64

local offset2X = -83
local offset2Y = -102

local offset3X = -58
local offset3Y = -83

local noteSplashScale = .8
------------------------------

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == noteName then
			setPropertyFromGroup('unspawnNotes', i, 'texture', noteName); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.2'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.15'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			--setPropertyFromGroup('unspawnNotes', i, 'camera', 'camNoteDark');
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end


function onCreatePost( ... )

	makeLuaSprite('hurt1', 'hurt1', 0, 0);
	setScrollFactor('hurt1', 0, 0);
	setObjectCamera('hurt1', 'other')

	makeLuaSprite('hurt2', 'hurt2', 0, 0);
	setScrollFactor('hurt2', 0, 0);
	setObjectCamera('hurt2', 'other')

	addLuaSprite('hurt2', true);
	addLuaSprite('hurt1', true);
	
	doTweenAlpha("hurt2A","hurt2",0,.01)
	doTweenAlpha("hurt1A","hurt1",0,.01)
	
	createNoteSplash()
	
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == noteName then
			missCount = missCount+1
			cameraShake('camGame', .01, .35)
			if (missCount%2)==0 then
				playSound("blackNote1",1, "blackNote1")
			else
				playSound("blackNote2",1, "blackNote1")
			end
			
		doTweenAlpha("hurt2A","hurt2",.8,.01)
		changeTransparency(0.2)

		playSplash(noteData)
	end
	

end

function changeTransparency(value)
	frameTrans=getProperty('hurtAlpha')

	frameTrans = frameTrans+value
	
	if frameTrans>=.7 then frameTrans = .7 end

	if frameTrans<=0 then frameTrans = 0 end

	setProperty('hurtAlpha',frameTrans)

	finalValue = frameTrans

	if finalValue > 0 then finalValue = finalValue+.3 end

	doTweenAlpha("hurt1A","hurt1",finalValue,.15)

end

function onTweenCompleted( tag )
	if tag == 'hurt2A' then
	doTweenAlpha("hurt2A2","hurt2",0,1.5,'cubeOut')
	end
end



function createNoteSplash( ... )
	--left 0, purple
	makeAnimatedLuaSprite('BLACKnoteSplashes_0', 'BLACKnoteSplashes', defaultPlayerStrumX0 + offset0X,defaultPlayerStrumY0 + offset0Y)
	addAnimationByPrefix('BLACKnoteSplashes_0', 'splash1', 'note splash purple 1', 36, false)
	addAnimationByPrefix('BLACKnoteSplashes_0', 'splash2', 'note splash purple 2', 36, false)
	setScrollFactor('BLACKnoteSplashes_0', 0, 0);
	scaleObject('BLACKnoteSplashes_0',noteSplashScale, noteSplashScale);
	addLuaSprite('BLACKnoteSplashes_0', true);
	setObjectCamera('BLACKnoteSplashes_0','camNoteDark')
	--doTweenAlpha("BLACKnoteSplashes_0A","BLACKnoteSplashes_0",0,.0001)
	

	--down 1, blue
	makeAnimatedLuaSprite('BLACKnoteSplashes_1', 'BLACKnoteSplashes', defaultPlayerStrumX1 + offset1X,defaultPlayerStrumY1 + offset1Y)
	addAnimationByPrefix('BLACKnoteSplashes_1', 'splash1', 'note splash blue 1', 36, false)
	addAnimationByPrefix('BLACKnoteSplashes_1', 'splash2', 'note splash blue 2', 36, false)
	setScrollFactor('BLACKnoteSplashes_1', 0, 0);
	scaleObject('BLACKnoteSplashes_1', noteSplashScale, noteSplashScale);
	addLuaSprite('BLACKnoteSplashes_1', true);
	setObjectCamera('BLACKnoteSplashes_1','camNoteDark')
	--doTweenAlpha("BLACKnoteSplashes_1A","BLACKnoteSplashes_1",0,.0001)
	--up 2, green
	makeAnimatedLuaSprite('BLACKnoteSplashes_2', 'BLACKnoteSplashes', defaultPlayerStrumX2 + offset2X,defaultPlayerStrumY2 + offset2Y)
	addAnimationByPrefix('BLACKnoteSplashes_2', 'splash1', 'note splash green 1', 36, false)
	addAnimationByPrefix('BLACKnoteSplashes_2', 'splash2', 'note splash green 2', 36, false)
	setScrollFactor('BLACKnoteSplashes_2', 0, 0);
	scaleObject('BLACKnoteSplashes_2', noteSplashScale, noteSplashScale);
	addLuaSprite('BLACKnoteSplashes_2', true);
	setObjectCamera('BLACKnoteSplashes_2','camNoteDark')
	--doTweenAlpha("BLACKnoteSplashes_2A","BLACKnoteSplashes_2",0,.0001)

	--right 3, red
	makeAnimatedLuaSprite('BLACKnoteSplashes_3', 'BLACKnoteSplashes', defaultPlayerStrumX3 + offset3X,defaultPlayerStrumY3 + offset3Y)
	addAnimationByPrefix('BLACKnoteSplashes_3', 'splash1', 'note splash red 1', 36, false)
	addAnimationByPrefix('BLACKnoteSplashes_3', 'splash2', 'note splash red 2', 36, false)
	setScrollFactor('BLACKnoteSplashes_3', 0, 0);
	scaleObject('BLACKnoteSplashes_3', noteSplashScale, noteSplashScale);
	addLuaSprite('BLACKnoteSplashes_3', true);
	setObjectCamera('BLACKnoteSplashes_3','camNoteDark')
	--doTweenAlpha("BLACKnoteSplashes_3A","BLACKnoteSplashes_3",0,.0001)
end

function playSplash(noteIndex)

	animIndex = 1

	if noteIndex == 0 then
	hit0 = hit0+1
	animIndex = hit0%2+1

	elseif noteIndex == 1 then
	hit1 = hit1+1
	animIndex = hit1%2+1


	elseif noteIndex == 2 then
	hit2 = hit2+1
	animIndex = hit2%2+1


	elseif noteIndex == 3 then
	hit3 = hit3+1
	animIndex = hit3%2+1

	end
	
	--doTweenAlpha('BLACKnoteSplashes_'..noteIndex..A,'BLACKnoteSplashes_'..noteIndex,1,.0001)
	objectPlayAnimation('BLACKnoteSplashes_'..noteIndex, 'splash'..animIndex, true)
end

