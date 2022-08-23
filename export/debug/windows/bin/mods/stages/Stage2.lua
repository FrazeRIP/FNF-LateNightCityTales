
local scale1080P = 1
local posX1080P = -250
local posY1080P = -100

function onCreatePostEarly()
	--bg back


	makeLuaSprite('2-back', '2-back', posX1080P-20, posY1080P-75);
	setScrollFactor('2-back', .6, .55);
	scaleObject('2-back', scale1080P, scale1080P);
	addLuaSprite('2-back', false);

	makeLuaSprite('monster', 'monster', posX1080P+230, 0);
	setScrollFactor('monster', .7, .7);
	scaleObject('monster', 1.1, 1.1);
	addLuaSprite('monster', false);
	doTweenColor('monsterC', 'monster', '434343', 0.01, 'linear')
	



	makeAnimatedLuaSprite('Eyeballs', 'Eyeballs', 560,270)
	setScrollFactor('Eyeballs', .7, .7);
	scaleObject('Eyeballs', 1.1, 1.1);
	addAnimationByPrefix('Eyeballs', 'Eyeballs off', 'Eyeballs off', 24, false)
	addAnimationByPrefix('Eyeballs', 'Eyeballs ding', 'Eyeballs ding', 24, true)
	addAnimationByPrefix('Eyeballs', 'Eyeballs on', 'Eyeballs on', 24, false)
	doTweenColor('EyeballsC', 'Eyeballs', '434343', 0.00001, 'linear')
	objectPlayAnimation('Eyeballs', 'Eyeballs ding', false)
	addLuaSprite('Eyeballs', false);

	makeAnimatedLuaSprite('Eyeballs2', 'Eyeballs', 560,270)
	setScrollFactor('Eyeballs2', .7, .7);
	scaleObject('Eyeballs2', 1.1, 1.1);
	addAnimationByPrefix('Eyeballs2', 'Eyeballs off', 'Eyeballs off', 24, false)
	addAnimationByPrefix('Eyeballs2', 'Eyeballs ding', 'Eyeballs ding', 24, true)
	addAnimationByPrefix('Eyeballs2', 'Eyeballs on', 'Eyeballs on', 24, false)
	doTweenColor('EyeballsC2', 'Eyeballs', '434343', 0.0001, 'linear')
	objectPlayAnimation('Eyeballs2', 'Eyeballs ding', false)
	addLuaSprite('Eyeballs2', false);
	setBlendMode('Eyeballs2','add')
	doTweenAlpha("Eyeballs2C","Eyeballs2",0,.01)
	
	makeAnimatedLuaSprite('Eyesocket', 'Eyesocket', 560,270)
	setScrollFactor('Eyesocket', .7, .7);
	scaleObject('Eyesocket', 1.1, 1.1);
	addAnimationByPrefix('Eyesocket', 'Eyesocket off', 'Eyesocket off', 24, false)
	addAnimationByPrefix('Eyesocket', 'Eyesocket ding', 'Eyesocket ding', 24, true)
	addAnimationByPrefix('Eyesocket', 'Eyesocket on', 'Eyesocket on', 24, false)
	doTweenColor('EyesocketC', 'Eyesocket', '434343', 0.00001, 'linear')
	objectPlayAnimation('Eyesocket', 'Eyesocket ding', false)
	addLuaSprite('Eyesocket', false);
	
	makeLuaSprite('whiteFade', 'whiteFade', posX1080P, posY1080P+280);
	scaleObject('whiteFade', 1.5, 1);
	setScrollFactor('whiteFade', .7, .7);
	addLuaSprite('whiteFade', false);
	doTweenColor('whiteFade', 'whiteFade', 'ed49ff', 0.00001, 'linear')
	doTweenAlpha("whiteFadeA","whiteFade",.5,.01)

	makeLuaSprite('DarkSolid', 'DarkSolid', -600, 700);
	setScrollFactor('DarkSolid', .6, .55);
	scaleObject('DarkSolid', 2, scale1080P);
	addLuaSprite('DarkSolid', false);

	
	if songName == 'Aquaphobia' then
	makeLuaSprite('fish2', 'fish1', -500, 200);
	setScrollFactor('fish2', .6, .55);
	scaleObject('fish2', -1, 1);
	addLuaSprite('fish2', false);
	
	
	makeLuaSprite('fish1', 'fish1', 1500, 0);
	setScrollFactor('fish1', .6, .55);
	scaleObject('fish1', 1, 1);
	addLuaSprite('fish1', false);
	

	makeLuaSprite('fish3', 'fish3', 1500, 0);
	setScrollFactor('fish3', .6, .55);
	scaleObject('fish3', 1, 1);
	addLuaSprite('fish3', false);
	end

end

function onCreatePostBehindChar()
	--bg front
	makeLuaSprite('2-front', '2-front', posX1080P, posY1080P);
	setScrollFactor('2-front', 1, 1);
	scaleObject('2-front', scale1080P-.05, scale1080P-.05);
	addLuaSprite('2-front', false);

	--Fire
	makeAnimatedLuaSprite('FlameL_Red', 'FlameRed', -175, 113)
	makeAnimatedLuaSprite('FlameR_Red', 'FlameRed', 880, 113)
	setScrollFactor('FlameL_Red', 1, 1)
	setScrollFactor('FlameR_Red', 1, 1)

	addAnimationByPrefix('FlameL_Red', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameL_Red', 'FlameOn', 'FlameOn',12, false)
	addAnimationByPrefix('FlameL_Red', 'FlameOff', 'FlameOff', 24, false)

	addAnimationByPrefix('FlameR_Red', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameR_Red', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameR_Red', 'FlameOff', 'FlameOff', 24, false)
	

	makeAnimatedLuaSprite('FlameL_Blue', 'FlameBlue', -175, 113)
	makeAnimatedLuaSprite('FlameR_Blue', 'FlameBlue', 880, 113)
	setScrollFactor('FlameL_Blue', 1, 1)
	setScrollFactor('FlameR_Blue', 1, 1)

	addAnimationByPrefix('FlameL_Blue', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameL_Blue', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameL_Blue', 'FlameOff', 'FlameOff', 24, false)

	addAnimationByPrefix('FlameR_Blue', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameR_Blue', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameR_Blue', 'FlameOff', 'FlameOff', 24, false)


	objectPlayAnimation('FlameL_Red', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Red', 'FlameNormal', false)
	objectPlayAnimation('FlameL_Blue', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Blue', 'FlameNormal', false)
	
	scaleObject('FlameL_Red', 1.1, 1.1)
	scaleObject('FlameR_Red', 1.1, 1.1)
	scaleObject('FlameL_Blue', 1.1, 1.1)
	scaleObject('FlameR_Blue', 1.1, 1.1)
	
	if songName == 'Aquaphobia' then
	addLuaSprite('FlameL_Red', false);
	addLuaSprite('FlameR_Red', false);
	addLuaSprite('FlameL_Blue', false);
	addLuaSprite('FlameR_Blue', false);
	

	else
	addLuaSprite('FlameL_Blue', false);
	addLuaSprite('FlameR_Blue', false);
	addLuaSprite('FlameL_Red', false);
	addLuaSprite('FlameR_Red', false);

	
	
	end
	
end

function onCreatePostFrontCharacter()
	
	
	--Net
	makeLuaSprite('1_net_left', '1_net_left', -125, 0);
	setScrollFactor('1_net_left', .6, .6);
	scaleObject('1_net_left', scale1080P, scale1080P);
	doTweenColor('1_net_left1', '1_net_left', 'A19DC0', 0.0001, 'linear')

	makeLuaSprite('1_net_right', '1_net_right', -425, -175);
	setScrollFactor('1_net_right', .8, .8);
	scaleObject('1_net_right', scale1080P, scale1080P);
	doTweenColor('1_net_right1', '1_net_right', 'A19DC0', 0.0001, 'linear')
	 
	addLuaSprite('1_net_left', true);
	addLuaSprite('1_net_right', true);
	 
	
	--song specific:
	if songName == 'Aquaphobia' then
	
	--water ray
	makeAnimatedLuaSprite('WaterRay', 'WaterRay', -200, -50)
	addAnimationByPrefix('WaterRay', 'WaterRay', 'WaterRay', 24, true)
	setScrollFactor('WaterRay', 1, 1);
	addLuaSprite('WaterRay', true);
	scaleObject('WaterRay', 1.5	, 1.5);
	doTweenColor('WaterRayC', 'WaterRay', 'A3E9FF', 0.000001, 'linear')
	setBlendMode('WaterRay','add')
	
	--water filter
	makeAnimatedLuaSprite('WaterFilter', 'WaterFilter', -200, -100)
	addAnimationByPrefix('WaterFilter', 'WaterFilter', 'WaterFilter', 48, true)
	setScrollFactor('WaterFilter', 1, 1);
	addLuaSprite('WaterFilter', true);
	scaleObject('WaterFilter', 1.5	, 1.5);
	 doTweenColor('WaterFilterC', 'WaterFilter', '00006E', 0.00001, 'linear')
	setBlendMode('WaterFilter','add')
	--setObjectCamera('WaterFilter','other')
	doTweenAlpha("WaterFilterA","WaterFilter",.5,.01)

	--water filter
	makeAnimatedLuaSprite('WaterSurface', 'WaterSurface', -200, -100)
	addAnimationByPrefix('WaterSurface', 'WaterSurface', 'WaterSurface', 18, true)
	setScrollFactor('WaterSurface', 1, 1);
	addLuaSprite('WaterSurface', true);
	 doTweenColor('WaterSurfaceC', 'WaterSurface', '808080', 0.000001, 'linear')
	scaleObject('WaterSurface', 1.5	, 1.5);
	setBlendMode('WaterSurface','add')
	--setObjectCamera('WaterFilter','other')
	doTweenAlpha("WaterSurfaceA","WaterSurface",0,.01)

	end

	
	
	--dark environment filter
	makeLuaSprite('BlackEdge','BlackEdge',posX1080P,posY1080P);
	setScrollFactor('BlackEdge', 1, 1);
	scaleObject('BlackEdge', scale1080P, scale1080P);
	addLuaSprite('BlackEdge',true);

	
	if songName == 'Aquaphobia' then
	--dark environment filter
	makeLuaSprite('BlackEdge4','BlackEdge',posX1080P+350,posY1080P-100);
	setScrollFactor('BlackEdge4', .3, .3);
	scaleObject('BlackEdge4', 2, 1.5);
	addLuaSprite('BlackEdge4',false);
	doTweenAlpha("BlackEdge4A","BlackEdge4",.0,.0001)

	
	makeLuaSprite('BlackEdge5','BlackEdge',posX1080P,posY1080P);
	scaleObject('BlackEdge5', scale1080P, scale1080P);
	addLuaSprite('BlackEdge5',true);
	doTweenAlpha("BlackEdge5A","BlackEdge5",.3,.0001)
	
	end
	
	
	makeAnimatedLuaSprite('Sparkle', 'Sparkle', 535,245)
	setScrollFactor('Sparkle', .7, .7);
	addAnimationByPrefix('Sparkle', 'Sparkle', 'Sparkle',36, true)
	addLuaSprite('Sparkle', true);
	doTweenColor('SparkleC', 'Sparkle', 'C22EFF', 0.000001, 'linear')
	doTweenAlpha("SparkleA","Sparkle",0,.01)
	setBlendMode('Sparkle','add')
	

	makeLuaSprite('WhiteFrame','WhiteFrame',0,0);
	setScrollFactor('WhiteFrame', 1, 1);
	scaleObject('WhiteFrame', scale1080P, scale1080P);
	addLuaSprite('WhiteFrame',true);
	doTweenColor('WhiteFrameC', 'WhiteFrame', 'ed49ff', 0.000001, 'linear')
	setBlendMode('WhiteFrame','add')
	doTweenAlpha("WhiteFrameA","WhiteFrame",0,.01)
	setObjectCamera('WhiteFrame', 'HUD')

end


