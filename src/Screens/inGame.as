package Screens
{
	import Components.powerUps;
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.animation.Tween;
	import starling.core.Starling;
	import Components.ieeeMan;
	import Importers.global;
	
	/**
	 * ...
	 * @author AbdoSaeed
	 */
	public class inGame extends Sprite
	{
		
		private var man:ieeeMan;
		private var down:Boolean = true;
		
		//private var powerUp:Array = new Array();
		private var giftOnScore:int = 50; //every giftOnScore one powerUp appears
		private var showGift:Boolean = true;
		
		public function inGame()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			drawGame();
			this.addEventListener(KeyboardEvent.KEY_DOWN, moveUp);
			this.addEventListener(KeyboardEvent.KEY_UP, moveDown);
		}
		
		private function drawGame():void
		{
			man = new ieeeMan();
			man.scaleX = 1.3;
			man.scaleY = 1.3;
			man.x = stage.stageWidth * 0.1;
			man.y = stage.stageHeight / 2;
			global.player = man;
			this.addChild(man);
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function intialize():void
		{
			this.visible = true;
		
		}
		
		private function moveDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				down = true;
			}
		}
		
		private function moveUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				down = false;
			}
		}
		
		private function rotateTo(angle:Number):void
		{
			var tween:Tween = new Tween(man, 0.1);
			tween.animate("rotation", angle);
			Starling.juggler.add(tween);
		}
		
		/*private function removePowerUp(index:int):void
		{
			this.removeChild(powerUp[index]);
			powerUp[index] = null;
		}*/
		
		private function loop(e:Event):void
		{	
			if (global.powerup_type == "TRANSPARENT")
			{
				man.alpha = 0.5;
			}else man.alpha = 1;
			
			switch (global.gamestate)
			{
				case "PLAY": 
					
					//control IEEE Man 
					man.x = stage.stageWidth * 0.1;
					
					if (down)
					{
						if (man.y < stage.stageHeight * 0.7)
							man.y += global.playerstep;
						rotateTo(Math.PI / 10);
					}
					else
					{
						if (man.y > stage.height * 0.1)
							man.y -= global.playerstep;
						rotateTo(-Math.PI / 10);
					}
					//controll the charachters random appearance
					//show a powerUp every giftOnScore score
					if (global.score % giftOnScore == 0 && global.score != 0 && showGift && global.powerup_type=="NORMAL")
					{
						var powerType:int = Math.floor(3 * Math.random()) + 1;
						this.addChild(new powerUps(powerType));
						showGift = false;
					}
					else if (global.score % giftOnScore != 0)
					{
						showGift = true;
					}
				break;
				
			case "TEST":
				this.removeEventListener(Event.ENTER_FRAME,loop);
				break;
				
			default:
				man.x = -man.width;
				break;
			}
		}
		
		//Screen navigation
		public function activate():void
		{
			this.visible = true;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			if (this.hasEventListener(Event.ENTER_FRAME))
				this.removeEventListener(Event.ENTER_FRAME,loop);
		}
		
	
	}

}