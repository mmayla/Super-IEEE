package HUD
{
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
	public class HUD extends Sprite
	{
		private var scoretext:ScoreText;
		private var powerupstatue:PowerUpStatue;
		
		public function HUD()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//entry point
			scoretext = new ScoreText();
			scoretext.x = stage.stageWidth/2 - scoretext.realWidth/2;
			scoretext.y = stage.stageHeight * 0.1;
			
			powerupstatue = new PowerUpStatue();
			
			this.addChild(scoretext);
			this.addChild(powerupstatue);
		}
		
		//Navigation methods
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