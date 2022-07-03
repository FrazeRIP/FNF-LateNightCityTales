package;

import cpp.Function;
import flixel.FlxCamera;
import flixel.addons.ui.interfaces.IFlxUIState;
import flixel.FlxObject;
import haxe.Timer;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import options.GraphicsSettingsSubState;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import editors.MasterEditorMenu;

using StringTools;

class TitleState extends MusicBeatState
{
	public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

	public static var initialized:Bool = false;

	var cameraMovePos:FlxObject;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var camBG:FlxCamera;
	var camUI:FlxCamera;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	#if TITLE_SCREEN_EASTER_EGG
	var easterEggKeys:Array<String> = [
		'SHADOW', 'RIVER', 'SHUBS', 'BBPANZU'
	];
	var allowedKeys:String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var easterEggKeysBuffer:String = '';
	#end

	var mustUpdate:Bool = false;
		
	public static var updateVersion:String = '';

	static var isTitle:Bool=true;
	static var isMain:Bool;
	static var isStoryMain:Bool;

	static var numberOfMenuItems:Int = 0;
	static var numberOfDifficulty:Int=1;

	var logoBl:FlxSprite;
	// var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;
	var swagShader:ColorSwap = null;
	var bg:FlxSprite;
	var titleStars:FlxSprite;
	var castle:FlxSprite;
	// var grass:FlxSprite;
	// var mountains:FlxSprite;
	// var treeLeft:FlxSprite;
	// var treeRight:FlxSprite;
	var upText:FlxSprite;
	var downText:FlxSprite;
	var fog:FlxSprite;
	var rain:FlxSprite;

	var transitioning:Bool = false;

	var debugKeys:Array<FlxKey>;


	override public function create():Void
	{
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		// Just to load a mod on start up if ya got one. For mods that change the menu music and bg
		WeekData.loadTheFirstEnabledMod();
		
		//trace(path, FileSystem.exists(path));


		
		FlxG.game.focusLostFramerate = 60;
		FlxG.sound.muteKeys = muteKeys;
		FlxG.sound.volumeDownKeys = volumeDownKeys;
		FlxG.sound.volumeUpKeys = volumeUpKeys;
		FlxG.keys.preventDefaultKeys = [TAB];

		
		camBG=new FlxCamera();
		camUI=new FlxCamera();

		camUI.bgColor.alpha = 0;

		FlxG.cameras.reset(camBG);
		FlxG.cameras.add(camUI);
		

		FlxCamera.defaultCameras = [camBG];

		PlayerSettings.init();

		curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

		instObj();

		swagShader = new ColorSwap();
		super.create();

		FlxG.save.bind('LateNightCityTales', 'DaytimefishStudio');

		if(!initialized && FlxG.save.data != null && FlxG.save.data.fullscreen)
		{
			FlxG.fullscreen = FlxG.save.data.fullscreen;
			//trace('LOADED FULLSCREEN SETTING!!');
		}

		if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

		FlxG.sound.play(Paths.sound("rainSound"),0.7,true);
	

		if(isMain||isStoryMain)
		{
			isMain=true;
			isStoryMain=false;

			switch(numberOfMenuItems)
			{
				case 0:
					downText.animation.play('Story');
				case 1:
					downText.animation.play('Freeplay');
				case 2:
					downText.animation.play('Options');
			}
			titleText.alpha=0;
			logoBl.alpha=0;

			new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{	
					FlxTween.tween(downText,{alpha:1},1);
					FlxTween.tween(upText,{alpha:0.8},1);
				});
			FlxG.camera.scroll.y=1120;
		}

		FlxG.mouse.visible = false;
		#if FREEPLAY
		MusicBeatState.switchState(new FreeplayState());
		#elseif CHARTING
		MusicBeatState.switchState(new ChartingState());
		#else
		if(FlxG.save.data.flashing == null && !FlashingState.leftState) {
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			MusicBeatState.switchState(new FlashingState());
		} else {
			#if desktop
			if (!DiscordClient.isInitialized)
			{
				DiscordClient.initialize();
				Application.current.onExit.add (function (exitCode) {
					DiscordClient.shutdown();
				});
			}
			#end

			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				startIntro();
			});
		}
		#end
	}

	var pressedCancel:Bool;
	var pressedEnter:Bool;
	var isTransing:Bool=false;


	override function update(elapsed:Float)
	{
		pressedCancel = FlxG.keys.justPressed.ESCAPE || controls.BACK;
		pressedEnter = FlxG.keys.justPressed.ENTER || controls.ACCEPT;

		if (FlxG.sound.music != null)
		Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		FlxG.watch.addQuick('isMain', isMain);
		FlxG.watch.addQuick('isTitle', isTitle);
		FlxG.watch.addQuick('pressedCancel', pressedCancel);
		FlxG.watch.addQuick('pressedEnter', pressedEnter);
		FlxG.watch.addQuick('numberOfMenuItems', numberOfMenuItems);
		FlxG.watch.addQuick('isTransing', isTransing);
		FlxG.watch.addQuick('numberOfDifficulty',numberOfDifficulty);

		if(isTitle)
			titleUpdate();
		
		if(isMain)
			mainUpdate();

		if(isStoryMain)
			storyMainUpdate();

		if (FlxG.keys.anyJustPressed(debugKeys))
		{
			MusicBeatState.switchState(new MasterEditorMenu());
		}
	
		
		super.update(elapsed);
	}

	function instObj()
	{
		//Titlestate object
		FlxG.camera.zoom=0.7;

		bg = new FlxSprite(-275,-155);
		bg.loadGraphic(Paths.image('titlestate/Title_BG','nightmare'));
		bg.setGraphicSize(Std.int(bg.width * 0.622),Std.int(bg.height));
		bg.updateHitbox();

		logoBl = new FlxSprite(200, -250);
		logoBl.loadGraphic(Paths.image('titlestate/Title_Logo','nightmare'));		
		logoBl.setGraphicSize(Std.int(logoBl.width*0.8),Std.int(logoBl.height*0.8));
		// logoBl.screenCenter();
		// logoBl.color = FlxColor.BLACK;

		titleText = new FlxSprite(100, 646);
		titleText.frames=Paths.getSparrowAtlas('titlestate/Title_Text','nightmare');
		titleText.animation.addByPrefix('idle', "Title_Text PressEnter", 24);
		titleText.animation.play('idle');
		titleText.updateHitbox();

		titleStars=new FlxSprite(-275,-155);
		titleStars.loadGraphic(Paths.image('titlestate/Title_Stars','nightmare'));
		titleStars.setGraphicSize(Std.int(titleStars.width * 0.622),Std.int(titleStars.height));
		titleStars.updateHitbox();


		//当Zoom倍率为0.7时，X的0位置为-275，Y的0位置为-155

		//Mainstate object

		castle = new FlxSprite(-270,1060);
		// castle.frames=Paths.getSparrowAtlas('titlestate/Title_Castle','nightmare');
		// castle.animation.addByPrefix('castleBlur','Title_Castle Title_Castle_Blur',24,false);
		// castle.animation.addByPrefix('castleClear','Title_Castle Title_Castle_Clear',24,false);
		// castle.animation.play('castleBlur');
		castle.loadGraphic(Paths.image('titlestate/castle_all','nightmare'));
		castle.setGraphicSize(Std.int(castle.width * 1.5),Std.int(castle.height*1.3));
		castle.updateHitbox();

		// grass = new FlxSprite(-700,910);
		// grass.frames=Paths.getSparrowAtlas('titlestate/Title_Grass','nightmare');
		// grass.animation.addByPrefix('grassAnim','Title_Grass Title_Grass',24,true);
		// grass.animation.play('grassAnim');
		// grass.updateHitbox();

		// mountains = new FlxSprite(-700,600);
		// mountains.frames=Paths.getSparrowAtlas('titlestate/Title_Mountain','nightmare');
		// mountains.animation.addByPrefix('mountainsBlur','Title_Mountain Title_Mountain_Blur',24,false);
		// mountains.animation.addByPrefix('mountainsClear','Title_Mountain Title_Mountain_Clear',24,false);
		// mountains.animation.play('mountainsBlur');
		// mountains.updateHitbox();


		// treeLeft = new FlxSprite(-490,1250);
		// treeLeft.frames=Paths.getSparrowAtlas('titlestate/Title_TreeLeft','nightmare');
		// treeLeft.animation.addByPrefix('treeLAnim','Title_TreeLeft Title_TreeLeft',24,true);
		// treeLeft.setGraphicSize(Std.int(treeLeft.width * 0.7),Std.int(treeLeft.height*0.7));
		// treeLeft.animation.play('treeLAnim');
		// treeLeft.updateHitbox();

		// treeRight = new FlxSprite(-130,1170);
		// treeRight.frames=Paths.getSparrowAtlas('titlestate/Title_TreeRight','nightmare');
		// treeRight.animation.addByPrefix('treeRAnim','Title_TreeRight Title_TreeRight',24,true);
		// treeRight.setGraphicSize(Std.int(treeRight.width * 0.7),Std.int(treeRight.height*0.7));
		// treeRight.animation.play('treeRAnim');
		// treeRight.updateHitbox();

		downText = new FlxSprite(0,560);
		downText.frames=Paths.getSparrowAtlas('titlestate/Title_Text','nightmare');
		downText.animation.addByPrefix('Story','Title_Text Story',24,true);
		downText.animation.addByPrefix('Easy','Title_Text Easy',24,true);
		downText.animation.addByPrefix('Freeplay','Title_Text Freeplay',24,true);
		downText.animation.addByPrefix('Hard','Title_Text Hard',24,true);
		downText.animation.addByPrefix('Normal','Title_Text Normal',24,true);
		downText.animation.addByPrefix('Options','Title_Text Options',24,true);
		downText.animation.addByPrefix('Credit',"Title_Text Credit",24,true);
		downText.setGraphicSize(Std.int(downText.width * 1),Std.int(downText.height*1));
		downText.animation.play('Story');
		downText.updateHitbox();
		downText.alpha=0;

		upText = new FlxSprite(0,0);
		upText.frames=Paths.getSparrowAtlas('titlestate/Title_Text','nightmare');
		upText.animation.addByPrefix('Tip','Title_Text Tip',24,true);
		upText.animation.addByPrefix('Story','Title_Text Story',24,true);
		upText.setGraphicSize(Std.int(upText.width * 0.4),Std.int(upText.height*0.4));
		upText.animation.play('Tip');
		upText.updateHitbox();
		upText.alpha=0;


		//storyMainState object
		fog=new FlxSprite(-350,900);
		fog.loadGraphic(Paths.image('titlestate/Title_Fog','nightmare'));
		fog.setGraphicSize(Std.int(fog.width * 0.7),Std.int(fog.height*0.7));
		fog.updateHitbox();
		fog.alpha=0;

		rain=new FlxSprite(-275,-155);
		rain.frames=Paths.getSparrowAtlas('titlestate/Rain',"nightmare");
		rain.animation.addByPrefix("rainning",'Rain Rain',24,true);
		rain.setGraphicSize(Std.int(rain.width *1),Std.int(rain.height*1));
		rain.animation.play("rainning");
		rain.updateHitbox();
		
		rain.cameras=[camUI];
		downText.cameras=[camUI];
		upText.cameras=[camUI];
	}

	function startIntro()
	{
		if (!initialized)
		{
			if(FlxG.sound.music == null) {
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

				FlxG.sound.music.fadeIn(4, 0, 0);
			}
		}

		Conductor.changeBPM(102);
		persistentUpdate = true;

		add(bg);
		add(titleStars);
		add(logoBl);
		add(titleText);
		// add(mountains);
		add(castle);
		// add(fog);
		// add(treeLeft);
		// add(treeRight);
		// add(grass);
		add(upText);
		add(downText);
		add(rain);

		var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('logo'));
		logo.screenCenter();
		logo.antialiasing = ClientPrefs.globalAntialiasing;
		// add(logo);

		// FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		// FlxTween.tween(logo, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite(-427,-240).makeGraphic(FlxG.width*2, FlxG.height*2, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = ClientPrefs.globalAntialiasing;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});

		if (initialized)
			skipIntro();
		else
			initialized = true;

		// credGroup.add(credTextShit);
	}

	function titleUpdate():Void
	{
			
		if (!transitioning && skippedIntro)
			{
				if(pressedEnter&&!isTransing)
					{
						isTransing=true;
						isMain=true;
						isTitle=false;
						isStoryMain=false;
						
						if(titleText != null) 
						{
						FlxTween.cancelTweensOf(titleText);
						flashing(titleText,15,0.1);
						}
	
						new FlxTimer().start(2.5, function(tmr:FlxTimer)
							{	
								FlxTween.tween(downText,{alpha:1},1);
								FlxTween.tween(upText,{alpha:0.8},1);
								new FlxTimer().start(0.2, function(tmr:FlxTimer)
									{
										isTransing=false;
									});
							});
							
	
						FlxG.camera.flash(FlxColor.WHITE, 1);
						FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	
						transitioning = true;
						// FlxG.sound.music.stop();
						
						new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							//MusicBeatState.switchState(new TitleState());
							FlxTween.tween(FlxG.camera.scroll,{y:1120},3,{ease: FlxEase.expoOut});
							FlxTween.tween(logoBl,{alpha:0},1);
						});
					}
				}
			
			if (pressedEnter && !skippedIntro)
			{
				skipIntro();
			}
	
			if(titleText.alpha==1)
			breathing(titleText,0.2);
	}

	function mainUpdate():Void
	{
		if(downText.alpha==1)
			breathing(downText,0.7);

			if(pressedCancel&&!isTransing)
			{
				isTransing = true;
				isMain=false;
				isTitle=true;
				isStoryMain=false;

				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.cancelTweensOf(downText);
				if(titleText != null) 
				{
				new FlxTimer().start(2.5, function(tmr:FlxTimer)
					{	
						FlxTween.tween(titleText,{alpha:1},1);
						FlxTween.tween(logoBl,{alpha:1},1);
						new FlxTimer().start(0.2, function(tmr:FlxTimer)
							{
								isTransing=false;
							});
					});
				}	

				transitioning = false;
				// FlxG.sound.music.stop();
					
				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						//MusicBeatState.switchState(new TitleState());
						FlxTween.tween(FlxG.camera.scroll,{y:0},3,{ease: FlxEase.expoOut});
						FlxTween.tween(downText,{alpha:0},1);
						FlxTween.tween(upText,{alpha:0},1);
					});
				

			}

			if(controls.UI_LEFT_P||controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				numberOfMenuItems--;
				if(numberOfMenuItems<0)				
					numberOfMenuItems = 3;								
			}
			if(controls.UI_RIGHT_P||controls.UI_UP_P)
			{				
				numberOfMenuItems++;
				FlxG.sound.play(Paths.sound('scrollMenu'));				
				if(numberOfMenuItems>3)
					numberOfMenuItems = 0;
			}
			if(!isTransing)
			{
			switch(numberOfMenuItems)
				{
					case 0:
						downText.animation.play('Story');
					case 1:
						downText.animation.play('Freeplay');
					case 2:
						downText.animation.play('Credit');
					case 3:
						downText.animation.play('Options');
				}
			}

			if(pressedEnter&&!isTransing&&numberOfMenuItems==0)
			{	
				isTransing=true;
				isMain=false;
				isTitle=false;
				isStoryMain=true;

				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				FlxTween.cancelTweensOf(downText);
				// castle.animation.play('castleClear');
				// mountains.animation.play('mountainsClear');
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						// FlxTween.tween(FlxG.camera,{zoom:1},1.5);
						// FlxTween.tween(grass,{y:1200},1.5);
						// FlxTween.tween(treeLeft,{x:-1000},1.5);
						// FlxTween.tween(treeRight,{x:100},1.5);
					});
				FlxTween.tween(upText,{alpha:0},1,{onComplete:function(twn:FlxTween)
				{
					upText.animation.play('Story');
					FlxTween.tween(upText,{alpha:0.8},1);
				}});

				FlxTween.tween(downText,{alpha:0},1,{onComplete:function(twn:FlxTween)
					{
						downText.animation.play('Normal');
						FlxTween.tween(fog,{alpha:1},1);
						FlxTween.tween(downText,{alpha:1},1,{onComplete:function(twn:FlxTween){isTransing=false;}});
					}});
			}
			else if (pressedEnter&&!isTransing&&numberOfMenuItems==1)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				MusicBeatState.switchState(new FreeplayState());
				FlxTween.tween(upText,{alpha:0},0.5);
				FlxTween.tween(downText,{alpha:0},0.5);
			}
			else if (pressedEnter&&!isTransing&&numberOfMenuItems==2)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				LoadingState.loadAndSwitchState(new CreditsState());
				FlxTween.tween(upText,{alpha:0},0.5);
				FlxTween.tween(downText,{alpha:0},0.5);		
			}
			else if(pressedEnter&&!isTransing&&numberOfMenuItems==3)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				LoadingState.loadAndSwitchState(new options.OptionsState());
				FlxTween.tween(upText,{alpha:0},0.5);
				FlxTween.tween(downText,{alpha:0},0.5);				
			}

	}
	
	function storyMainUpdate():Void
	{
		if(downText.alpha==1)
			breathing(downText,0.7);
	
		if(pressedCancel&&!isTransing)
		{
				isTransing=true;
				isMain=true;
				isTitle=false;
				isStoryMain=false;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.cancelTweensOf(downText);
				FlxTween.tween(fog,{alpha:0},1);
				// castle.animation.play('castleBlur');
				// mountains.animation.play('mountainsBlur');

				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						// FlxTween.tween(FlxG.camera,{zoom:0.7},1.5);
						// FlxTween.tween(grass,{y:910},1.5);
						// FlxTween.tween(treeLeft,{x:-490},1.5);
						// FlxTween.tween(treeRight,{x:-130},1.5);
					});
				FlxTween.tween(upText,{alpha:0},1,{onComplete:function(twn:FlxTween)
				{
					upText.animation.play('Tip');
					FlxTween.tween(upText,{alpha:0.8},1);
				}});
				FlxTween.tween(downText,{alpha:0},1,{onComplete:function(twn:FlxTween)
					{
						downText.animation.play('Story');
						numberOfDifficulty=1;
						FlxTween.tween(downText,{alpha:1},1,{onComplete:function(twn:FlxTween){isTransing=false;}});
						
					}});
		}
		if(controls.UI_LEFT_P||controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				numberOfDifficulty--;
				if(numberOfDifficulty<0)				
					numberOfDifficulty = 2;								
			}
		if(controls.UI_RIGHT_P||controls.UI_UP_P)
			{				
				numberOfDifficulty++;
				FlxG.sound.play(Paths.sound('scrollMenu'));				
				if(numberOfDifficulty>2)
					numberOfDifficulty = 0;
			}

		if(!isTransing)
			{
			switch(numberOfDifficulty)
				{
					case 0:
						downText.animation.play('Easy');
					case 1:
						downText.animation.play('Normal');
					case 2:
						downText.animation.play('Hard');
				}
			}

		if(pressedEnter&&!isTransing)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
				goToPlaystate(numberOfDifficulty);
			}

	}

	function goToPlaystate(diff:Int):Void
		{
			PlayState.storyPlaylist = ['Bopeebo','Fresh','Dad Battle'];
			PlayState.isStoryMode = true;

			CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
			var diffic = CoolUtil.getDifficultyFilePath(diff);
			if(diffic == null)
			diffic = '';

			PlayState.storyDifficulty = diff;
			PlayState.storyWeek=1;
			PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
			PlayState.campaignScore = 0;
			PlayState.campaignMisses = 0;
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
			});
		}


	function getIntroTextShit():Array<Array<String>>
		{
			var fullText:String = Assets.getText(Paths.txt('introText'));
	
			var firstArray:Array<String> = fullText.split('\n');
			var swagGoodArray:Array<Array<String>> = [];
	
			for (i in firstArray)
			{
				swagGoodArray.push(i.split('--'));
			}
	
			return swagGoodArray;
		}
	
	function createCoolText(textArray:Array<String>, ?offset:Float = 0)
		{
			for (i in 0...textArray.length)
			{
				var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
				money.screenCenter(X);
				money.y += (i * 60) + 200 + offset;
				if(credGroup != null && textGroup != null) {
					credGroup.add(money);
					textGroup.add(money);
				}
			}
		}

	function addMoreText(text:String, ?offset:Float = 0)
	{
		if(textGroup != null && credGroup != null) {
			var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
			coolText.screenCenter(X);
			coolText.y += (textGroup.length * 60) + 200 + offset;
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}	

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	private var sickBeats:Int = 0; //Basically curBeat but won't be skipped if you hold the tab or resize the screen
	public static var closedState:Bool = false;
	override function beatHit()
	{
		super.beatHit();

		// if(logoBl != null) 
		// 	logoBl.animation.play('bump', true);

		// if(gfDance != null) {
		// 	danceLeft = !danceLeft;

		// 	if (danceLeft)
		// 		gfDance.animation.play('danceRight');
		// 	else
		// 		gfDance.animation.play('danceLeft');
		// }

		if(!closedState) {
			sickBeats++;
			switch (sickBeats)
			{
				case 1:
					#if PSYCH_WATERMARKS
					createCoolText(['Psych Engine by'], 15);
					#else
					createCoolText(['ninjamuffin99', 'phantomArcade', 'kawaisprite', 'evilsk8er']);
					#end
				// credTextShit.visible = true;
				case 3:
					#if PSYCH_WATERMARKS
					addMoreText('Shadow Mario', 15);
					addMoreText('RiverOaken', 15);
					addMoreText('shubs', 15);
					#else
					addMoreText('present');
					#end
				// credTextShit.text += '\npresent...';
				// credTextShit.addText();
				case 4:
					deleteCoolText();
				// credTextShit.visible = false;
				// credTextShit.text = 'In association \nwith';
				// credTextShit.screenCenter();
				case 5:
					#if PSYCH_WATERMARKS
					createCoolText(['Not associated', 'with'], -40);
					#else
					createCoolText(['In association', 'with'], -40);
					#end
				case 7:
					addMoreText('newgrounds', -40);
					ngSpr.visible = true;
				// credTextShit.text += '\nNewgrounds';
				case 8:
					deleteCoolText();
					ngSpr.visible = false;
				// credTextShit.visible = false;

				// credTextShit.text = 'Shoutouts Tom Fulp';
				// credTextShit.screenCenter();
				case 9:
					createCoolText([curWacky[0]]);
				// credTextShit.visible = true;
				case 11:
					addMoreText(curWacky[1]);
				// credTextShit.text += '\nlmao';
				case 12:
					deleteCoolText();
				// credTextShit.visible = false;
				// credTextShit.text = "Friday";
				// credTextShit.screenCenter();
				case 13:
					addMoreText('Friday');
				// credTextShit.visible = true;
				case 14:
					addMoreText('Night');
				// credTextShit.text += '\nNight';
				case 15:
					addMoreText('Funkin'); // credTextShit.text += '\nFunkin';

				case 16:
					skipIntro();
			}
		}
	}

	var skippedIntro:Bool = false;
	var increaseVolume:Bool = false;
	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);
			if(isTitle)
			FlxG.camera.flash(FlxColor.WHITE, 4);
			else
			FlxG.camera.flash(FlxColor.WHITE, 1);

			remove(credGroup);
			skippedIntro = true;
		}
	}

	public function breathing(obj:Dynamic,targetAlpha:Float)
		{
			FlxTween.tween(obj,{alpha:targetAlpha},2.0,{
				onComplete:function(tween:FlxTween)
					{
						FlxTween.tween(obj,{alpha:1},2.0);
					}
				});
		}
		
	public function flashing(obj:Dynamic,loops:Int=1,flashTime:Float=0.2)
		{
			new FlxTimer().start(flashTime,function(tmr:FlxTimer)
				{
					obj.alpha=0.99;
					new FlxTimer().start(flashTime, function(tmr:FlxTimer)
						{
							obj.alpha=0;
						});
				},loops);
		}
}
