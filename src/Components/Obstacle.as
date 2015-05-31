package Components 
{
	import flash.geom.Rectangle;
	import Importers.global;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.VAlign;
	import starling.utils.HAlign;
	import Importers.Assets;
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Obstacle extends Sprite
	{
		private var dir:String;
		private var upobst:Image;
		private var downobst:Image;
		
		//movment
		public static var _speed:Number;
		public static var _parallaxDepth:Number;
		
		public function Obstacle(d:String)
		{
			dir = d;
			Generator.obstacle_count ++;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//entry point
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, handleEnterFrame);
			
			if (dir == "UP")
			{
				upobst = new Image(Assets.getAtlas().getTexture("rockGrass.png"));
				upobst.y = stage.stageHeight - upobst.height + 3;
				//global.game.addChildAt(upobst,global.game.getMountinIndex());
				this.addChild(upobst);
			}
			else if(dir == "DOWN")
			{
				downobst = new Image(Assets.getAtlas().getTexture("rockGrassDown.png"));
				downobst.y = -3;
				//this.addChildAt(global.game.getMountinIndex(),downobst);
				this.addChild(downobst);
			}
		}
		
		private function handleEnterFrame(event:EnterFrameEvent):void
		{
			if (global.powerup_type != "TRANSPARENT")
			{
				checkColision();
			}
			
			this.x -= Math.ceil(global.playerSpeed  * _parallaxDepth);
			
			if (this.x + this.width < 0)
			{
				this.removeFromParent();
				Generator.obstacle_count--;
				this.dispose();
			}
			
		}
		
		private function checkColision():void
		{
			
			/*var px1:Number = global.player.x;
			var py1:Number = global.player.y;
			var px2:Number = global.player.x + global.player.width;
			var py2:Number = global.player.y + global.player.height;
			var obsx1:Number = this.x;
			var obsy1:Number = this.y;
			var obsx2:Number = this.x + this.width;
			var obsy2:Number = this.y + this.height;
			var epsilon:Number;*/
			
			var bounds1:Rectangle = global.player.bounds;
			var bounds2:Rectangle = this.bounds;
			
			bounds1.top = bounds1.top + 10;
			bounds1.bottom = bounds1.bottom - 20;
			bounds1.right = bounds1.right - 10;
			bounds1.left = bounds1.left + 10;
			
			bounds2.left = bounds2.left + bounds2.width * 0.4;
			bounds2.right = bounds2.right - bounds2.width * 0.4;
			bounds2.top = bounds2.top + bounds2.height * 0.05;
			bounds2.bottom = bounds2.bottom - bounds2.height * 0.05;
			
			if (bounds1.intersects(bounds2))
				global.gamestate = "FINISH"; 
				
			
			/*if (px1 > obsx1+10 && px1 <= obsx2-10)
			{
				if (py1 > obsy1+10 && py1 <= obsy2-10)
				{
					Game.colision = true;
				}
			}
			*/
		}
	}

}