package;

import haxe.io.Input;
import flixel.addons.effects.chainable.FlxShakeEffect;
import flixel.addons.effects.chainable.FlxEffectSprite;
#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;


#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;
class WarningState extends MusicBeatState
{
    var warningInfo:FlxSprite;
    var youCanPreesed:Bool=false;
    override function create()
    {
        FlxG.save.bind('LateNightCityTales', 'DaytimefishStudio');

        PlayerSettings.init();
		
		ClientPrefs.loadPrefs();
		
		Highscore.load();
        
        FlxG.mouse.visible = false;

        if(FlxG.save.data.flashing == null && !FlashingState.leftState) 
        {
            FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
            FlxG.save.data.flashing =true;
            FlashingState.leftState=true;
        }

        warningInfo=new FlxSprite();
        warningInfo.loadGraphic(Paths.image("Disclaimer","nightmare"));
        warningInfo.alpha = 0;
        add(warningInfo);
        FlxTween.tween(warningInfo,{alpha:1},1,{onComplete:function(twn:FlxTween){youCanPreesed=true;}});

    }

    override function update(elapsed:Float)
    {        
        if(youCanPreesed)
        {
            if(FlxG.keys.justPressed.ANY)
            {
                youCanPreesed=false;
                FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                FlxG.camera.flash(FlxColor.BLACK, 2);
                new FlxTimer().start(2, function(tmr:FlxTimer)
                    {
                        FlxTween.tween(warningInfo,{alpha:0},1,{onComplete:function(twn:FlxTween){LoadingState.loadAndSwitchState(new TitleState());}});
                    });
            }
        }
    }
}