package Components
{
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.events.Event;
	import Importers.*;
	
	/**
	 * ...
	 * @author AbdoSaeed
	 */
	public class powerUps extends Sprite
	{
		private var type:int;
		private var art:Image;
		private var speed:Number;
		private var _artX:Number;
		private var _artY:Number;
		
		public function powerUps(type:int)
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.type = type;
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			create();
		}
		
		private function create():void
		{
			art = new Image(Assets.getAtlas().getTextures("IEEEchar" + type)[0]);
			art.x = Math.round(stage.stageWidth / 2 * (Math.random() + 1));
			art.scaleX = 0.3;
			art.scaleY = 0.3;
			this.addChild(art);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			drop();
		}
		
		private function onEnterFrame(e:Event):void
		{
			//move the object with the background
			moveWithBg();
			
			//delete the powerUp that gets out of the screen
			if (this.artX < 0 || this.artY < 0)
			{
				removeFromParent(true);
			}
			
			//collison with IEEE man
			if (global.player.bounds.intersects(this.bounds))
			{
				removeFromParent(true);
				global.soundsplayer.sndpowerup.play();
				switch (type)
				{
					case 1:
						trace("hit type 1");
						global.powerup_type = "MAGNET";
						break;
					case 2:
						trace("hit type 2");
						global.powerup_type = "EXTRA";
						break;
					case 3:
						trace("hit type 3");
						global.powerup_type = "TRANSPARENT";
						break;
					case 4:
						trace("hit type 4");
						global.powerup_type = "SLOW";
						break;
				}
			}
		
		}
		
		private function moveWithBg():void
		{
			art.x -= global.playerSpeed * 0.3;
			_artX = art.x;
		}
		
		private function drop():void
		{
			var tween:Tween = new Tween(art, 2);
			tween.animate("y", stage.stageHeight);
			Starling.juggler.add(tween);
		}
		
		public function get artX():Number
		{
			return _artX;
		}
		
		public function set artX(value:Number):void
		{
			_artX = value;
		}
		
		public function get artY():Number
		{
			return _artY;
		}
		
		public function set artY(value:Number):void
		{
			_artY = value;
		}
	
	/*public function get art():MovieClip
	   {
	   return _art;
	   }
	
	   public function set art(value:MovieClip):void
	   {
	   _art = value;
	 }*/
	
	}

}