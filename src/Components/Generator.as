package Components 
{
	import Importers.Assets;
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
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Generator extends Sprite 
	{
		public static var obstacle_count:Number=0;
		
		private var lastobstacle:Obstacle;
		
		public var finish:Boolean=false;
		
		private var tempcoin:Coin;
		public function Generator() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			tempcoin = new Coin();
			//Entry point
			Obstacle._speed = global.playerSpeed;
			Obstacle._parallaxDepth = global.parallaxDepthbg2;
			Coin._speed = global.playerSpeed;
			Coin._parallaxDepth = global.parallaxDepthbg2;
			
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, handleEnterFrame);
		}
		
		private function handleEnterFrame(event:EnterFrameEvent):void
		{
			if (global.gamestate=="PLAY")
			{
				if (obstacle_count == 0)
				{
					createElement();
				}
				else if (lastobstacle.x <= stage.stageWidth * 0.5)
					createElement();
			}
			else
			{
				removeChildren();
				obstacle_count = 0;
			}
		}
		
		private function createElement():void
		{	
			var ran:Number = Math.random() <= 0.5 ? 0 : 1;
			
			var newobst:Obstacle;
			//obstacle
			
			if (ran == 0)
			{
				newobst = new Obstacle("UP");
			}else newobst = new Obstacle("DOWN");
			
			newobst.x = stage.stageWidth;
			lastobstacle = newobst;
			this.addChild(newobst);
			
			//coin
			generateRandCoins(ran);
		}
		
		private function generateRandCoins(obstType:Number):void 
		{
			var rand:int = Math.floor(Math.random() * 4);
			switch(rand)
			{
				case 0:
					//vertical line
					createCoin(stage.stageWidth + global.coinSeperator * 4, 
								stage.stageHeight / 2 - tempcoin.height / 2 - global.coinSeperator*2);
					createCoin(stage.stageWidth + global.coinSeperator * 4, stage.stageHeight / 2 - tempcoin.height / 2 - global.coinSeperator);
					createCoin(stage.stageWidth + global.coinSeperator * 4, stage.stageHeight / 2 - tempcoin.height / 2);
					createCoin(stage.stageWidth + global.coinSeperator * 4, stage.stageHeight / 2 - tempcoin.height / 2 + global.coinSeperator);
					createCoin(stage.stageWidth + global.coinSeperator*4, stage.stageHeight / 2 - tempcoin.height / 2 + global.coinSeperator*2);
					break;
				case 1:
					//herozintal line
					createCoin(stage.stageWidth + global.coinSeperator*2, (stage.stageHeight / 2 - tempcoin.height / 2));
					createCoin(stage.stageWidth + global.coinSeperator*2 + global.coinSeperator, 
								(stage.stageHeight / 2 - tempcoin.height / 2));
					createCoin(stage.stageWidth + global.coinSeperator*2 + global.coinSeperator * 2, 
								(stage.stageHeight / 2 - tempcoin.height / 2));
					createCoin(stage.stageWidth + global.coinSeperator*2 + global.coinSeperator * 3, 
								(stage.stageHeight / 2 - tempcoin.height / 2));
					createCoin(stage.stageWidth + global.coinSeperator*2 + global.coinSeperator * 4, 
								(stage.stageHeight / 2 - tempcoin.height / 2));
					break;
				case 2:
					if (obstType == 1)
					{
						createCoin(stage.stageWidth + global.coinSeperator * 2, 
										stage.stageHeight / 2 - tempcoin.height / 2);
						createCoin(stage.stageWidth + global.coinSeperator * 2 + global.coinSeperator
										, stage.stageHeight / 2 - tempcoin.height / 2 + global.coinSeperator);
						createCoin(stage.stageWidth + global.coinSeperator * 2 + global.coinSeperator*2
										, stage.stageHeight / 2 - tempcoin.height / 2+ global.coinSeperator*2);
					}else
					{
						createCoin(stage.stageWidth + global.coinSeperator * 2, 
										stage.stageHeight / 2 - tempcoin.height / 2);
						createCoin(stage.stageWidth + global.coinSeperator * 2 - global.coinSeperator
										, stage.stageHeight / 2 - tempcoin.height / 2 - global.coinSeperator);
						createCoin(stage.stageWidth + global.coinSeperator * 2 - global.coinSeperator*2
										, stage.stageHeight / 2 - tempcoin.height / 2- global.coinSeperator*2);
					}
					break;
					
				default:
					break;
			}
		}
		
		private function createCoin(x:int, y:int):void
		{
			var newcoin:Coin = new Coin();
			newcoin.x = x
			newcoin.y = y
			this.addChild(newcoin);
		}
	}

}