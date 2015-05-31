package Screens 
{
	import Components.Bubble;
	import Importers.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.*;
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class BubbleScreen extends Sprite 
	{
		private var i:uint; //for every second event
		private var newbubble:Bubble;
		private var isactivated:Boolean = false;
		public function BubbleScreen() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			i = setInterval(everySecond, 1000); //every 1 second
			//Entry point
			//this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void 
		{
			
		}
	
		protected function everySecond():void
		{
			newbubble = new Bubble();
			newbubble.x = Math.floor(Math.random() * stage.stageWidth - newbubble.width);
			newbubble.currentX = newbubble.x;
			addChild(newbubble);
		}
		
		
		protected function completePlay():void
		{
			clearInterval(i);
		}
		
		//Navigation handling
		public function activate():void
		{
			if (!isactivated)
			{
				isactivated = true;
				this.visible = true;
				i = setInterval(everySecond, 1000); //every 1 second
			}
		}
		
		public function disposeTemporarily():void
		{
			clearInterval(i);
			this.removeChildren();
			this.visible = false;
			this.isactivated = false;
		}
	}

}