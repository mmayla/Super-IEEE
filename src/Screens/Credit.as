package Screens 
{
	import Importers.Assets;
	import Importers.global;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ... 
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Credit extends Sprite 
	{
		private var creditbg:Image;
		private var mainmenubtn:Button;
		private var bubblescreen:BubbleScreen;
		public function Credit() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//Entry point
			bubblescreen = new BubbleScreen();
			creditbg = new Image(Assets.getTexture("creditscreen"));
			mainmenubtn = new Button(Assets.getTexture("mainmenbtn"), "");
			
			mainmenubtn.x = 557;
			mainmenubtn.y = 338;
			
			
			this.addChild(creditbg);
			this.addChild(bubblescreen);
			this.addChild(mainmenubtn);
			
			//events
			mainmenubtn.addEventListener(Event.TRIGGERED,mainmenubtnPressed);
		}
		
		private function mainmenubtnPressed(e:Event):void 
		{
			global.gamestate = "START";
		}
		
		
		//navigation handling
		public function activate():void
		{
			this.visible = true;
			bubblescreen.activate();
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			bubblescreen.disposeTemporarily();
		}
	}

}