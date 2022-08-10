
function onCreate( ... )
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

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBarBG.visible', false)
end

function onUpdate( elapsed )
	health = getProperty('health')

	if health <= 1 then
	doTweenColor('healtbarBaseC', 'healtbarBase', 'C70047', 0.0001, 'linear')
	doTweenColor('healthbarTopC', 'healthbarTop', 'FF696B', 0.0001, 'linear')
	else
	
	doTweenColor('healtbarBaseC', 'healtbarBase', '979797', 0.00001, 'linear')
	doTweenColor('healthbarTopC', 'healthbarTop', 'ffffff', 0.00001, 'linear')
	end

	scale = health/2;
	scale = scale*scale;
	doTweenY('healthbarTopY2','healthbarTop.scale',scale,elapsed/2)
end
