package sfs.bit.states 
{
	import org.flixel.*;
	
	/**
	 * Game results screen
	 * @author Something Fishy Software
	 */
	public class ResultScreen extends FlxState
	{
		private var score:int;
		private var tscore:FlxText, msg1:FlxText, msg2:FlxText;
		public function ResultScreen(score:int)
		{
			this.score = score;
			super();
		}
		
		public override function create():void {
			msg1 = new FlxText(FlxG.width / 2, FlxG.height / 4, FlxG.width, "Final Score");
			tscore = new FlxText(FlxG.width / 2, FlxG.height / 2, FlxG.width, score.toString());
			msg2 = new FlxText(FlxG.width / 2, FlxG.height * 3 / 4, FlxG.width, "**GAME OVER**");
			tscore.size = 32;
			this.add(tscore);
			this.add(msg1);
			this.add(msg2);
		}
		
		public override function update():void {
			if (FlxG.keys.SPACE) {
				FlxG.switchState(new TitleScreen());
			}
		}
		
	}

}