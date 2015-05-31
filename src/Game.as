package  
{
	import Components.Coin;
	import Components.GameBackground;
	import Components.Obstacle;
	import Components.Generator;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import HUD.HUD;
	import Importers.global;
	import Screens.BubbleScreen;
	import Screens.Tutorial;
	import Sounds;
	import Screens.Credit;
	import Screens.Finish;
	import Screens.inGame;
	import Screens.Start;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	import starling.utils.VAlign;
	import starling.utils.HAlign;
	import flash.utils.*;
	import flash.media.SoundMixer;
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Game extends Sprite 
	{
		private var i:uint; //for every second event
		
		//game variables
		private var gamespeed:Number = 30;
		private var gamebg:GameBackground;
		private var obstgenerator:Generator;
		private var gamehud:HUD;
		
		//screens
		private var ingame:inGame;
		private var strtscreen:Start;
		private var finishscreen:Finish;
		private var creditscreen:Credit;
		private var tutorialscreen:Tutorial;
				
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			i = setInterval(everySecond, 1000); //every 1 second
			addEvents();
			global.game = this;
			//Entry point
			gamebg = new GameBackground();
			ingame = new inGame();
			obstgenerator = new Generator();
			strtscreen = new Start();
			finishscreen = new Finish();
			gamehud = new HUD();
			creditscreen = new Credit();
			tutorialscreen = new Tutorial;
						
			
			addChild(gamebg);
			addChild(obstgenerator);
			addChild(ingame);
			addChild(gamehud);
			addChild(strtscreen);
			addChild(finishscreen);
			addChild(creditscreen);
			addChild(tutorialscreen);
		}
		
		
		//Events function
		protected function addEvents():void
		{
			this.addEventListener(Event.ENTER_FRAME,navigation);
		}
		
		private function navigation(e:Event):void 
		{
			switch(global.gamestate)
			{
				case "START":
					//play sound
					if (!global._sndstart)
					{
						stopAllSounds();
						global._sndstart = true;
						global.soundsplayer.sndstart.play(0,999);
					}
					
					ingame.disposeTemporarily();
					gamehud.disposeTemporarily();
					finishscreen.disposeTemporarily();
					strtscreen.activate();
					tutorialscreen.disposeTemporarily();
					creditscreen.disposeTemporarily();
					break;
					
				case "PLAY":
					//play sound
					if (!global._sndplay)
					{
						stopAllSounds();
						global._sndplay = true;
						global.soundsplayer.sndplay.play(0,999);
					}
					
					strtscreen.disposeTemporarily();
					finishscreen.disposeTemporarily();
					ingame.activate();
					gamehud.activate();
					tutorialscreen.disposeTemporarily();
					creditscreen.disposeTemporarily();
					break;
				
				case "FINISH":
					//play sound
					if (!global._sndlose)
					{
						stopAllSounds();
						global._sndlose = true;
						global.soundsplayer.sndlose.play();
					}
					
					
					global.powerup_type = "NORMAL";
					//ingame.disposeTemporarily();
					gamehud.disposeTemporarily();
					finishscreen.acivate();
					tutorialscreen.disposeTemporarily();
					creditscreen.disposeTemporarily();
					break;
					
				case "CREDIT":
					//play sound
					if (!global._sndcredit)
					{
						stopAllSounds();
						global._sndcredit = true;
						global.soundsplayer.sndcredit.play(0,999);
					}
					
					ingame.disposeTemporarily();
					gamehud.disposeTemporarily();
					finishscreen.disposeTemporarily();
					strtscreen.disposeTemporarily();
					tutorialscreen.disposeTemporarily();
					creditscreen.activate();
					break;
					
				case "TUTORIAL":
					//play sound
					if (!global._sndstart)
					{
						stopAllSounds();
						global._sndstart = true;
						global.soundsplayer.sndstart.play(0,999);
					}
					
					ingame.disposeTemporarily();
					gamehud.disposeTemporarily();
					finishscreen.disposeTemporarily();
					strtscreen.disposeTemporarily();
					creditscreen.disposeTemporarily();
					tutorialscreen.activate();
					break;
			}
		}
		
		protected function everySecond():void
		{
			
		}
		
		protected function completePlay():void
		{
			clearInterval(i);
		}
		
		private function stopAllSounds():void
		{
			SoundMixer.stopAll();
			global._sndcoin = false;
			global._sndcredit = false;
			global._sndfinish = false;
			global._sndhit = false;
			global._sndlose = false;
			global._sndplay = false;
			global._sndpowerup = false;
			global._sndstart = false;
		}
		
		//seters and geters
		public function getMountinIndex():int
		{
			return gamebg.getLastBgIndex();
		}
		
	}

}