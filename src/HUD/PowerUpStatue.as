package HUD 
{
	import Importers.Assets;
	import Importers.global;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class PowerUpStatue extends Sprite 
	{
		private var charpanel_normal:Image;
		private var charpanel_ch1:Image;
		private var charpanel_ch2:Image;
		private var charpanel_ch3:Image;
		private var charpanel_ch4:Image;
		private var inbar:Image;
		
		//handling vars
		private var sizeofstep:int;
		private var timecount:int=-1;
		private var i:uint; //for every second event
		private var originalplayerspeed:int = global.playerSpeed; //save speed
		
		
		public function PowerUpStatue() 
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
			//load 
			charpanel_normal = new Image(Assets.getTexture("powerupstat_normal"));
			charpanel_ch1 = new Image(Assets.getTexture("powerupstat_char1"));
			charpanel_ch2 = new Image(Assets.getTexture("powerupstat_char2"));
			charpanel_ch3 = new Image(Assets.getTexture("powerupstat_char3"));
			charpanel_ch4 = new Image(Assets.getTexture("powerupstat_char4"));
			inbar = new Image(Assets.getTexture("powerupstat_bar"));
			
			placeElements();
			
			addChild(charpanel_normal);
			addChild(charpanel_ch1);
			addChild(charpanel_ch2);
			addChild(charpanel_ch3);
			addChild(charpanel_ch4);
			addChild(inbar);
			
			//Events
			compute();
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function placeElements():void 
		{
			//first
			charpanel_normal.visible = true;
			charpanel_ch1.visible = false;
			charpanel_ch2.visible = false;
			charpanel_ch3.visible = false;
			charpanel_ch4.visible = false;
			inbar.visible = false;
			
			//in hud
			this.scaleX = 0.4;
			this.scaleY = 0.4;
			this.x = stage.stageWidth - charpanel_normal.width*0.4;

		}
		
		private function compute():void 
		{
			sizeofstep = Math.floor(inbar.width / global.powerup_duration+1);
		}
		
		private function loop(e:Event):void 
		{	
			switch(global.powerup_type)
			{
				case "MAGNET":
					charpanel_normal.visible = false;
					charpanel_ch1.visible = true;
					charpanel_ch2.visible = false;
					charpanel_ch3.visible = false;
					charpanel_ch4.visible = false;
					inbar.visible = true;
					break;
				case "EXTRA":
					charpanel_normal.visible = false;
					charpanel_ch1.visible = false;
					charpanel_ch2.visible = true;
					charpanel_ch3.visible = false;
					charpanel_ch4.visible = false;
					inbar.visible = true;
					break;
				case "TRANSPARENT":
					charpanel_normal.visible = false;
					charpanel_ch1.visible = false;
					charpanel_ch2.visible = false;
					charpanel_ch3.visible = true;
					charpanel_ch4.visible = false;
					inbar.visible = true;
					break;
				case "SLOW":
					charpanel_normal.visible = false;
					charpanel_ch1.visible = false;
					charpanel_ch2.visible = false;
					charpanel_ch3.visible = false;
					charpanel_ch4.visible = true;
					inbar.visible = true;
					global.playerSpeed = global.powerup_slowdown_speed;
					break;
					
				default:
					completePlay();
					global.playerSpeed = originalplayerspeed;
					charpanel_normal.visible = true;
					charpanel_ch1.visible = false;
					charpanel_ch2.visible = false;
					charpanel_ch3.visible = false;
					charpanel_ch4.visible = false;
					inbar.visible = false;
					
					//reset
					inbar.x = 0;
					timecount = -1;
					break;
			}
			
			if (global.powerup_type != "NORMAL" && timecount == -1)
			{
				runPowerUp();
			}
		}
		
		private function runPowerUp():void
		{
			i = setInterval(everySecond, 1000); //every 1 second
			timecount = 0;
		}
		
		private function everySecond():void 
		{
			if (timecount < global.powerup_duration)
			{
				inbar.x += sizeofstep;
				
				if (global.powerup_type == "EXTRA")
				{
					global.score += global.powerup_extracoin_amount;
				}
				
				if (timecount == global.powerup_duration-1)
				{
					global.powerup_type = "NORMAL";
					completePlay();
					timecount = -1;
					inbar.x = 0;
				}
				else timecount++;
			}
		}
		
		protected function completePlay():void
		{
			clearInterval(i);
		}
		
	}

}