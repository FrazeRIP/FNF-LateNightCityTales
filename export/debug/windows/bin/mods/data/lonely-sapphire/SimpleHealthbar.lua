local isLowHealth = false
local isActive = true
local firstTime = true


local secPerBeat


function onCreate( ... )
	secPerBeat = 60/curBpm
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
    setProperty('scoreTxt.alpha', tonumber(0))
    setProperty('scoreTxt.alpha', tonumber(0))
end


function onCreatePost( ... )
	makeLuaSprite('healtbarBase', "", 825, 200)
	makeGraphic('healtbarBase', 25, 300, '979797')
	addLuaSprite('healtbarBase', true)
	makeLuaSprite('healthbarTop', "", 825, 200)
	makeGraphic('healthbarTop', 25, 300, 'ffffff')
	addLuaSprite('healthbarTop', true)
	doTweenY('healthbarTopY','healthbarTop.scale',0.8,0.0001)


	makeLuaSprite('whiteFrame','whiteFrame',0,0)
	addLuaSprite('whiteFrame', true)
	setObjectCamera('whiteFrame','other')
	doTweenColor('whiteFrameC', 'whiteFrame', 'FF0000', 0.001, 'linear')
	doTweenAlpha("whiteFrameA","whiteFrame",0,.001)


    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBarBG.visible', false)
end

function onUpdate( elapsed )
	health = getProperty('health')

	if health <= 1 then
	doTweenColor('healtbarBaseC', 'healtbarBase', 'C70047', 0.0001, 'linear')
	doTweenColor('healthbarTopC', 'healthbarTop', 'FF696B', 0.0001, 'linear')
	isLowHealth = true
	else
	
	doTweenColor('healtbarBaseC', 'healtbarBase', '979797', 0.00001, 'linear')
	doTweenColor('healthbarTopC', 'healthbarTop', 'ffffff', 0.00001, 'linear')
	isLowHealth = false
	firstTime = true

	end

	scale = health/2;
	scale = scale*scale;
	doTweenY('healthbarTopY2','healthbarTop.scale',scale,elapsed/2)
end

function onBeatHit( ... )

	if isLowHealth and isActive then
		
		if firstTime then
			playSound('heartbeat',.8)
			frameEvent()
			firstTime = false
		end


		if curBeat %4 == 0 then
			playSound('heartbeat',.8)
		end

		if curBeat %8 == 0 then
			frameEvent()
		end

	end

end


function frameEvent( ... )
	doTweenAlpha("whiteFrameFA","whiteFrame",.7,secPerBeat*4)

end


function onTweenCompleted( tag )
	if tag == 'whiteFrameFA' then
	
	doTweenAlpha("whiteFrameFA2","whiteFrame",0,secPerBeat*4)
	end
end



