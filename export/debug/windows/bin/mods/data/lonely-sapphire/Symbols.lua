
local offsetX = 0
local offsetY = 0


function onCreatePost( ... )
	
	makeLuaSprite('symbol1', 'no/symbol1', offsetX, offsetY);
	setScrollFactor('symbol1', 1, 1);
	addLuaSprite('symbol1', true)
	setObjectCamera('symbol1','camNoteWhite')
	doTweenColor('symbol1C', 'symbol1', '000000', 0.001, 'linear')
	doTweenAlpha("symbol1A","symbol1",0,.001)

	
	makeLuaSprite('symbol2', 'no/symbol2', offsetX, offsetY);
	setScrollFactor('symbol2', 1, 1);
	addLuaSprite('symbol2', true)
	setObjectCamera('symbol2','camNoteWhite')
	doTweenColor('symbol2C', 'symbol2', '000000', 0.001, 'linear')
	doTweenAlpha("symbol2A","symbol2",0,.001)

	makeLuaSprite('symbol3', 'no/symbol3', offsetX, offsetY);
	setScrollFactor('symbol3', 1, 1);
	addLuaSprite('symbol3', true)
	setObjectCamera('symbol3','camNoteWhite')
	doTweenColor('symbol3C', 'symbol3', '000000', 0.001, 'linear')
	doTweenAlpha("symbol3A","symbol3",0,.001)

	makeLuaSprite('symbol4', 'no/symbol4', offsetX, offsetY);
	setScrollFactor('symbol4', 1, 1);
	addLuaSprite('symbol4', true)
	setObjectCamera('symbol4','camNoteWhite')
	doTweenColor('symbol4C', 'symbol4', '000000', 0.001, 'linear')
	doTweenAlpha("symbol4A","symbol4",0,.001)
	


end
