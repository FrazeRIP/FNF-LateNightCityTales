--[[
Original Script  by Niko_matthew
Modified by Fraze
]]

IntroTextSize = 18	--显示Now playing的文字大小
IntroSubTextSize = 17 --显示歌名的文字大小
IntroTagColor = '3A0078' --16进位颜色代码 百度一下我就知道
IntroTagWidth = 19	--框の宽度

authorName = 'By Red' --曲子作者的名字

function onCreate()
	
	makeLuaSprite('JukeBoxTag', 'empty', 1300-IntroTagWidth, 20)--红框
	makeGraphic('JukeBoxTag', 290+IntroTagWidth, 90, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)


	makeLuaSprite('JukeBox', 'empty', 1310-IntroTagWidth, 20)--黑框
	makeGraphic('JukeBox', 280, 90, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	
	makeLuaText('JukeBoxText', 'Now Playing:    ', 300, 1305-IntroTagWidth, 32)--nowplaying文字
	setTextAlignment('JukeBoxText', 'right')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	

	makeLuaText('JukeBoxSubText', songName..'\n'..authorName, 300, 1305-IntroTagWidth, 62)--歌名文字
	setTextAlignment('JukeBoxSubText', 'right')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')

	
end


function onSongStart()
--出现
	doTweenX('MoveInOne', 'JukeBoxTag', 1020, 1.2, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 1020, 1.5, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 910, 1.5, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 910, 1.5, 'CircInOut')
	
	runTimer('JukeBoxWait', 5, 1)--5秒后就寄
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'JukeBoxWait' then--寄了
		doTweenX('MoveOutOne', 'JukeBoxTag', 1300, 1.8, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', 1300, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', 1300, 1.2, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', 1300, 1.2, 'CircInOut')
	end
end