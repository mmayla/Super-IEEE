package Screens 
{
	import flash.utils.Dictionary;
	import HUD.ScoreText;
	import Importers.Assets;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.animation.Tween;
	import starling.core.Starling;
	import Importers.global;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Finish extends Sprite 
	{
		private var playbtn:Button;
		private var startbtn:Button;
		private var scoretext:ScoreText;
		private var gameover:Image;
		private var finishbg:Image;
		
		public function Finish() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//entry point
			loadArt();
		}
		
		private function loadArt():void 
		{
			finishbg = new Image(Assets.getAtlas().getTexture("UIbg.png"));
			gameover = new Image(Assets.getAtlas().getTexture("textGameOver.png"));
			scoretext = new ScoreText(100);
			playbtn = new Button(Assets.getAtlas().getTexture("buttonSmall.png"), "Play Again");
			startbtn = new Button(Assets.getAtlas().getTexture("buttonSmall.png"), "Main menu");
			
			placeElements();
			
			addChild(finishbg);
			addChild(playbtn);
			addChild(startbtn);
			addChild(scoretext);
			addChild(gameover);
			
			//Events
			playbtn.addEventListener(Event.TRIGGERED, playbtnPressed);
			startbtn.addEventListener(Event.TRIGGERED,startbtnPressed);
		}
		
		private function startbtnPressed(e:Event):void 
		{
			global.score = 0;
			global.powerup_type = "NORMAL";
			global.gamestate = "START";
		}
		
		private function playbtnPressed(e:Event):void 
		{
			global.score = 0;
			global.powerup_type = "NORMAL";
			global.gamestate = "PLAY";
		}
		
		private function placeElements():void 
		{
			//backgrounf
			finishbg.scaleX = 1.5;
			finishbg.scaleY = 1.5;
			finishbg.x = stage.stageWidth / 2 - finishbg.width / 2;
			finishbg.y = stage.stageHeight / 2 - finishbg.height / 2;
			
			//game over
			gameover.x = stage.stageWidth / 2 - gameover.width / 2;
			gameover.y = stage.stageHeight * 0.1;
			
			//score text
			scoretext.x = stage.stageWidth / 2 - scoretext.realWidth / 2;
			scoretext.y = stage.stageHeight * 0.3;
			
			//play again btn
			playbtn.scaleX = 0.9;
			playbtn.scaleY = 0.9;
			playbtn.x = stage.stageWidth/2 - playbtn.width / 2;
			playbtn.y = stage.stageHeight * 0.55;
			
			//main menu btn
			startbtn.scaleX = 0.9;
			startbtn.scaleY = 0.9;
			startbtn.x = stage.stageWidth/2 - startbtn.width / 2;
			startbtn.y = stage.stageHeight * 0.72;
			
			//edit btns font
			playbtn.fontBold = true;
			playbtn.fontName = "angrybirds-regular";
			playbtn.fontSize = 25;
			startbtn.fontBold = true;
			startbtn.fontName = "angrybirds-regular";
			startbtn.fontSize = 25;
			
		}
		
		//Navigation handling
		public function acivate():void
		{
			this.visible = true;
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}

}