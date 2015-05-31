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
	public class Tutorial extends Sprite 
	{
		private var tutbg:Image;
		private var mainmenubtn:Button;
		
		public function Tutorial() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//Entry point
			tutbg = new Image(Assets.getTexture("tutorialscreen"));
			mainmenubtn = new Button(Assets.getTexture("mainmenbtn"), "");
			
			mainmenubtn.x = 495;
			mainmenubtn.y = 338;
				
			this.addChild(tutbg);
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
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}

}