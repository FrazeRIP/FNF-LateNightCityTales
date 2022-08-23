import flixel.util.FlxTimer;
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

class OpeningState extends MusicBeatState
{
    var opening:FlxVideo;

    override function create()
    {
        super.create();
        FlxG.sound.music.volume=0;

        opening=new FlxVideo(Paths.video("Opening"));
        opening.finishCallback=function() 
        {
            FlxG.switchState(new LoadingState(new PlayState(),true,'nightmare'));
        }
    }
    override function update(elapsed:Float)
    {
        if((FlxG.keys.justPressed.ESCAPE||FlxG.keys.justPressed.ENTER))
        {
            opening.onVLCComplete();
        }
    }
}