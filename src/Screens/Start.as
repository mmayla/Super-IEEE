package Screens 
{
	import flash.utils.Dictionary;
	import Importers.Assets;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.animation.Tween;
	import starling.core.Starling;
	import Importers.global;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Start extends Sprite 
	{
		private var startbg:Image;
		private var ieeeman:Image;
		private var playbtn:Button;
		private var creditbtn:Button;
		private var tutorialbtn:Button;
		
		private var _currentDate:Date;
		
		public function Start() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//Entry point
			loadArt();
		}
		
		private function loadArt():void 
		{
			//ititialize art
			startbg = new Image(Assets.getTexture("strtbg"));
			ieeeman = new Image(Assets.getAtlas().getTexture("strtIEEEman"));
			playbtn = new Button(Assets.getTexture("startbtn"), "");
			creditbtn = new Button(Assets.getTexture("creditbtn"), "");
			tutorialbtn = new Button(Assets.getTexture("tutorialbtn"),"");
			
			placeElements();
			
			//add
			this.addChild(startbg);
			this.addChild(ieeeman);
			this.addChild(playbtn);
			this.addChild(creditbtn);
			this.addChild(tutorialbtn);
			
			//Events
			this.addEventListener(Event.ENTER_FRAME, floatingAnimation);
			playbtn.addEventListener(Event.TRIGGERED, playbtnPressed);
			creditbtn.addEventListener(Event.TRIGGERED, creditbtnPressed);
			tutorialbtn.addEventListener(Event.TRIGGERED,tutorialbtnPressed);
		}
		
		private function tutorialbtnPressed(e:Event):void 
		{
			global.gamestate = "TUTORIAL";
		}
		
		private function creditbtnPressed(e:Event):void 
		{
			global.gamestate = "CREDIT";
		}
		
		private function playbtnPressed(e:Event):void 
		{
			global.gamestate = "PLAY";
		}
		
		private function placeElements():void
		{
			
			//IEEE man
			ieeeman.scaleX = 0.5;
			ieeeman.scaleY = 0.5;
			ieeeman.x = 550;
			ieeeman.y = stage.stageHeight * 0.4;
			
			//buttons
			playbtn.x = 340;
			playbtn.y = 202;
			
			creditbtn.x = 340;
			creditbtn.y = 253;
			
			tutorialbtn.x = 695;
			tutorialbtn.y = 10;
		}
		
		private function floatingAnimation(event:Event):void
		{
			_currentDate = new Date();
			ieeeman.y = (stage.stageHeight * 0.2) + (Math.cos(_currentDate.getTime() * 0.002)) * 25;
		}
		
		//activate
		public function activate():void
		{
			this.visible = true;
			this.addEventListener(Event.ENTER_FRAME,floatingAnimation);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME))
				this.removeEventListener(Event.ENTER_FRAME,floatingAnimation);
		}
		
	}

}