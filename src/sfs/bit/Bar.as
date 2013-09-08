package sfs.bit 
{
	import org.flixel.*;
	import sfs.bit.states.TitleScreen;
	/**
	 * ...
	 * @author Something Fishy Software
	 */
	public class Bar extends FlxSprite
	{
		
		// frame number constants
	
		
		/**
		 * constructor that positions player at the bottom of the
		 * screen in the center
		 */
		public function Bar(pos:int) 
		{
			super.makeGraphic(480, 1, 0x80ffffff);
			this.width = 480;
			this.height = 1;
			this.fill(0x80ffffff);
			this.x = 0;
			this.y = pos;
		}
		/**
		 * override for the sprite update method
		 */
		override public function update():void {
			
			}
		}
	}