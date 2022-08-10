
local scale1080P = 1

local posX1080P = -250

local posY1080P = -100

function onCreate()

	--bg
	makeLuaSprite('1_bg', '1_bg', posX1080P, posY1080P);
	setScrollFactor('1_bg', 1, 1);
	scaleObject('1_bg', scale1080P, scale1080P);
	
	makeAnimatedLuaSprite('Rain', 'Rain', -0, -0)
	setScrollFactor('Rain', 1, 1);
	scaleObject('Rain', .7, .7);


	makeLuaSprite('1_wall', '1_wall', posX1080P, posY1080P);
	setScrollFactor('1_wall', 1, 1);
	scaleObject('1_wall', scale1080P, scale1080P);

	makeLuaSprite('1_thunder', '1_thunder', posX1080P, posY1080P);
	setScrollFactor('1_thunder', 1, 1);
	scaleObject('1_thunder', scale1080P, scale1080P);

	
	makeLuaSprite('BlackEdge','BlackEdge',posX1080P,posY1080P);
	setScrollFactor('BlackEdge', 1, 1);
	scaleObject('BlackEdge', scale1080P, scale1080P);

	makeLuaSprite('BlackEdge3','BlackEdge',posX1080P,posY1080P);
	setScrollFactor('BlackEdge', 1, 1);
	scaleObject('BlackEdge', scale1080P, scale1080P);

	makeLuaSprite('BlackEdge2','BlackEdge',posX1080P,posY1080P);
	setScrollFactor('BlackEdge2', 1, 1);
	scaleObject('BlackEdge2', 3, 1.8);
	

	--Fire


	--front
	makeLuaSprite('1_net_left', '1_net_left', -125, 0);
	setScrollFactor('1_net_left', .6, .6);
	scaleObject('1_net_left', scale1080P, scale1080P);
	 doTweenColor('1_net_left1', '1_net_left', '3D3D3D', 0.01, 'linear')

	makeLuaSprite('1_net_right', '1_net_right', -425, -175);
	setScrollFactor('1_net_right', .8, .8);
	scaleObject('1_net_right', scale1080P, scale1080P);
	 doTweenColor('1_net_right1', '1_net_right', '3D3D3D', 0.01, 'linear')
	
	makeLuaSprite('1_vein_left', '1_vein_left', -125, 0);
	setScrollFactor('1_vein_left', .7 ,.7);
	scaleObject('1_vein_left', scale1080P, scale1080P);
	 doTweenColor('1_vein_left1', '1_vein_left', '3D3D3D', 0.01, 'linear')
	
	makeLuaSprite('1_vein_right', '1_vein_right', -400, 0);
	setScrollFactor('1_vein_right', .7, .7);
	scaleObject('1_vein_right', scale1080P, scale1080P);
	 doTweenColor('1_vein_right1', '1_vein_right', '3D3D3D', 0.01, 'linear')

	--UI
	makeLuaSprite('1_thunder_frame', '1_thunder_frame', 0, 0);
	setScrollFactor('1_thunder_frame', 0, 0);
	setObjectCamera('1_thunder_frame','camHUD')

	--spawn
	addLuaSprite('1_bg', false);
	addAnimationByPrefix('Rain', 'Rain', 'Rain', 24, true)
	objectPlayAnimation('Rain', 'Rain', false)
	addLuaSprite('Rain', false);
	addLuaSprite('1_wall', false);
	
	addLuaSprite('BlackEdge3',false);
	doTweenAlpha('BlackEdgeTrans', 'BlackEdge3', .3, 0.00001, 'elasticOut')

	addLuaSprite('1_thunder', false);
	doTweenAlpha('hideThuner', '1_thunder', 0, 0.00001, 'elasticOut')
	--doTweenAlpha('thunderTrans', '1_thunder', .7, 0.00001, 'elasticOut')
	
	addLuaSprite('BlackEdge',true);
	addLuaSprite('BlackEdge2',true);

	

	makeAnimatedLuaSprite('FlameL_Blue', 'FlameBlue', -140, 100)
	makeAnimatedLuaSprite('FlameR_Blue', 'FlameBlue', 950, 100)
	setScrollFactor('FlameL_Blue', 1, 1)
	setScrollFactor('FlameR_Blue', 1, 1)
	scaleObject('FlameL_Blue', 1.1, 1.1)
	scaleObject('FlameR_Blue', 1.1, 1.1)

	addAnimationByPrefix('FlameL_Blue', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameL_Blue', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameL_Blue', 'FlameOff', 'FlameOff', 24, false)

	addAnimationByPrefix('FlameR_Blue', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameR_Blue', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameR_Blue', 'FlameOff', 'FlameOff', 24, false)

	objectPlayAnimation('FlameL_Blue', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Blue', 'FlameNormal', false)

	addLuaSprite('FlameL_Blue', false);
	addLuaSprite('FlameR_Blue', false);

	
	makeAnimatedLuaSprite('FlameL_Red', 'FlameRed', -140, 100)
	makeAnimatedLuaSprite('FlameR_Red', 'FlameRed', 950, 100)
	setScrollFactor('FlameL_Red', 1, 1)
	setScrollFactor('FlameR_Red', 1, 1)
	scaleObject('FlameL_Red', 1.1, 1.1)
	scaleObject('FlameR_Red', 1.1, 1.1)

	addAnimationByPrefix('FlameL_Red', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameL_Red', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameL_Red', 'FlameOff', 'FlameOff', 24, false)

	addAnimationByPrefix('FlameR_Red', 'FlameNormal', 'FlameNormal', 36, true)
	addAnimationByPrefix('FlameR_Red', 'FlameOn', 'FlameOn', 12, false)
	addAnimationByPrefix('FlameR_Red', 'FlameOff', 'FlameOff', 24, false)
	
	objectPlayAnimation('FlameL_Red', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Red', 'FlameNormal', false)

	addLuaSprite('FlameL_Red', false);
	addLuaSprite('FlameR_Red', false);



	addLuaSprite('1_vein_left', true);
	addLuaSprite('1_vein_right', true);
	addLuaSprite('1_net_left', true);
	addLuaSprite('1_net_right', true);
	
	addLuaSprite('1_thunder_frame', true);
	doTweenAlpha('hideThunderFrame', '1_thunder_frame', 0, 0.00001, 'elasticOut')
	--doTweenAlpha('thunderFrameTrans', '1_thunder_frame', .7, 0.00001, 'elasticOut')

	close(true);
end