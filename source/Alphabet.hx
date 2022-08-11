package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import flash.media.Sound;

using StringTools;

/**
 * Loosley based on FlxTypeText lolol
 */
class Alphabet extends FlxSpriteGroup
{
	public var delay:Float = 0.05;
	public var paused:Bool = false;

	// for menu shit
	public var forceX:Float = Math.NEGATIVE_INFINITY;
	public var targetY:Float = 0;
	public var yMult:Float = 120;
	public var xAdd:Float = 0;
	public var yAdd:Float = 0;
	public var isMenuItem:Bool = false;
	public var textSize:Float = 1.0;

	public var text:String = "";

	var _finalText:String = "";
	var yMulti:Float = 1;

	// custom shit
	// amp, backslash, question mark, apostrophy, comma, angry faic, period
	var lastSprite:AlphaCharacter;
	var xPosResetted:Bool = false;

	var splitWords:Array<String> = [];

	public var isBold:Bool = false;
	public var lettersArray:Array<AlphaCharacter> = [];

	public var finishedText:Bool = false;
	public var typed:Bool = false;

	public var typingSpeed:Float = 0.05;
	public function new(x:Float, y:Float, text:String = "", ?bold:Bool = false, typed:Bool = false, ?typingSpeed:Float = 0.05, ?textSize:Float = 1)
	{
		super(x, y);
		forceX = Math.NEGATIVE_INFINITY;
		this.textSize = textSize;

		_finalText = text;
		this.text = text;
		this.typed = typed;
		isBold = bold;

		if (text != "")
		{
			if (typed)
			{
				startTypedText(typingSpeed);
			}
			else
			{
				addText();
			}
		} else {
			finishedText = true;
		}
	}

	public function changeText(newText:String, newTypingSpeed:Float = -1)
	{
		for (i in 0...lettersArray.length) {
			var letter = lettersArray[0];
			letter.destroy();
			remove(letter);
			lettersArray.remove(letter);
		}
		lettersArray = [];
		splitWords = [];
		loopNum = 0;
		xPos = 0;
		curRow = 0;
		consecutiveSpaces = 0;
		xPosResetted = false;
		finishedText = false;
		lastSprite = null;

		var lastX = x;
		x = 0;
		_finalText = newText;
		text = newText;
		if(newTypingSpeed != -1) {
			typingSpeed = newTypingSpeed;
		}

		if (text != "") {
			if (typed)
			{
				startTypedText(typingSpeed);
			} else {
				addText();
			}
		} else {
			finishedText = true;
		}
		x = lastX;
	}

	public function addText()
	{
		doSplitWords();

		var xPos:Float = 0;
		for (character in splitWords)
		{
			// if (character.fastCodeAt() == " ")
			// {
			// }

			var spaceChar:Bool = (character == " " || (isBold && character == "_"));
			if (spaceChar)
			{
				consecutiveSpaces++;
			}

			var isNumber:Bool = AlphaCharacter.numbers.indexOf(character) != -1;
			var isSymbol:Bool = AlphaCharacter.symbols.indexOf(character) != -1;
			var isAlphabet:Bool = AlphaCharacter.alphabet.indexOf(character.toLowerCase()) != -1;
			if ((isAlphabet || isSymbol || isNumber) && (!isBold || !spaceChar))
			{
				if (lastSprite != null)
				{
					xPos = lastSprite.x + lastSprite.width;
				}

				if (consecutiveSpaces > 0)
				{
					xPos += 40 * consecutiveSpaces * textSize;
				}
				consecutiveSpaces = 0;

				// var letter:AlphaCharacter = new AlphaCharacter(30 * loopNum, 0, textSize);
				var letter:AlphaCharacter = new AlphaCharacter(xPos, 0, textSize);

				if (isBold)
				{
					if (isNumber)
					{
						letter.createBoldNumber(character);
					}
					else if (isSymbol)
					{
						letter.createBoldSymbol(character);
					}
					else
					{
						letter.createBoldLetter(character);
					}
				}
				else
				{
					if (isNumber)
					{
						letter.createNumber(character);
					}
					else if (isSymbol)
					{
						letter.createSymbol(character);
					}
					else
					{
						letter.createLetter(character);
					}
				}

				add(letter);
				lettersArray.push(letter);

				lastSprite = letter;
			}

			// loopNum += 1;
		}
	}

	function doSplitWords():Void
	{
		splitWords = _finalText.split("");
	}

	var loopNum:Int = 0;
	var xPos:Float = 0;
	public var curRow:Int = 0;
	var dialogueSound:FlxSound = null;
	private static var soundDialog:Sound = null;
	var consecutiveSpaces:Int = 0;
	public static function setDialogueSound(name:String = '')
	{
		if (name == null || name.trim() == '') name = 'dialogue';
		soundDialog = Paths.sound(name);
		if(soundDialog == null) soundDialog = Paths.sound('dialogue');
	}

	var typeTimer:FlxTimer = null;
	public function startTypedText(speed:Float):Void
	{
		_finalText = text;
		doSplitWords();

		// trace(arrayShit);

		if(soundDialog == null)
		{
			Alphabet.setDialogueSound();
		}

		if(speed <= 0) {
			while(!finishedText) { 
				timerCheck();
			}
			if(dialogueSound != null) dialogueSound.stop();
			dialogueSound = FlxG.sound.play(soundDialog);
		} else {
			typeTimer = new FlxTimer().start(0.1, function(tmr:FlxTimer) {
				typeTimer = new FlxTimer().start(speed, function(tmr:FlxTimer) {
					timerCheck(tmr);
				}, 0);
			});
		}
	}

	var LONG_TEXT_ADD:Float = -24; //text is over 2 rows long, make it go up a bit
	public function timerCheck(?tmr:FlxTimer = null) {
		var autoBreak:Bool = false;
		if ((loopNum <= splitWords.length - 2 && splitWords[loopNum] == "\\" && splitWords[loopNum+1] == "n") ||
			((autoBreak = true) && xPos >= FlxG.width * 0.65 && splitWords[loopNum] == ' ' ))
		{
			if(autoBreak) {
				if(tmr != null) tmr.loops -= 1;
				loopNum += 1;
			} else {
				if(tmr != null) tmr.loops -= 2;
				loopNum += 2;
			}
			yMulti += 1;
			xPosResetted = true;
			xPos = 0;
			curRow += 1;
			if(curRow == 2) y += LONG_TEXT_ADD;
		}

		if(loopNum <= splitWords.length && splitWords[loopNum] != null) {
			var spaceChar:Bool = (splitWords[loopNum] == " " || (isBold && splitWords[loopNum] == "_"));
			if (spaceChar)
			{
				consecutiveSpaces++;
			}

			var isNumber:Bool = AlphaCharacter.numbers.indexOf(splitWords[loopNum]) != -1;
			var isSymbol:Bool = AlphaCharacter.symbols.indexOf(splitWords[loopNum]) != -1;
			var isAlphabet:Bool = AlphaCharacter.alphabet.indexOf(splitWords[loopNum].toLowerCase()) != -1;

			if ((isAlphabet || isSymbol || isNumber) && (!isBold || !spaceChar))
			{
				if (lastSprite != null && !xPosResetted)
				{
					lastSprite.updateHitbox();
					xPos += lastSprite.width + 3;
					// if (isBold)
					// xPos -= 80;
				}
				else
				{
					xPosResetted = false;
				}

				if (consecutiveSpaces > 0)
				{
					xPos += 20 * consecutiveSpaces * textSize;
				}
				consecutiveSpaces = 0;

				// var letter:AlphaCharacter = new AlphaCharacter(30 * loopNum, 0, textSize);
				var letter:AlphaCharacter = new AlphaCharacter(xPos, 55 * yMulti, textSize);
				letter.row = curRow;
				if (isBold)
				{
					if (isNumber)
					{
						letter.createBoldNumber(splitWords[loopNum]);
					}
					else if (isSymbol)
					{
						letter.createBoldSymbol(splitWords[loopNum]);
					}
					else
					{
						letter.createBoldLetter(splitWords[loopNum]);
					}
				}
				else
				{
					if (isNumber)
					{
						letter.createNumber(splitWords[loopNum]);
					}
					else if (isSymbol)
					{
						letter.createSymbol(splitWords[loopNum]);
					}
					else
					{
						letter.createLetter(splitWords[loopNum]);
					}
				}
				letter.x += 90;

				if(tmr != null) {
					if(dialogueSound != null) dialogueSound.stop();
					dialogueSound = FlxG.sound.play(soundDialog);
				}

				add(letter);

				lastSprite = letter;
			}
		}

		loopNum++;
		if(loopNum >= splitWords.length) {
			if(tmr != null) {
				typeTimer = null;
				tmr.cancel();
				tmr.destroy();
			}
			finishedText = true;
		}
	}

	override function update(elapsed:Float)
	{
		if (isMenuItem)
		{
			var scaledY = FlxMath.remapToRange(targetY, 0, 1, 0, 1.3);

			var lerpVal:Float = CoolUtil.boundTo(elapsed * 9.6, 0, 1);
			y = FlxMath.lerp(y, (scaledY * yMult) + (FlxG.height * 0.48) + yAdd, lerpVal);
			if(forceX != Math.NEGATIVE_INFINITY) {
				x = forceX;
			} else {
				x = FlxMath.lerp(x, (targetY * 20) + 90 + xAdd, lerpVal);
			}
		}

		super.update(elapsed);
	}

	public function killTheTimer() {
		if(typeTimer != null) {
			typeTimer.cancel();
			typeTimer.destroy();
		}
		typeTimer = null;
	}
}

class AlphaCharacter extends FlxSprite
{
	public static var alphabet:String = "abcdefghijklmnopqrstuvwxyz手式都思让距离次摆脱动弦隔迎菜死宾已知怕久前事情容易愿参观部搞快要做呢很天迷路跟紧整蓝迄止阁敢问宛转悠扬您称谓曼妙趣顺更除感提他名字咳嗽振歌余音缭绕印象刻赞绝口如此年未色界第唱败数强敌别剩孤身游荡今日够与其同满欢荣幸至比伦曾所哈谢旅行冷眉相法开立命令去踪杳讯唯守护储毕生血而救恩违背聆讲述作艺术为变陈往再求留每以石担并继续题侣论明胜筹刚才加入将永恒她分现关泼妇选择或交放走体验活几百任何拜访没受呐陪回归依伴玩忧虑寂寞男仆独教由后随欲周逃掌痛哭抱静猜趁注偷暗始毒伙怎办疯杀候巫师赌错道赢昏倒吃晚用饭输焦经烂额正忙决定远呆约耻被小送顿根毫毛稽谈控制廉价戏扁劝最准备确实极差收藏品目些雕简直和真模逼觉奇怪爱胃呵碍细尝等待惊底许高曲太视这是一个对话测试呃啊我的头甜心你在那里吗可恶好黑把边蜡烛给什么鬼们哪唉又来了看遇到麻烦啧外面还下着倾盆雨有大时间能拿打发带东西吧想不找点乐子嘘哇靠近会翻译递出深呼吸魔破地方居然人住喂说二位贵安少伟尊姓震声李吼干嘛听得见午夜利姆内蒂座城堡管家介意叫就啦起就像从上世纪过算礼貌总之只无需多言主向者拒请当成自己一样";

	public static var numbers:String = "1234567890";

	public static var symbols:String = "|~#$%()*+-:;<=>@[]^_.,'!?…？。，！";

	public var row:Int = 0;

	private var textSize:Float = 1;

	public function new(x:Float, y:Float, textSize:Float)
	{
		super(x, y);
		var tex = Paths.getSparrowAtlas('alphabet');
		frames = tex;

		setGraphicSize(Std.int(width * textSize));
		updateHitbox();
		this.textSize = textSize;
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	public function createBoldLetter(letter:String)
	{
		animation.addByPrefix(letter, letter.toUpperCase() + " bold", 24);
		animation.play(letter);
		updateHitbox();
	}

	public function createBoldNumber(letter:String):Void
	{
		animation.addByPrefix(letter, "bold" + letter, 24);
		animation.play(letter);
		updateHitbox();
	}

	public function createBoldSymbol(letter:String)
	{
		switch (letter)
		{
			case '.':
				animation.addByPrefix(letter, 'PERIOD bold', 24);
			case "'":
				animation.addByPrefix(letter, 'APOSTRAPHIE bold', 24);
			case "?":
				animation.addByPrefix(letter, 'QUESTION MARK bold', 24);
			case "!":
				animation.addByPrefix(letter, 'EXCLAMATION POINT bold', 24);
			case "(":
				animation.addByPrefix(letter, 'bold (', 24);
			case ")":
				animation.addByPrefix(letter, 'bold )', 24);
			case "…":
				animation.addByPrefix(letter, '…', 24);
			case "。":
				animation.addByPrefix(letter, '。', 24);
			case "？":
				animation.addByPrefix(letter, '？', 24);
			case "！":
				animation.addByPrefix(letter, '！', 24);
			case "，":
				animation.addByPrefix(letter, '，', 24);
			case"“":
				animation.addByPrefix(letter, '“', 24);
			case"”":
				animation.addByPrefix(letter, '”', 24);
			default:
				animation.addByPrefix(letter, 'bold ' + letter, 24);
		}
		animation.play(letter);
		updateHitbox();
		switch (letter)
		{
			case "'":
				y -= 20 * textSize;
			case '-':
				//x -= 35 - (90 * (1.0 - textSize));
				y += 20 * textSize;
			case '(':
				x -= 65 * textSize;
				y -= 5 * textSize;
				offset.x = -58 * textSize;
			case ')':
				x -= 20 / textSize;
				y -= 5 * textSize;
				offset.x = 12 * textSize;
			case '.':
				y += 45 * textSize;
				x += 5 * textSize;
				offset.x += 3 * textSize;
			case "，":
				y += 45 * textSize;
				x += 5 * textSize;
				offset.x += 3 * textSize;
		}
	}

	public function createLetter(letter:String):Void
	{
		var letterCase:String = "lowercase";
		if (letter.toLowerCase() != letter)
		{
			letterCase = 'capital';
		}

		animation.addByPrefix(letter, letter + " " + letterCase, 24);
		animation.play(letter);
		updateHitbox();

		y = (110 - height);
		y += row * 60;
	}

	public function createNumber(letter:String):Void
	{
		animation.addByPrefix(letter, letter, 24);
		animation.play(letter);

		updateHitbox();

		y = (110 - height);
		y += row * 60;
	}

	public function createSymbol(letter:String)
	{
		switch (letter)
		{
			case '#':
				animation.addByPrefix(letter, 'hashtag', 24);
			case '.':
				animation.addByPrefix(letter, 'period', 24);
			case "'":
				animation.addByPrefix(letter, 'apostraphie', 24);
				y -= 50;
			case "?":
				animation.addByPrefix(letter, 'question mark', 24);
			case "!":
				animation.addByPrefix(letter, 'exclamation point', 24);
			case ",":
				animation.addByPrefix(letter, 'comma', 24);
			default:
				animation.addByPrefix(letter, letter, 24);
		}
		animation.play(letter);

		updateHitbox();

		y = (110 - height);
		y += row * 60;
		switch (letter)
		{
			case "'":
				y -= 20;
			case '-':
				//x -= 35 - (90 * (1.0 - textSize));
				y -= 16;
		}
	}
}
