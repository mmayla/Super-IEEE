package Components 
{
	import flash.geom.Rectangle;
	import Importers.global;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import Importers.Assets;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Coin extends Sprite
	{
		
		private var coinart:Image;
		
		//movment
		public static var _speed:Number;
		public static var _parallaxDepth:Number;
		private var playerBound:Rectangle;
		public function Coin() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createArt();
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, handleEnterFrame);
		}
		
		protected function createArt():void
		{
			coinart = new Image(Assets.getAtlas().getTexture("coin.png"));
			coinart.scaleX = 0.4;
			coinart.scaleY = 0.4;
			this.addChild(coinart);
		}
		
		protected function handleEnterFrame(event:EnterFrameEvent):void
		{
			/*playerBound = global.player.bounds;
			playerBound.width = playerBound.width * 0.9;
			playerBound.height = playerBound.height * 0.7;*/
			
			playerBound = global.player.bounds;
			playerBound.y = playerBound.y + 30;
			
			if (global.powerup_type == "MAGNET")
			{
				if (this.x < global.player.x)
					this.x += global.powerup_coinspeed*5;
				if (this.x > global.player.x)
					this.x -= global.powerup_coinspeed*5;
					
				if (this.y < global.player.y)
					this.y += global.powerup_coinspeed;
				if (this.y > global.player.y)
					this.y -= global.powerup_coinspeed;
					
			}
			else this.x -= Math.ceil(global.playerSpeed * _parallaxDepth);
			
			if (this.x + this.width < 0)
			{
				this.removeFromParent();
				this.dispose();
			}else if (playerBound.intersects(this.bounds))
			{
				global.soundsplayer.sndcoin.play();
				
				global.score += 1;
				this.removeFromParent(true);
			}
			
			
		}
	}

}