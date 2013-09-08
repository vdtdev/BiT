package sfs.bit 
{
	import org.flixel.*;
	import sfs.bit.states.TitleScreen;
	/**
	 * ...
	 * @author Something Fishy Software
	 */
	public class Player extends FlxSprite
	{
		
		public const FR_DEFAULT:int = 0;
		public const FR_LARM:int = 2;
		public const FR_RARM:int = 1;
		public const FR_ARMS:int = 3;
		
		[Embed(source = "player.png")] private var spr:Class;
		
		/**
		 * constructor that positions player at the bottom of the
		 * screen in the center
		 */
		public function Player() 
		{
			
			super.loadGraphic(spr, true, false, 32, 32, false);
			this.scale = new FlxPoint(2.5, 2.5);
		}
		
		/**
		 * override for the sprite update method
		 */
		override public function update():void {
			
			if (FlxG.keys.LEFT && !FlxG.keys.RIGHT) { frame = FR_LARM; }
			if (FlxG.keys.RIGHT && !FlxG.keys.LEFT) { frame = FR_RARM; }
			if (FlxG.keys.LEFT && FlxG.keys.RIGHT) { frame = FR_ARMS; }
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT) { frame = FR_DEFAULT;}
			
			// check if we cast a spell
			if (FlxG.keys.justPressed("SPACE")||FlxG.keys.justPressed("UP")) {
				
					/*var s:Spell = (FlxG.state as GameScreen).spells.recycle(Spell) as Spell;
					//var s:Spell = new Spell();
					s.reset(this.x + 12, this.y - 5);*/
			
					
					
				
			}
		}
	}


}