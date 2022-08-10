
local minFrameTransparency =1
local maxFrameTransparency = 1
local secPerBeat=0

frameChange = false

--Blur sht
local blurTargetAmount = 0
local blurCurrentAmount = 0

local blurTargetTimer = 0
local blurCurrentTimer = 0

local blurTemp =10

function onCreate()

setProperty("skipCountdown", true)
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
end


function onCreatePost()
	doTweenColor('bfColorTween', 'boyfriend', 'C1BDE0', 0.1, 'linear')
	doTweenColor('dadColorTween', 'dad', 'A19DC0', 0.1, 'linear')
	doTweenColor('gfColorTween', 'gf', 'C1BDE0', 0.1, 'linear')
	

	setProperty("BlurX", 10)
	setProperty("BlurY", 10)
	blurCurrentAmount = 10
	blurTargetAmount = 10
	setBlur(0,1)
	secPerBeat = 60/curBpm

	doTweenAlpha("HUDAlpha","camHUD",0,0.00001)
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,0.00001)
	doTweenAlpha("HUDAlpha2","camNoteDark",0,0.00001)
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,0.00001)
	
	setGlow('normal','9F41CC',1,24,2)
	setGlow('special','9F41CC',1,36,4)
	
	doTweenAlpha("FlameLAlpha","FlameR_Red",0,0.001)
	doTweenAlpha("FlameRAlpha","FlameL_Red",0,0.001)

	doTweenAlpha("FlameLRAlpha","FlameR_Blue",0,0.001)
	doTweenAlpha("FlameRRAlpha","FlameL_Blue",0,0.001)
end


function onBeatHit()
		if curBeat%8 == 0 then
			for i = 0,7 do
			noteTweenAlpha(i.."NoteAlphaTween", i, .7, secPerBeat*4, "smootherStepInOut")
			end
		elseif curBeat%8 == 4 then
			for i = 0,7 do
			noteTweenAlpha(i.."NoteAlphaTween", i, 1, secPerBeat*4, "smootherStepInOut")
			end
		end


		if (curBeat-16)%32 == 0 then
			ThunderEvent()
		end
		

		if curBeat == 47 then
	doTweenAlpha("HUDAlpha","camHUD",1,.5)
	doTweenAlpha("HUDAlpha1","camNoteNormal",1,.5)
	doTweenAlpha("HUDAlpha2","camNoteDark",1,.5)
	doTweenAlpha("HUDAlpha3","camNoteWhite",1,.5)

	
	objectPlayAnimation('FlameL_Red', 'FlameOn', false)
	objectPlayAnimation('FlameR_Red', 'FlameOn', false)
	
	doTweenAlpha("FlameLAlpha","FlameR_Red",1,0.001)
	doTweenAlpha("FlameRAlpha","FlameL_Red",1,0.001)
	--doTweenAlpha("DarkFrameAlpha","BlackEdge",0.6,secPerBeat/6)
	doTweenAlpha("DarkFrameAlpha2","BlackEdge2",0.3,secPerBeat/6)

	 doTweenColor('1_net_left1', '1_net_left', 'A19DC0', secPerBeat/6, 'linear')
	 doTweenColor('1_net_right1', '1_net_right', 'A19DC0', secPerBeat/6, 'linear')
	 doTweenColor('1_vein_left1', '1_vein_left', 'A19DC0', secPerBeat/6, 'linear')
	 doTweenColor('1_vein_right1', '1_vein_right', 'A19DC0', secPerBeat/6, 'linear')
	doTweenColor('dadColorTween', 'dad', 'C1BDE0', secPerBeat/6, 'linear')
    playSound("fire",.6, "fire")
	end

	if curBeat == 48 then
	frameChange = true
	minFrameTransparency=.6
	maxFrameTransparency=.8

	objectPlayAnimation('FlameL_Red', 'FlameNormal', true)
	objectPlayAnimation('FlameR_Red', 'FlameNormal', true)
	end



	if curBeat == 176 then
	frameChange = false
	doTweenAlpha("DarkFrameAlpha","BlackEdge",1,secPerBeat*4)
	doTweenAlpha("FlameLAlpha","FlameL_Red",.7,secPerBeat*4)
	doTweenAlpha("FlameRAlpha","FlameR_Red",.7,secPerBeat*4)
	doTweenColor('dadColorTween', 'gf', 'A19DC0', secPerBeat*4, 'linear')

	end

	
	if curBeat == 180 then
	frameChange = true
	minFrameTransparency=.8
	maxFrameTransparency=.9
	
	objectPlayAnimation('FlameL_Red', 'FlameOff', false)
	objectPlayAnimation('FlameR_Red', 'FlameOff', false)

	end


	if curBeat == 207 then
	doTweenAlpha("FlameRAlpha1","FlameL_Blue",1,secPerBeat*4)
	doTweenAlpha("FlameRAlpha2","FlameR_Blue",1,secPerBeat*4)
	doTweenAlpha("FlameRAlpha3","FlameL_Red",0,secPerBeat*4)
	doTweenAlpha("FlameRAlpha4","FlameR_Red",0,secPerBeat*4)
	objectPlayAnimation('FlameL_Blue', 'FlameOn', false)
	objectPlayAnimation('FlameR_Blue', 'FlameOn', false)
	objectPlayAnimation('FlameL_Red', 'FlameOn', false)
	objectPlayAnimation('FlameR_Red', 'FlameOn', false)
	playSound("fire",.6, "fire")
	
		setGlow('special','752E96',1,36,4)

	end

	if curBeat == 208 then
	
	objectPlayAnimation('FlameL_Blue', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Blue', 'FlameNormal', false)
	objectPlayAnimation('FlameL_Red', 'FlameNormal', false)
	objectPlayAnimation('FlameR_Red', 'FlameNormal', false)
	end

	if curBeat == 304 then
	
	doTweenAlpha("FlameRAlpha1","FlameL_Red",1,secPerBeat*4)
	doTweenAlpha("FlameRAlpha","FlameR_Red",1,secPerBeat*4)
	minFrameTransparency=.5
	maxFrameTransparency=.7
	end

	if curBeat == 336 then
	
	doTweenAlpha("HUDAlpha","camHUD",0,secPerBeat*8,'cubeOut')
	doTweenAlpha("HUDAlpha1","camNoteNormal",0,secPerBeat*8,'cubeOut')
	doTweenAlpha("HUDAlpha2","camNoteDark",0,secPerBeat*8,'cubeOut')
	doTweenAlpha("HUDAlpha3","camNoteWhite",0,secPerBeat*8,'cubeOut')
	setBlur(100,secPerBeat*8);
	minFrameTransparency=.3
	maxFrameTransparency=.5

	end
end


function onUpdate(elapsed)
	updateTweenBlur(elapsed)
	--noteTweenX("note0X",0, defaultOpponentStrumX0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
	--noteTweenX("note0Y",0, defaultOpponentStrumY0 +5 * math.cos((curBeat+0) * math.pi),0.00001)
end


--SetpHit
function onStepHit()
	changeFrameTransparency()
	if mustHitSection == true then
	triggerEvent("Change Character", 2, "gf-right")
	characterDance("gf")
	else 
	triggerEvent("Change Character", 2, "gf-left")
	characterDance("gf")
	end
	doTweenColor('gfColorTween', 'gf', 'C1BDE0', 0.0001, 'linear')

		--if curStep == 1 then
		--doTweenAlpha("dialogueBackA","camDialogBack",0,.5,'cubeOut')
		--doTweenAlpha("dialogueA","camDialog",0,.5,'cubeOut')
		--doTweenAlpha('cg1-1A', 'cg1-1', 0,.5 ,'cubeOut')
		--playSound("footstep",0, "footstep")
		--end


	if curStep == 721 then
	setGlow('normal','9F41CC',.95,24,2)
	end
	if curStep == 722 then
	setGlow('normal','9F41CC',.9,24,2)
	end
	if curStep == 723 then
	setGlow('normal','9F41CC',.85,24,2)
	end
	if curStep == 724 then
	setGlow('normal','9F41CC',.8,24,2)
	end
	if curStep == 725 then
	setGlow('normal','9F41CC',.75,24,2)
	end
	if curStep == 726 then
	setGlow('normal','9F41CC',.7,24,2)
	end
	if curStep == 727 then
	setGlow('normal','9F41CC',.65,24,2)
	end
	if curStep == 728 then
	setGlow('normal','9F41CC',.6,24,2)
	end
	if curStep == 729 then
	setGlow('normal','9F41CC',.55,24,2)
	end
	if curStep == 730 then
	setGlow('normal','9F41CC',.5,24,2)
	end
	if curStep == 731 then
	setGlow('normal','9F41CC',.45,24,2)
	end
	if curStep == 732 then
	setGlow('normal','9F41CC',.4,24,2)
	end
	if curStep == 733 then
	setGlow('normal','9F41CC',.35,24,2)
	end
	if curStep == 734 then
	setGlow('normal','9F41CC',.3,24,2)
	end
	if curStep == 735 then
	setGlow('normal','9F41CC',.25,24,2)
	end
	if curStep == 736 then
	setGlow('normal','9F41CC',.2,24,2)
	end
	if curStep == 737 then
	setGlow('normal','9F41CC',.15,24,2)
	end
	if curStep == 738 then
	setGlow('normal','9F41CC',.1,24,2)
	end
	if curStep == 739 then
	setGlow('normal','9F41CC',.05,24,2)
	end
	if curStep == 740 then
	setGlow('normal','9F41CC',0,24,2)
	end

	if curStep == 810 then
	setGlow('normal','45BED1',.05,24,2)
	end
	if curStep == 811 then
	setGlow('normal','45BED1',.1,24,2)
	end
	if curStep == 812 then
	setGlow('normal','45BED1',.15,24,2)
	end
	if curStep == 813 then
	setGlow('normal','45BED1',.2,24,2)
	end
	if curStep == 814 then
	setGlow('normal','45BED1',.25,24,2)
	end
	if curStep == 815 then
	setGlow('normal','45BED1',.3,24,2)
	end
	if curStep == 816 then
	setGlow('normal','45BED1',.35,24,2)
	end
	if curStep == 817 then
	setGlow('normal','45BED1',.4,24,2)
	end
	if curStep == 818 then
	setGlow('normal','45BED1',.45,24,2)
	end
	if curStep == 819 then
	setGlow('normal','45BED1',.5,24,2)
	end
	if curStep == 820 then
	setGlow('normal','45BED1',.55,24,2)
	end
	if curStep == 821 then
	setGlow('normal','45BED1',.6,24,2)
	end
	if curStep == 822 then
	setGlow('normal','45BED1',.65,24,2)
	end
	if curStep == 823 then
	setGlow('normal','45BED1',.7,24,2)
	end
	if curStep == 824 then
	setGlow('normal','45BED1',.75,24,2)
	end
	if curStep == 825 then
	setGlow('normal','45BED1',.8,24,2)
	end
	if curStep == 826 then
	setGlow('normal','45BED1',.85,24,2)
	end
	if curStep == 827 then
	setGlow('normal','45BED1',.9,24,2)
	end
	if curStep == 828 then
	setGlow('normal','45BED1',.95,24,2)
	end
	if curStep == 829 then
	setGlow('normal','45BED1',1,24,2)
	end
end



-----Blur sht
function setBlur(targetBlurAmount,elapsedTime)
	blurCurrentTimer = 0

	blurTargetAmount = targetBlurAmount

	blurTargetTimer = elapsedTime

	blurTemp = blurCurrentAmount

end

function updateTweenBlur(elapsed)

	blurCurrentTimer = blurCurrentTimer + elapsed
	
	progess = blurCurrentTimer/blurTargetTimer
	
	if progess > 1 then 
		progess = 1
	end
	
	scaler = progess*progess*progess
	
	if blurCurrentAmount > blurTargetAmount then
		scaler = 1 - scaler
		else
		blurTemp = blurTargetAmount
	end
	
	if scaler<1 then
		blurCurrentAmount = blurTemp*scaler
	end

	--debugPrint(blurCurrentAmount)
	
	setProperty("BlurX", blurCurrentAmount)
	setProperty("BlurY", blurCurrentAmount)
end

-----ThunderSht

function ThunderEvent()
    playSound("Thunder",1, "ThunderSound")
	doTweenAlpha('thunderTrans', '1_thunder', 1, 0.000001,"linear")
	doTweenAlpha('thunderFrameTrans', '1_thunder_frame', .7, 0.000001,"linear")
end


----TweenSht
function onTweenCompleted (tag)
	if tag == "thunderFrameTrans" then
	doTweenAlpha('thunderTrans', '1_thunder', 0, 3,"quartOut")
	doTweenAlpha('thunderFrameTrans', '1_thunder_frame', 0, 3,"quartOut")
	end
end



function changeFrameTransparency()
	if frameChange == true then
		doTweenAlpha("FrameTransparency", 'BlackEdge', getRandomFloat(minFrameTransparency,maxFrameTransparency), 0.05, 'linear')
	end
end