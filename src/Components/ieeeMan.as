package Components 
{
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import Importers.Assets;
	
	/**
	 * ...
	 * @author AbdoSaeed
	 */
	public class ieeeMan extends Sprite 
	{
		private var manArt:MovieClip;
		private var _state:String="NORMAL";
		
		public function ieeeMan() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		public function onAddedToStage(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createHeroArt();
		}
		public function createHeroArt():void {
			manArt = new MovieClip(Assets.getAtlas().getTextures("IEEEman"), 13);
			manArt.pivotX = manArt.width / 2;
			manArt.pivotY = manArt.height / 2;
			manArt.scaleX = 0.5;
			manArt.scaleY = 0.5;
			manArt.rotation = 0.4;
			Starling.juggler.add(manArt);
			this.addChild(manArt);
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		
	}

}