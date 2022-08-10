
local noteName = 'white'

----------------------------
--Custon splash sht
local hit0 = 0
local hit1 = 0
local hit2 = 0
local hit3 = 0

local offset0X = -43
local offset0Y = -60

local offset1X = -35
local offset1Y = -60

local offset2X = -43
local offset2Y = -60
 
local offset3X = -40
local offset3Y = -60

local noteSplashScale = .8
------------------------------


function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == noteName then
			setPropertyFromGroup('unspawnNotes', i, 'texture', noteName); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.08'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			--setPropertyFromGroup('unspawnNotes', i, 'camera', 'camNoteWhite');
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end

		end
	end
	--debugPrint('Script started!')
end



function onCreatePost( ... )
	createNoteSplash()
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == noteName then
			playSound("heal",.7, "heal")
			changeTransparency(-0.15)
			playSplash(noteData)
		end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == noteName then

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



function createNoteSplash( ... )
	--left 0, purple
	makeAnimatedLuaSprite('WhitenoteSplashes_0', 'white_flash', defaultPlayerStrumX0 + offset0X,defaultPlayerStrumY0 + offset0Y)
	addAnimationByPrefix('WhitenoteSplashes_0', 'splash1', 'note splash purple 1', 36, false)
	addAnimationByPrefix('WhitenoteSplashes_0', 'splash2', 'note splash purple 2', 36, false)
	setScrollFactor('WhitenoteSplashes_0', 0, 0);
	scaleObject('WhitenoteSplashes_0',noteSplashScale, noteSplashScale);
	addLuaSprite('WhitenoteSplashes_0', true);
	setObjectCamera('WhitenoteSplashes_0','camNoteDark')
	--doTweenAlpha("WhitenoteSplashes_0A","WhitenoteSplashes_0",0,.0001)

	--down 1, blue
	makeAnimatedLuaSprite('WhitenoteSplashes_1', 'white_flash', defaultPlayerStrumX1 + offset1X,defaultPlayerStrumY1 + offset1Y)
	addAnimationByPrefix('WhitenoteSplashes_1', 'splash1', 'note splash blue 1', 36, false)
	addAnimationByPrefix('WhitenoteSplashes_1', 'splash2', 'note splash blue 2', 36, false)
	setScrollFactor('WhitenoteSplashes_1', 0, 0);
	scaleObject('WhitenoteSplashes_1', noteSplashScale, noteSplashScale);
	addLuaSprite('WhitenoteSplashes_1', true);
	setObjectCamera('WhitenoteSplashes_1','camNoteDark')
	--doTweenAlpha("WhitenoteSplashes_1A","WhitenoteSplashes_1",0,.0001)
	--up 2, green
	makeAnimatedLuaSprite('WhitenoteSplashes_2', 'white_flash', defaultPlayerStrumX2 + offset2X,defaultPlayerStrumY2 + offset2Y)
	addAnimationByPrefix('WhitenoteSplashes_2', 'splash1', 'note splash green 1', 36, false)
	addAnimationByPrefix('WhitenoteSplashes_2', 'splash2', 'note splash green 2', 36, false)
	setScrollFactor('WhitenoteSplashes_2', 0, 0);
	scaleObject('WhitenoteSplashes_2', noteSplashScale, noteSplashScale);
	addLuaSprite('WhitenoteSplashes_2', true);
	setObjectCamera('WhitenoteSplashes_2','camNoteDark')
	--doTweenAlpha("WhitenoteSplashes_2A","WhitenoteSplashes_2",0,.0001)

	--right 3, red
	makeAnimatedLuaSprite('WhitenoteSplashes_3', 'white_flash', defaultPlayerStrumX3 + offset3X,defaultPlayerStrumY3 + offset3Y)
	addAnimationByPrefix('WhitenoteSplashes_3', 'splash1', 'note splash red 1', 36, false)
	addAnimationByPrefix('WhitenoteSplashes_3', 'splash2', 'note splash red 2', 36, false)
	setScrollFactor('WhitenoteSplashes_3', 0, 0);
	scaleObject('WhitenoteSplashes_3', noteSplashScale, noteSplashScale);
	addLuaSprite('WhitenoteSplashes_3', true);
	setObjectCamera('WhitenoteSplashes_3','camNoteDark')
	--doTweenAlpha("WhitenoteSplashes_3A","WhitenoteSplashes_3",0,.0001)
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
	
	--doTweenAlpha('WhitenoteSplashes_'..noteIndex..A,'WhitenoteSplashes_'..noteIndex,1,.0001)
	objectPlayAnimation('WhitenoteSplashes_'..noteIndex, 'splash'..animIndex, true)
end
