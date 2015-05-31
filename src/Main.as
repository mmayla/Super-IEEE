package 
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import Importers.global;
	import Sounds;
	import starling.core.Starling;
	
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	[SWF(width="800", height="480", frameRate="60", backgroundColor="#FFFFFF")]
	public class Main extends Sprite 
	{
		private var _starling:Starling;
		public function Main():void 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//add gloabl vars
			global.soundsplayer = new Sounds();
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
			
			_starling = new Starling(Game, this.stage);
			
			// Define basic anti aliasing.
			_starling.antiAliasing = 1;
			
			// Show statistics for memory usage and fps.
			//_starling.showStats = true;
			
			// Position stats.
			//_starling.showStatsAt("left", "top");
			
			_starling.start();
		}
		
	}
	
}