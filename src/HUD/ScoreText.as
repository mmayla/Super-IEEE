package HUD 
{
	import Importers.global;
	import starling.animation.Tween;
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
	import starling.utils.Color;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class ScoreText extends Sprite 
	{
		private var scoretext:TextField;
		public var realWidth:Number=500;
		public var realHeight:Number = 100;
		private var fontsize:Number = 50;
		
		public function ScoreText(fntsize:Number = 50) 
		{
			super();
			fontsize = fntsize;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//entry point
			createArt();
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, handleEnterFrame);
		}
		
		protected function handleEnterFrame(e:EnterFrameEvent):void 
		{
			scoretext.text = global.score.toString();
		}
		
		protected function createArt():void
		{
			//score text
			scoretext = new TextField(realWidth, realHeight, "0", "angrybirds-regular", fontsize, Color.OLIVE);
			//scoretext.hAlign = HAlign.LEFT;  // horizontal alignment
			scoretext.hAlign = HAlign.CENTER;
			scoretext.vAlign = VAlign.TOP; // vertical alignment
			
			this.addChild(scoretext);
		}
		
	}

}