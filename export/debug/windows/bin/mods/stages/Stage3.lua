



function onCreate()

	makeLuaSprite('4-cg', '4-cg', -100, -180);
	setScrollFactor('4-cg', 0, 0);
	scaleObject('4-cg', 1.05, 1.05);
	
	makeLuaSprite('4-cg2', '4-cg', -100, -80);
	setScrollFactor('4-cg2', 0, 0);
	scaleObject('4-cg2', 1, 1);
	 doTweenColor('4-cg2-c', '4-cg2', '404040', 0.1, 'linear')
	addLuaSprite('4-cg2', false)

	
end


function onCreatePostFrontCharacter( )
	
	addLuaSprite('4-cg', true)

	makeAnimatedLuaSprite('heartbeat', 'heartbeat', -0, -0)
	addAnimationByPrefix('heartbeat', 'heartbeat', 'heartbeat', 24, false)
	setScrollFactor('heartbeat', 0, 0)
	addLuaSprite('heartbeat', true)
	doTweenColor('heartbeatColor', 'heartbeat', '69FDFF', 0.1, 'linear')
	doTweenAlpha("heartbeatAlpha","heartbeat",0,0.1)

	makeAnimatedLuaSprite('normal_gf', 'normal gf', 0, 0)
	addAnimationByPrefix('normal_gf', 'recover', 'recover', 18, false)
	addAnimationByPrefix('normal_gf', 'vanish', 'vanish', 18, false)
	addLuaSprite('normal_gf', true)

	
	makeLuaSprite('whiteSolid', 'whiteSolid', 0, 0);
	setScrollFactor('whiteSolid', 0, 0);
	addLuaSprite('whiteSolid', true)
	
	makeLuaSprite('Broken', 'Broken', 0, -50);
	setScrollFactor('Broken', 0, 0);
	addLuaSprite('Broken', true)
	doTweenAlpha("BrokenAlpha","Broken",0,0.1)
	
	makeAnimatedLuaSprite('OldMovie', 'OldMovie', -80, -0)
	addAnimationByPrefix('OldMovie', 'OldMovie', 'OldMovie', 24, true)
	scaleObject('OldMovie', 1.1, 1.1);
	setScrollFactor('OldMovie', 0, 0)
	addLuaSprite('OldMovie', true)
	doTweenColor('OldMovieC', 'OldMovie', 'A9A9A9', 0.01, 'linear')
	doTweenAlpha("OldMovieAlpha","OldMovie",0.25,0.01)
	setBlendMode('OldMovie','multipy')

	
	makeAnimatedLuaSprite('MovieDots', 'MovieDots', -80, -0)
	addAnimationByPrefix('MovieDots', 'MovieDots', 'MovieDots', 24, true)
	scaleObject('MovieDots', 1.1, 1.1);
	setScrollFactor('MovieDots', 0, 0)
	addLuaSprite('MovieDots', true)
	doTweenColor('MovieDots', 'MovieDots', 'A9A9A9', 0.01, 'linear')
	doTweenAlpha("MovieDotsA","MovieDots",1,0.01)
	setBlendMode('MovieDots','lighten')

	makeLuaSprite('DarkSolidUp', 'DarkSolid', -100, -210);
	makeLuaSprite('DarkSolidDown', 'DarkSolid', -100, 530);
	setScrollFactor('DarkSolidUp', 0, 0);
	setScrollFactor('DarkSolidDown', 0, 0);
	scaleObject('DarkSolidUp', 1.2, .5);
	scaleObject('DarkSolidDown', 1.2, .5);
	addLuaSprite('DarkSolidUp', true)
	addLuaSprite('DarkSolidDown', true)
end
