package;

import flixel.addons.effects.chainable.FlxShakeEffect;
import flixel.addons.effects.chainable.FlxEffectSprite;
#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import openfl.filters.BitmapFilter;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.addons.effects.chainable.FlxOutlineEffect;
import flixel.addons.effects.chainable.FlxRainbowEffect;
import flixel.addons.effects.chainable.FlxShakeEffect;
import flixel.addons.effects.chainable.FlxTrailEffect;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.effects.chainable.IFlxEffect;

#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var creditsName:Array<String> = [
		"fraze",
		"bonk",
		"danke",
		"lunar",
		"nag",
		"red",
		"rt",
		"var",
		"other"
	];
	var creditCharacters:Array<FlxSprite>=[];
	var creditBGs:Array<FlxSprite>=[];
	var creditCharacterA:FlxSprite;
	var creditCharacterB:FlxSprite;
	var creditCharacterC:FlxSprite;
	var creditBGA:FlxSprite;
	var creditBGB:FlxSprite;
	var creditBGC:FlxSprite;
	var creditFrame:FlxSprite;
	var creditTextNormal:FlxSprite;
	var creditTextSpecial:FlxSprite;
	var creditFX:FlxSprite;

	var creditOperand:Int=0;
	var characterOperandCenter=0;
	var characterOperandLeft=1;	
	var characterOperandRight=2;

	var characterAFlag:Int=0;
	var characterBFlag:Int=0;
	var characterCFlag:Int=1;

	var animPlaying:Bool = false;

	var _effectCreditTextSpecial:FlxEffectSprite;
	var _effectShake:FlxShakeEffect;

	var camBG:FlxCamera;
	var camTX:FlxCamera;
	var camCH:FlxCamera;

	public function init():Void
        {  	
			creditCharacterA = new FlxSprite();
			creditCharacterB = new FlxSprite(-1280,0);
			creditCharacterC = new FlxSprite(1280,0);
            creditBGA=new FlxSprite();
			creditBGB=new FlxSprite();
			creditBGC=new FlxSprite();
            creditFrame=new FlxSprite();
            creditTextNormal = new FlxSprite();
            creditTextSpecial = new FlxSprite();
			creditFX = new FlxSprite();

			creditCharacters=[creditCharacterA,creditCharacterB,creditCharacterC];
			creditBGs=[creditBGA,creditBGB,creditBGC];

			camBG=new FlxCamera();
			camTX=new FlxCamera();
			camCH=new FlxCamera();

			FlxG.cameras.reset(camBG);
			FlxG.cameras.add(camCH);
			FlxG.cameras.add(camTX);

			creditFX.visible = false;
			
			camTX.bgColor.alpha = 0;
			camCH.bgColor.alpha = 0;

			FlxG.cameras.setDefaultDrawTarget(camBG,true);

			creditBGA.cameras=[camBG];
			creditBGB.cameras=[camBG];
			creditBGC.cameras=[camBG];
			creditFrame.cameras=[camBG];

			creditTextNormal.cameras=[camTX];
			creditTextSpecial.cameras=[camTX];

			creditCharacterA.cameras=[camCH];
			creditCharacterB.cameras=[camCH];
			creditCharacterC.cameras=[camCH];
			creditFX.cameras = [camCH];

			creditCharacterB.alpha=0;
			creditCharacterC.alpha=0;

			creditTextNormal.alpha=0;
			creditTextSpecial.alpha=0;

			creditBGB.alpha=0;
			creditBGC.alpha=0;

            _effectShake=new FlxShakeEffect(5,0.5,function()_effectShake.start());
            _effectCreditTextSpecial = new FlxEffectSprite(creditTextSpecial,[_effectShake]);

			characterAFlag=0;
			characterBFlag=1;
			characterCFlag=creditsName.length-1;
			creditOperand=0;

			animPlaying=true;
			
			BGLoad();
            CharacterLoad();
			LoadTextImage();

			creditFrame.loadGraphic(Paths.image("credits/credit_frame",'nightmare'));

            add(creditBGA);
			add(creditBGB);
            add(creditBGC);
            add(creditFrame);
            add(creditCharacterA);
			add(creditCharacterB);
			add(creditCharacterC);
			add(creditFX);
            add(creditTextNormal);
            add(_effectCreditTextSpecial);
            // _effectShake.start();

			FlxTween.tween(creditTextNormal,{alpha:1},0.5,{onComplete:function(twn:FlxTween)
				{
				creditFX.visible=true;
				camTX.flash(FlxColor.WHITE, 0.5);
				creditTextSpecial.alpha=1;
				animPlaying=false;
				_effectShake.start();}});
       			}

	override function create():Void
	{
			super.create();
			init();
	}
	override function update(elapsed:Float)
	{
		if(controls.UI_RIGHT_P&&!animPlaying)
		{
			if(creditOperand<creditsName.length-1)
			creditOperand++;
			else
			creditOperand = 0;

			CharacterChangeRight();
			ChangeBackgroundAndText();

		}

		if(controls.UI_LEFT_P&&!animPlaying)
		{
			if(creditOperand>0)
			creditOperand--;
			else
			creditOperand = creditsName.length-1;

			CharacterChangeLeft();
			ChangeBackgroundAndText();

		}

		if(controls.BACK)
		{
			MusicBeatState.switchState(new TitleState());
		}

		FlxG.watch.addQuick('CreaditNum', creditOperand);
		FlxG.watch.addQuick('ArrayLength', creditsName.length);
		FlxG.watch.addQuick('characterAFlag', characterAFlag);
		FlxG.watch.addQuick('characterBFlag', characterBFlag);
		FlxG.watch.addQuick('characterCFlag', characterCFlag);
		FlxG.watch.addQuick('characterOperandCenter', characterOperandCenter);
		FlxG.watch.addQuick('characterOperandLeft', characterOperandLeft);
		FlxG.watch.addQuick('characterOperandRight', characterOperandRight);

		super.update(elapsed);
	}
	public function ChangeBackgroundAndText()
	{
		animPlaying=true;
		TextFadeOut();
	}
	public function TextFadeOut()
	{
		creditTextNormal.alpha=0;
		creditTextSpecial.alpha=0;
		LoadTextImage();
	}

	public function LoadTextImage()
    {
        creditTextNormal.loadGraphic(Paths.image("credits/"+creditsName[creditOperand]+'/credit_'+creditsName[creditOperand]+'_text_white','nightmare'));
        creditTextSpecial.loadGraphic(Paths.image("credits/"+creditsName[creditOperand]+'/credit_'+creditsName[creditOperand]+'_text_special','nightmare'));
    }

	public function BGLoad()
		{
			creditBGA.loadGraphic(Paths.image("credits/"+creditsName[characterAFlag]+'/credit_'+creditsName[characterAFlag]+'_bg','nightmare'));
			creditBGB.loadGraphic(Paths.image("credits/"+creditsName[characterBFlag]+'/credit_'+creditsName[characterBFlag]+'_bg','nightmare'));
			creditBGC.loadGraphic(Paths.image("credits/"+creditsName[characterCFlag]+'/credit_'+creditsName[characterCFlag]+'_bg','nightmare'));

		}
	public function CharacterLoad()
	{
		creditCharacterA.loadGraphic(Paths.image("credits/"+creditsName[characterAFlag]+'/credit_'+creditsName[characterAFlag]+'_char','nightmare'));
		creditCharacterB.loadGraphic(Paths.image("credits/"+creditsName[characterBFlag]+'/credit_'+creditsName[characterBFlag]+'_char','nightmare'));
		creditCharacterC.loadGraphic(Paths.image("credits/"+creditsName[characterCFlag]+'/credit_'+creditsName[characterCFlag]+'_char','nightmare'));
		creditFX.loadGraphic(Paths.image("credits/"+creditsName[creditOperand]+'/credit_'+creditsName[creditOperand]+'_fx','nightmare'));
	}

	public function CharacterChangeRight()
	{
		creditFX.visible=false;
		FlxTween.tween(creditBGs[characterOperandCenter],{alpha:0},1);
		FlxTween.tween(creditBGs[characterOperandLeft],{alpha:1},1);
		FlxTween.tween(creditCharacters[characterOperandCenter],{x:1280,alpha:0},1,{ease: FlxEase.expoOut});
		FlxTween.tween(creditCharacters[characterOperandLeft],{x:0,alpha:1},1,
			{ease: FlxEase.expoOut,onComplete:function(twn:FlxTween)
			{
				FlxTween.tween(creditTextNormal,{alpha:1},1,{onComplete:function(twn:FlxTween)
					{
					creditFX.visible=true;
					camTX.flash(FlxColor.WHITE, 0.5);
					creditTextSpecial.alpha=1;
					animPlaying=false;}});

			}});
		creditCharacters[characterOperandRight].setPosition(-1280,0);

		if(characterOperandRight==0)
			{
				characterAFlag+=3;
				if(characterAFlag>creditsName.length-1)
				characterAFlag=(characterAFlag%(creditsName.length-1))-1;
			}
		else if(characterOperandRight==1)
			{
				characterBFlag+=3;
				if(characterBFlag>creditsName.length-1)
				characterBFlag=(characterBFlag%(creditsName.length-1))-1;
			}
		else if(characterOperandRight==2)
			{
				characterCFlag+=3;
				if(characterCFlag>creditsName.length-1)
				characterCFlag=(characterCFlag%(creditsName.length-1))-1;
			}
			
		BGLoad();
		CharacterLoad();
		characterOperandRight++;
		characterOperandLeft++;
		characterOperandCenter++;
		if(characterOperandRight>2)
			characterOperandRight=0;
		else if(characterOperandLeft>2)
			characterOperandLeft=0;
		else if(characterOperandCenter>2)
			characterOperandCenter=0;

	}

	public function CharacterChangeLeft()
		{
			creditFX.visible=false;
			FlxTween.tween(creditBGs[characterOperandCenter],{alpha:0},1);
			FlxTween.tween(creditBGs[characterOperandRight],{alpha:1},1);
			FlxTween.tween(creditCharacters[characterOperandCenter],{x:-1280,alpha:0},1,{ease: FlxEase.expoOut});
			FlxTween.tween(creditCharacters[characterOperandRight],{x:0,alpha:1},1,
				{ease: FlxEase.expoOut,onComplete:function(twn:FlxTween)
				{
					FlxTween.tween(creditTextNormal,{alpha:1},0.5,{onComplete:function(twn:FlxTween)
					{
					creditFX.visible=true;
					camTX.flash(FlxColor.WHITE, 0.5);
					creditTextSpecial.alpha=1;
					animPlaying=false;}});
				}});
			creditCharacters[characterOperandLeft].setPosition(1280,0);
	
			if(characterOperandLeft==0)
				{
					characterAFlag-=3;
					if(characterAFlag<0)
					characterAFlag=characterAFlag+creditsName.length;
				}
			else if(characterOperandLeft==1)
				{
					characterBFlag-=3;
					if(characterBFlag<0)
					characterBFlag=characterBFlag+creditsName.length;
				}
			else if(characterOperandLeft==2)
				{
					characterCFlag-=3;
					if(characterCFlag<0)
					characterCFlag=characterCFlag+creditsName.length;
				}
			BGLoad();
			CharacterLoad();
			characterOperandRight--;
			characterOperandLeft--;
			characterOperandCenter--;
			if(characterOperandRight<0)
				characterOperandRight=2;
			else if(characterOperandLeft<0)
				characterOperandLeft=2;
			else if(characterOperandCenter<0)
				characterOperandCenter=2;
	
		}
}