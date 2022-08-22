
local autoSwitchAnim = true

local idleAnimName = ''
local speakAnimName = ''

local isSpeaking = false


function onCreate( ... )
	setAnimName("Default")
end

function onStepHit( ... )
	if curStep == 3 then
	setTextData(
	--width,size,delay,color
	1000,48,0.038,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,150,-2,"You came from another world...")
	end
	
	if curStep == 29 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.05,'ABABAB')

	createFXText(
	--x,y,angle,content
	330,400,5,"So far far away...")
	end


	if curStep == 16*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.038,'ABABAB')

	createFXText(
	--x,y,angle,content
	-90,400,-3,"You already get what you want...")
	end

	if curStep == 95 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.035,'ABABAB')
	createFXText(
	--x,y,angle,content
	260,170,5,"Why don't you just leave?")
	end

	if curStep == 32*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.035,'ABABAB')

	createFXText(
	--x,y,angle,content
	50,130,-3,"You are not here to be friends...")
	end

	if curStep == 159 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.035,'ABABAB')

	createFXText(
	--x,y,angle,content
	-50,400,3,"You are here just to make fun of me...")
	end

	if curStep == 48*4 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.05,'ABABAB')

	createFXText(
	--x,y,angle,content
	20,200,0,"I will give you one last chance...")
	end

	--------------------------------------------------------------------------------------------
	
	if curStep == 128*4 then
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,150,-2,"Hehehe...")
	end

	if curStep == 128*4+16 then
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	500,300,4,"Look at you...")
	end

	if curStep == 128*4+32 then
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	0,400,-6,"Such hopeless...")
	end
	--------------------------------------
	 
	if curStep == 144*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-80,180,-2,"This is all you get...")
	end
	
	
	if curStep == 152*4-4 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	250,400,4,"from challenging me!")

	end
	
	--------------------------------------
	if curStep == 160*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-90,350,-3,"I will dominate you...")
	end
	
	
	if curStep == 168*4-4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	260,170,5,"with my incredible power...")

	end
	--------------------------------------
	if curStep == 176*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.035,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,150,-2,"You will just end up like anyone else...")
	end
	
	if curStep == 184*4+1 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.046,'ABABAB')

	createFXText(
	--x,y,angle,content
	330,400,5,"Become a toy for me...")

	end


	--------------------------------------------------------------------------------------------
	
	if curStep == 324*4 then
	setTextData(
	--width,size,delay,color
	1000,52,0.051,'ABABAB')

	createFXText(
	--x,y,angle,content
	-80,150,-5,"Why are you...")
	end
	
	if curStep == 1316 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.051,'ABABAB')

	createFXText(
	--x,y,angle,content
	420,400,5,"still fighting...?")
	end

	--------------------------------------
	 
	if curStep == 340*4 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.051,'ABABAB')

	createFXText(
	--x,y,angle,content
	-80,250,5,"Why don't you...")
	end
	
	
	if curStep == 1380 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.051,'ABABAB')

	createFXText(
	--x,y,angle,content
	400,400,-5,"just give up...?")

	end
	
	--------------------------------------
	if curStep == 356*4 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-90,400,-3,"who are you...?")
	end
	
	
	if curStep == 364*4 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.042,'ABABAB')

	createFXText(
	--x,y,angle,content
	300,200,5,"what do you want...?")

	end
	--------------------------------------
	if curStep == 372*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,150,-4,"We never know each other...")
	end
	
	if curStep == 380*4+1 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.042,'ABABAB')

	createFXText(
	--x,y,angle,content
	250,450,5,"You won¡¯t get anything...")
	end

	--------------------------------------------------------------------------------------------
	
	if curStep == 388*4 then
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	50,150,-2,"A long time ago...")
	end
	
	if curStep == 1572 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.038,'ABABAB')

	createFXText(
	--x,y,angle,content
	-20,300,5,"my kind were slaughtered by humans...")
	end

	--------------------------------------
	 
	if curStep == 404*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-80,180,-4,"It was the Master...")
	end
	
	
	if curStep == 1640 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	30,350,4,"who kept me away from danger...")

	end
	
	--------------------------------------
	if curStep == 420*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.045,'ABABAB')

	createFXText(
	--x,y,angle,content
	-90,370,-3,"He took me out of the deep sea...")
	end
	
	
	if curStep == 428*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	260,220,4,"the grave of my family...")

	end
	--------------------------------------
	if curStep == 436*4 then
	
	setTextData(
	--width,size,delay,color
	1000,48,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,200,-4,"He gave me such power...")
	end
	
	if curStep == 1770 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	300,400,5,"to protect myself...")

	end

	--------------------------------------------------------------------------------------------
	if curStep == 452*4 then
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-150,200,-3,"You don¡¯t know anything...")
	end
	
	if curStep == 1838 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	150,450,5,"about me and my story...")
	end

	--------------------------------------
	 
	if curStep == 468*4 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-80,180,3,"you are just an intruder...")
	end
	
	
	if curStep == 476*4-2 then
	
	setTextData(
	--width,size,delay,color
	1000,64,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	50,350,-4,"trying to ruin everything...")

	end
	
	--------------------------------------
	if curStep == 484*4 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.048,'ABABAB')

	createFXText(
	--x,y,angle,content
	-110,400,3,"You just like one of them...")
	end
	
	
	if curStep == 492*4 then
	
	setTextData(
	--width,size,delay,color
	1000,52,0.043,'ABABAB')

	createFXText(
	--x,y,angle,content
	120,200,-5,"want to take over everything...")

	end
	--------------------------------------
	if curStep == 500*4 then
	
	setTextData(
	--width,size,delay,color
	1000,128,0.08,'ABABAB')

	createFXText(
	--x,y,angle,content
	-100,250,0,"It¡¯s not over yet...")
	end

	if curStep == 513 *4 then
	
	setTextData(
	--width,size,delay,color
	1000,148,0.01,'ABABAB')

	createFXText(
	--x,y,angle,content
	-150,300,0,"Prepare to die!!!")
	end
	
	--if curStep == 508*4 then
	
	--setTextData(
	--width,size,delay,color
	--1000,52,0.05,'ABABAB')

	--createFXText(
	--x,y,angle,content
	--330,400,5,"It's my time to revenge...!")
	--end
	-----------------------------------------------------------
	-----------------------------------------------------------
	-----------------------------------------------------------
	
	--Top Right------------------------------------
	if curStep ==10 then
	setTextData(
	--width,size,delay,color
	1000,26,0.1,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	450,150,3,"Who are you...?")
	end
	--Right------------------------------------------------
	if curStep ==58 then
	setTextData(
	--width,size,delay,color
	1000,28,0.1,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	600,300,3,"Why are you here...?")
	end
	
	--Button Left------------------------------------------------
	if curStep ==116 then
	setTextData(
	--width,size,delay,color
	1000,24,0.1,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	-150,320,-6,"It's coming!!!")
	end
	
	--Right------------------------------------
	if curStep ==144 then
	setTextData(
	--width,size,delay,color
	1000,32,0.12,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	660,280,3,"Help ME!!!")
	end
	
	--Right------------------------------------
	if curStep ==297 then
	setTextData(
	--width,size,delay,color
	1000,32,0.12,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	660,250,3,"Is that......\nHuman?")
	end
	
	--Button Left------------------------------------------------
	if curStep ==377 then
	setTextData(
	--width,size,delay,color
	1000,24,0.1,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	-150,320,-6,"Get us outta here!!")
	end
	--Top Right------------------------------------
	if curStep ==10 then
	setTextData(
	--width,size,delay,color
	1000,26,0.1,'ABABAB')

	createSideFXText(
	--x,y,angle,content
	450,150,3,"This is fun...")
	end


end


function onBeatHit( ... )
	
	if curBeat == 60 then
	setAnimName("Angry")
	end

	if curBeat == 64 then
	setAnimName("Default")
	end

	if curBeat == 128 then
	setAnimName("Laugh")
	end
	

	if curBeat == 192 then
	setAnimName("Angry")
	end

	if curBeat == 196 then
	setAnimName("Laugh")
	setProperty('isPlayBubbleFX',true)
	end

	if curBeat == 256 then
	setProperty('isPlayBubbleFX',false)
	end
	
	if curBeat == 260 then
	setAnimName("Default")
	end
	
	if curBeat == 324 then
	setAnimName("Sad")
	end

	if curBeat == 452 then
	setAnimName("Angry")
	end

	if curBeat == 580 then
	setAnimName("Cry")
	end
end


function onUpdate(  )
	if autoSwitchAnim then
	updateAnim()
	end
end


function setAnimName( mood )
	idleAnimName = 'Limu'..mood..'Idle'
	speakAnimName = 'Limu'..mood..'Speak'
end


function updateAnim()
	if getTextCount()>0 then
    temp = true
	else
    temp = false
	end


	if not temp == isSpeaking then
		isSpeaking = temp
		if not isSpeaking then
			objectPlayAnimation('LimuH', idleAnimName, true)
			objectPlayAnimation('LimuH2', idleAnimName, true)
		end

	end

	if isSpeaking then
		objectPlayAnimation('LimuH', speakAnimName, false)
		objectPlayAnimation('LimuH2', speakAnimName, false)
	else
		
		if curBeat %4 == 0 then
		objectPlayAnimation('LimuH', idleAnimName, true)
		objectPlayAnimation('LimuH2', idleAnimName, true)
		end

	end

end
