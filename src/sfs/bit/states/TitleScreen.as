package sfs.bit.states 
{
	import org.flixel.*;
	import sfs.bit.Player;
	/**
	 * The game title screen state
	 * @author Something Fishy Software
	 */
	public class TitleScreen extends FlxState
	{
		
		private var ply:Player = null;
		private var title:FlxText;
		private var auth:FlxText;
		private var inst:FlxText,inst2:FlxText;
		/**
		 * Override the FlxState create function
		 */
		override public function create():void {
			auth = new FlxText(100, 275, 300, "(c) 2012, Something Fishy Software/Wade Harkins");
			title = new FlxText(100, 240, 300, "BiT", true);
			inst = new FlxText(0, 460, 350, "Controls: Left and Right Arrows to catch bits!! Press Space to Play... ", true);
			inst2 = new FlxText(0, 470, 500, "Collect the bits in the given bit string to advance!",true);
			title.size = 28;
			this.add(title);
			this.add(auth);
			ply = new Player();
			this.add(ply);
			this.add(inst);
			this.add(inst2);
			ply.x = 100;
			ply.y = 100;
		}
		
		/**
		 * Override the FlxState update function
		 */
		override public function update():void {
			if (FlxG.keys.SPACE){
				FlxG.switchState(new GameScreen());
			}
			inst.x = (inst.x > -480)?inst.x - 1:480;
			inst2.x = (inst2.x < 480)?inst2.x + 1:-480;
			super.update();
		}
		
	}

}