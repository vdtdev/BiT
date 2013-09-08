package sfs.bit 
{/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above
 *   copyright notice, this list of conditions and the following disclaimer
 *   in the documentation and/or other materials provided with the
 *   distribution.
 * * Neither the name of the Something Fishy Software nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */

	import org.flixel.*;
	import sfs.bit.states.GameScreen;
	import sfs.bit.states.TitleScreen;
	/**
	 * ...
	 * @author Wade Harkins <vdtdev@gmail.com>
	 * @author Something Fishy Software
	 */
	public class Bit extends FlxSprite
	{
		
		// frame number constants
		public const BT_1:int = 0;
		public const BT_0:int = 1;
		public const BT_ERR:int = 2;
		
		// which frame to use
		public var bitType:int=-1;
		public var col:int = -1;
		
		[Embed(source = "bits.png")] private var spr:Class;
		
		/**
		 * constructor that positions player at the bottom of the
		 * screen in the center
		 */
		public function Bit(state:int,col:int) 
		{
			if (state == -1) {
				state = Math.random() * 2;
			}
			super.loadGraphic(spr, true, false, 16, 16, false);
			bitType = state;
			this.scale = new FlxPoint(2.5, 2.5);
			this.col = col;
			switch(col) {
				case 1:
					x = FlxG.width / 4 / 2 - 8;
					break;
				case 2:
					x = (FlxG.width / 4) * 3 + (this.width / 2) - 8;
					break;
			}
		}
		
		public function respawn(state:int, col:int):void {
			if (!alive) { this.revive();}
			if (state == -1) {
				state = Math.random() * 2;
			}
			bitType = state;
			this.y = -20;// * FlxG.level;
			this.scale = new FlxPoint(2.5, 2.5);
			this.col = col;
			switch(col) {
				case 1:
					x = FlxG.width / 4 / 2 - 8;
					break;
				case 2:
					x = (FlxG.width / 4) * 3 + (this.width / 2) - 8;
					break;
			}
		}
		
		/**
		 * override for the sprite update method
		 */
		override public function update():void {
			this.frame = bitType;
			//var g:GameScreen = FlxG.state.active as GameScreen;
			this.velocity = new FlxPoint(0, 50 + (FlxG.level*2));
			//g = null;
			}
		}
	}
