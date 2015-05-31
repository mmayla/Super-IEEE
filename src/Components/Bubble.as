package Components 
{
	import Importers.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Bubble extends Sprite 
	{
		private var bubblecomp:Image;
		
		private var _currentDate:Date;
		private var _currentX:int;
		
		private var randdir:Number = Math.round(Math.random()) <= 0.5 ? -1 : 1;
		public function Bubble() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//Entry point

			bubblecomp =  new Image(Assets.getTexture("bubbleImg"));
			this.y = stage.stageHeight;
			randomSize();
			addChild(bubblecomp);
			
			this.addEventListener(Event.ENTER_FRAME,animation);
		}
		
		private function animation(e:Event):void 
		{
			_currentDate = new Date();
			
			this.x = this._currentX + (Math.cos(_currentDate.getTime() * 0.002)) * randdir*5;
			this.y --;
			
			if (y + this.height < 0)
			{
				removeFromParent(true);
			}
		}
		
		private function randomSize():void 
		{
			var rand:Number = Math.random();
			rand = rand < 0.4 ? 0.4 : rand; 
			this.scaleX = rand;
			this.scaleY = rand;
			
		}
		
		public function get currentX():int 
		{
			return _currentX;
		}
		
		public function set currentX(value:int):void 
		{
			_currentX = value;
		}
		
		
	}

}