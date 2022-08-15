
local offsetX = -315
local offsetY = -40

local secPerBeat

function onCreatePost( ... )
	

	------------------------------------------------------------------------------------------------
	secPerBeat = 60/curBpm

	makeLuaSprite('symbol1', 'no/symbol1', offsetX, offsetY);
	setScrollFactor('symbol1', 1, 1);
	addLuaSprite('symbol1', true)
	--setObjectCamera('symbol1','camNoteWhite')

	doTweenColor('symbol1C', 'symbol1', '938796', 0.001, 'linear')
	doTweenAlpha("symbol1A","symbol1",0,.001)
	doTweenX('symbol1X','symbol1.scale',0,0.0001,'cubeOut')
	doTweenY('symbol1Y','symbol1.scale',0,0.0001,'cubeOut')
	--setBlendMode('symbol1','add')

	---------------------
	makeLuaSprite('symbol2', 'no/symbol2', offsetX, offsetY+50);
	setScrollFactor('symbol2', 1, 1);
	addLuaSprite('symbol2', true)

	--setObjectCamera('symbol2','camNoteWhite')

	doTweenColor('symbol2C', 'symbol2', '938796', 0.001, 'linear')
	doTweenAlpha("symbol2A","symbol2",0,.001)
	doTweenX('symbol2X','symbol2.scale',0,0.0001,'cubeOut')
	doTweenY('symbol2Y','symbol2.scale',0,0.0001,'cubeOut')
	--setBlendMode('symbol2','add')
	
	------------------------
	makeLuaSprite('symbol3', 'no/symbol3', offsetX, offsetY);
	setScrollFactor('symbol3', 1, 1);
	addLuaSprite('symbol3', true)

	--setObjectCamera('symbol3','camNoteWhite')

	doTweenColor('symbol3C', 'symbol3', '938796', 0.001, 'linear')
	doTweenAlpha("symbol3A","symbol3",0,.001)
	doTweenX('symbol3X','symbol3.scale',0,0.0001,'cubeOut')
	doTweenY('symbol3Y','symbol3.scale',0,0.0001,'cubeOut')
	--setBlendMode('symbol3','add')
	
	---------------------
	makeLuaSprite('symbol4', 'no/symbol4', offsetX, offsetY-20);
	setScrollFactor('symbol4', 1, 1);
	addLuaSprite('symbol4', true)

	--setObjectCamera('symbol4','camNoteWhite')

	doTweenColor('symbol4C', 'symbol4', '000000', 0.001, 'linear')
	doTweenAlpha("symbol4A","symbol4",0,.001)
	doTweenX('symbol4X','symbol4.scale',0,0.0001,'cubeOut')
	doTweenY('symbol4Y','symbol4.scale',0,0.0001,'cubeOut')
	--setBlendMode('symbol4','add')
	-----------------------------------------------------------------------------------------------

	makeLuaSprite('break1', 'no/break1', offsetX, offsetY);
	setScrollFactor('break1', 1, 1);
	addLuaSprite('break1', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('break1C', 'break1', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("break1A","break1",0,.001)
	setBlendMode('break1','add')
	-----------------------
	makeLuaSprite('break2', 'no/break2', offsetX, offsetY);
	setScrollFactor('break2', 1, 1);
	addLuaSprite('break2', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('break2C', 'break2', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("break2A","break2",0,.001)
	setBlendMode('break2','add')
	-----------------------
	makeLuaSprite('break3', 'no/break3', offsetX, offsetY);
	setScrollFactor('break3', 1, 1);
	addLuaSprite('break3', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('break3C', 'break3', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("break3A","break3",0,.001)
	setBlendMode('break3','add')
	-----------------------
	makeLuaSprite('break4', 'no/break4', offsetX, offsetY);
	setScrollFactor('break4', 1, 1);
	addLuaSprite('break4', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('break4C', 'break4', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("break4A","break4",0,.001)
	setBlendMode('break4','add')
	-----------------------------------------------------------------------------------------------
	makeLuaSprite('BreakFinalBack', 'no/BreakFinalBack', offsetX, offsetY);
	setScrollFactor('BreakFinalBack', 1, 1);
	addLuaSprite('BreakFinalBack', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('BreakFinalBackC', 'BreakFinalBack', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("BreakFinalBackA","BreakFinalBack",0,.001)
	setBlendMode('BreakFinalBack','invert')
	-----------------------
	makeLuaSprite('BreakFinalMid', 'no/BreakFinalMid', offsetX, offsetY);
	setScrollFactor('BreakFinalMid', 1, 1);
	addLuaSprite('BreakFinalMid', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('BreakFinalMidC', 'BreakFinalMid', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("BreakFinalMidA","BreakFinalMid",0,.001)
	setBlendMode('BreakFinalMid','invert')
	-----------------------
	makeLuaSprite('BreakFinalFront', 'no/BreakFinalFront', offsetX, offsetY);
	setScrollFactor('BreakFinalFront', 1, 1);
	addLuaSprite('BreakFinalFront', true)
	--setObjectCamera('break1','camNoteWhite')
	doTweenColor('BreakFinalFrontC', 'BreakFinalFront', 'FFFFFF', 0.001, 'linear')
	doTweenAlpha("BreakFinalFrontA","BreakFinalFront",0,.001)
	setBlendMode('BreakFinalFront','invert')
	-----------------------
	doTweenX('BreakFinalBackX','BreakFinalBack.scale',.8,.001,'cubeIn')
	doTweenY('BreakFinalBackY','BreakFinalBack.scale',.8,.001,'cubeIn')
	
	doTweenX('BreakFinalMidX','BreakFinalMid.scale',.8,.001,'cubeIn')
	doTweenY('BreakFinalMidY','BreakFinalMid.scale',.8,.001,'cubeIn')
	
	doTweenX('BreakFinalFrontX','BreakFinalFront.scale',.8,.001,'cubeIn')
	doTweenY('BreakFinalFrontY','BreakFinalFront.scale',.8,.001,'cubeIn')

end


function onBeatHit( ... )

	if curBeat == 65 then
	
	doTweenAlpha("symbol1AK","symbol1",1,0.001)
	doTweenX('symbol1X','symbol1.scale',4,secPerBeat*8,'cubeOut')
	doTweenY('symbol1Y','symbol1.scale',4,secPerBeat*8,'cubeOut')
	end

	if curBeat == 260 then
	doTweenAlpha("symbol2AK","symbol2",1,0.001)
	doTweenX('symbol2X','symbol2.scale',4,secPerBeat*8,'cubeOut')
	doTweenY('symbol2Y','symbol2.scale',4,secPerBeat*8,'cubeOut')
	end

	if curBeat == 388 then
	doTweenAlpha("symbol3AK","symbol3",1,0.001)
	doTweenX('symbol3X','symbol3.scale',4,secPerBeat*8,'cubeOut')
	doTweenY('symbol3Y','symbol3.scale',4,secPerBeat*8,'cubeOut')
	end

	if curBeat == 520 then
	doTweenAlpha("symbol4AK","symbol4",1,0.001)
	doTweenX('symbol4X','symbol4.scale',3,secPerBeat*8,'cubeOut')
	doTweenY('symbol4Y','symbol4.scale',3,secPerBeat*8,'cubeOut')
	end
	
end

function onTweenCompleted ( tag )

	if tag == 'symbol1AK' then
		doTweenAlpha("symbol1A2","symbol1",0,secPerBeat*8,'cubeOut')
	end

	if tag == 'symbol2AK' then
		doTweenAlpha("symbol2A2","symbol2",0,secPerBeat*8,'cubeOut')
	end

	if tag == 'symbol3AK' then
		doTweenAlpha("symbol3A2","symbol3",0,secPerBeat*8,'cubeOut')
	end

	if tag == 'symbol4AK' then
		doTweenAlpha("symbol4A2","symbol4",0,secPerBeat*8,'cubeOut')
	end

end
