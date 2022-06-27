package;

import flixel.addons.effects.chainable.FlxShakeEffect;
import flixel.addons.effects.chainable.FlxEffectSprite;
#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
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
		//"fraze",
		"bonk",
		"danke"
	];
	var creditCharacter:FlxSprite;
	var creditBG:FlxSprite;
	var creditFrame:FlxSprite;
	var creditTextNormal:FlxSprite;
	var creditTextSpecial:FlxSprite;
	var creditControlNum:Int=0;

	var _effectCreditTextSpecial:FlxEffectSprite;
	var _effectShake:FlxShakeEffect;
	public function init():Void
	{
		creditCharacter = new FlxSprite();
		creditBG=new FlxSprite(0,0);
		creditFrame=new FlxSprite();
		creditTextNormal = new FlxSprite();
		creditTextSpecial = new FlxSprite();
		_effectShake=new FlxShakeEffect(5,0.5,function()_effectShake.start());
		_effectCreditTextSpecial = new FlxEffectSprite(creditTextSpecial,[_effectShake]);
		creditCharacter.loadGraphic(Paths.image("credits/"+creditsName[0]+'/credit_'+creditsName[0]+'_char','nightmare'));
		creditBG.loadGraphic(Paths.image("credits/"+creditsName[0]+'/credit_'+creditsName[0]+'_bg','nightmare'));
		creditFrame.loadGraphic(Paths.image("credits/credit_frame",'nightmare'));
		creditTextNormal.loadGraphic(Paths.image("credits/"+creditsName[0]+'/credit_'+creditsName[0]+'_text_white','nightmare'));
		creditTextSpecial.loadGraphic(Paths.image("credits/"+creditsName[0]+'/credit_'+creditsName[0]+'_text_special','nightmare'));
		add(creditBG);
		add(creditFrame);
		add(creditCharacter);
		add(creditTextNormal);
		add(_effectCreditTextSpecial);
		_effectShake.start();
	}
	override function create():Void
	{
			super.create();
			init();
	}
	override function update(elapsed:Float)
	{
		
		if(controls.UI_RIGHT_P)
		{
			if(creditControlNum<creditsName.length-1)
			creditControlNum++;
			else
			creditControlNum = 0;

			_effectShake.start();
			ReadCredit();
		}
		if(controls.UI_LEFT_P)
		{
			if(creditControlNum>0)
			creditControlNum--;
			else
			creditControlNum = creditsName.length-1;

			_effectShake.start();
			ReadCredit();
		}
		if(controls.BACK)
		{
			MusicBeatState.switchState(new TitleState());
		}
		FlxG.watch.addQuick('CreaditNum', creditControlNum);
		FlxG.watch.addQuick('ArrayLength', creditsName.length);

		super.update(elapsed);
	}
	public function ReadCredit()
	{
		creditCharacter.loadGraphic(Paths.image("credits/"+creditsName[creditControlNum]+'/credit_'+creditsName[creditControlNum]+'_char','nightmare'));
		creditBG.loadGraphic(Paths.image("credits/"+creditsName[creditControlNum]+'/credit_'+creditsName[creditControlNum]+'_bg','nightmare'));
		creditTextNormal.loadGraphic(Paths.image("credits/"+creditsName[creditControlNum]+'/credit_'+creditsName[creditControlNum]+'_text_white','nightmare'));
		creditTextSpecial.loadGraphic(Paths.image("credits/"+creditsName[creditControlNum]+'/credit_'+creditsName[creditControlNum]+'_text_special','nightmare'));
	}
}