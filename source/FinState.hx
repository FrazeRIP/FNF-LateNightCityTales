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
import openfl.utils.Assets as OpenFlAssets;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import FlxVideo;

#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class FinState extends MusicBeatState
{
    var thanksforplaying:FlxSprite;
    var fin:FlxVideo;

    override function create()
    {
        if(FlxG.sound.music!=null)
        {
            FlxG.sound.music.volume=0;
        }
        thanksforplaying=new FlxSprite();
        thanksforplaying.loadGraphic(Paths.image("thankyou","nightmare"));
        thanksforplaying.alpha=0;
        add(thanksforplaying);

        fin=new FlxVideo(Paths.video("final"));
        fin.finishCallback=function()
        {
            FlxTween.tween(thanksforplaying,{alpha:1},1.5);
        }

        TitleState.unlockHideStage=true;
        FlxG.save.data.unlockHideStage=TitleState.unlockHideStage;
        FlxG.save.flush();		
    }
    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.ENTER&&thanksforplaying.alpha==1)
            {
                MusicBeatState.switchState(new TitleState());
            }
    }
}
