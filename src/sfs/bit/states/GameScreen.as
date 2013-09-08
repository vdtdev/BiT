package sfs.bit.states
{
	import org.flixel.*;
	import sfs.bit.Bar;
	import sfs.bit.Bit;
	
	import sfs.bit.Player;
	
	/**
	 * The game screen state
	 * @author Something Fishy Software
	 */
	public class GameScreen extends FlxState
	{
		public var difficulty:int = 1;
		private var goal:String = "";
		private var ply:Player = null;
		private var bar:FlxGroup = new FlxGroup(2);
		private var bits:FlxGroup = new FlxGroup(64);
		private var b:Bit = null, c:Bit = null;
		private var txtitle:FlxText = null, txscore:FlxText = null;
		
		/**
		 * Override the FlxState create function
		 */
		override public function create():void
		{
			
			var br:Bar = new Bar(420);
			FlxG.level = 1;
			bar.add(br);
			newGoal();
			createHud();
			ply = new Player();	// player
			b = new Bit(-1, 1);	// left column bit
			c = new Bit(-1, 2); // right column 
			bits.add(b);
			bits.add(c);
			this.add(bits);
			this.add(ply);
			this.add(bar);
			ply.x = FlxG.width / 2 - 16;
			ply.y = FlxG.height - 52;
		}
		
		/**
		 * Override the FlxState update function
		 */
		override public function update():void
		{
			
			updateHud();
			FlxG.overlap(bits, bar, collide);
			
			if (c.y > 480)
			{
				respawnC()
			}
			if (b.y > 480)
			{
				respawnB()
			}
			super.update();
		}
		
		/**
		 * Callback function called whenever a 'bit' intersects the bottom line
		 * @param	o1 Bit object that hit the line
		 * @param	o2 The line (not used)
		 */
		private function collide(o1:FlxObject, o2:FlxObject):void {
			var bo:Bit = o1 as Bit;
			// the bit is on the left side
			if (bo.col == 1 && (ply.frame == ply.FR_LARM || ply.frame == ply.FR_ARMS)) {
				if ((goal.charAt(0)=="1" && bo.frame==bo.BT_1) ||( goal.charAt(0)=="0" && bo.frame==bo.BT_0))
				{
					goal = goal.slice(1, goal.length + 1);
					FlxG.score += 100;
					bo.kill();
					bo.respawn( -1, 1);
				}
				else {
					// penalty goes here
					// something like
					FlxG.switchState(new ResultScreen(FlxG.score));
				}
				
			}
			// the bit is on the right side
			if (bo.col == 2 && (ply.frame == ply.FR_RARM || ply.frame == ply.FR_ARMS)) {
				if ((goal.charAt(0)=="1" && bo.frame==bo.BT_1) || (goal.charAt(0)=="0" && bo.frame==bo.BT_0))
				{
					goal = goal.slice(1, goal.length + 1);
					FlxG.score += 100;
					bo.kill();
					bo.respawn( -1, 2);
				}
				else {
					// penalty goes here
					FlxG.score-= 50;
				}
				
			}
			
			// check if the level is complete
			if (goal.length == 0) {
				FlxG.level++;
				FlxG.score += 25;
				this.newGoal();
			}
			
		}
		/**
		 * Kills the existing b bit and respawns it
		 */
		private function respawnB():void
		{
			b.kill();
			b.respawn( -1, 1);
			//bits.update();
		}
		
		/**
		 * Kills the exisiting C bit and respawns it
		 */
		private function respawnC():void
		{
			c.kill();
			c.respawn(-1,2);
		//	bits.update();
		}
		
		/**
		 * Generates a new random target bitstring pattern
		 */
		private function newGoal():void
		{
			goal = "";
			var ml:int = 1 + (2 * FlxG.level); // 1=3, 2=5,3=7,4=9, 5=11
			// limit the length to 13 max
			ml = Math.min(ml, 13);
			for (var i:int = 0; i < ml; i++)
			{
				/*
				 * Old code for target generation which included the rare '+'
				 * 
				 * var t:int = Math.random() * 30;
				   var l:String = (t < 13) ? "0" : (t >= 13 && t < 26) ? "1" : "+";
				   */
				var t:int = Math.random() * 27;
				var l:String = (t <= 13)?"0":"1";
				
				goal += l;
			}
		
		}
		
		/**
		 * Updates the score and bitstring target display
		 */
		private function updateHud():void
		{
			txscore.text = "Score: " + FlxG.score + "\tString: " + goal + "\t\tLevel: " + FlxG.level;
		}
		
		/**
		 * Create the hud text objects and add them to the state
		 */
		private function createHud():void
		{
			txtitle = new FlxText(5, 5, 100, "BiT", true);
			txtitle.size = 12;
			txscore = new FlxText(105, 5, 400, "Score: " + FlxG.score, true);
			txscore.size = 12;
			this.add(txscore);
			this.add(txtitle);
		}
	
	}

}