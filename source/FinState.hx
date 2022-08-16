package;

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

    var jukeBoxTag:FlxSprite;
    var jukeBox:FlxSprite;
    var jukeBoxText:FlxText;
    var jukeBoxSubText:FlxText;
    
    var canContinue:Bool= false;
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

        jukeBoxTag=new FlxSprite(1300-19,20);
        jukeBoxTag.makeGraphic(400+19, 90,0xFF3A0078);
        jukeBoxTag.alpha=1;
        add(jukeBoxTag);

        jukeBox=new FlxSprite(1310-19,20).makeGraphic(390, 90,0xFF000000);
        jukeBox.alpha=1;
        add(jukeBox);

        jukeBoxText=new FlxText(1305-19, 32,300,"Something strange happened", 16);
        jukeBoxText.alignment=LEFT;
        add(jukeBoxText);

        jukeBoxSubText=new FlxText(1305-19,62,300,"in the 'Freeplay' Menu...",16);
        jukeBoxSubText.alignment=LEFT;
        add(jukeBoxSubText);

        fin=new FlxVideo(Paths.video("final"));
        fin.finishCallback=function()
        {
            FlxTween.tween(thanksforplaying,{alpha:1},1.5,{onComplete:function(twn:FlxTween)
				{
                    // if(TitleState.unlockHideStage!=true)
                    // {
                    TipTextStart();
                    TitleState.unlockHideStage=true;
                    FlxG.save.data.unlockHideStage=TitleState.unlockHideStage;
                    FlxG.save.flush();
                    // }

                    new FlxTimer().start(0.5,function(tmr:FlxTimer)
                        {	
                            canContinue=true;
                        });
				}});
            
        }

    }
    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.ENTER&&thanksforplaying.alpha==1&&canContinue)
            {
                MusicBeatState.switchState(new TitleState());
            }
    }

    public function TipTextStart():Void
    {
        FlxTween.tween(jukeBoxTag,{x:870},1.2,{ease:FlxEase.circInOut});
        FlxTween.tween(jukeBox,{x:870},1.5,{ease:FlxEase.circInOut});
        FlxTween.tween(jukeBoxText,{x:910},1.5,{ease:FlxEase.circInOut});
        FlxTween.tween(jukeBoxSubText,{x:910},1.5,{ease:FlxEase.circInOut});

        new FlxTimer().start(6, function(tmr:FlxTimer)
            {	
                FlxTween.tween(jukeBoxTag,{x:1300},1.8,{ease:FlxEase.circInOut});
                FlxTween.tween(jukeBox,{x:1300},1.5,{ease:FlxEase.circInOut});
                FlxTween.tween(jukeBoxText,{x:1300},1.2,{ease:FlxEase.circInOut});
                FlxTween.tween(jukeBoxSubText,{x:1300},1.2,{ease:FlxEase.circInOut});
            });
    }
}
