package Importers 
{
	import Components.ieeeMan;
	/**
	 * ...
	 * @author AbdoSaeed
	 */
	public class global 
	{
		private static var _playerstep:int = 4;
		private static var _playerSpeed:int = 30;
		private static var _score:int = 0;
		private static var _game:Game;
		private static var _parallaxDepthbg1:Number = 0.02;
		private static var _parallaxDepthbg2:Number = 0.2;
		private static var _player:ieeeMan;
		private static var _gamestate:String="START"; //"START" , "PLAY" , "CREDIT" , "FINISH" , "TUTORIAL"
		
		//power up statue
		private static var _powerup_duration:int = 5;
		private static var _powerup_type:String = "NORMAL"; //"NORMAL", "MAGNET", "EXTRA", "TRANSPARENT", "SLOW"
		private static var _powerup_extracoin_amount:int = 5;
		private static var _powerup_slowdown_speed:int = 15;
		private static var _powerup_coinspeed:int = 2;
		
		//elements aligning
		private static var _coinSeperator:int=50;
		
		//sounds
		private static var _soundsplayer:Sounds;
		public static var _sndstart:Boolean=false;
		public static var _sndcredit:Boolean=false;
		public static var _sndplay:Boolean=false;
		public static var _sndhit:Boolean=false;
		public static var _sndlose:Boolean=false;
		public static var _sndfinish:Boolean=false;
		public static var _sndcoin:Boolean=false;
		public static var _sndpowerup:Boolean=false;
		
		public function global() 
		{
			
		}
		
		static public function get score(): int
		{
			return _score;
		}
		
		static public function set score(value:int):void 
		{
			_score = value;
		}
		
		static public function get playerSpeed():int
		{
			return _playerSpeed;
		}
		
		static public function set playerSpeed(value:int):void 
		{
			_playerSpeed = value;
		}
		
		static public function set game(value:Game): void
		{
			_game = value;
		}
		
		static public function get game(): Game
		{
			return _game;
		}
		
		static public function set parallaxDepthbg1(value:Number): void
		{
			_parallaxDepthbg1 = value;
		}
		
		static public function get parallaxDepthbg1(): Number
		{
			return _parallaxDepthbg1;
		}
		
		static public function set parallaxDepthbg2(value:Number): void
		{
			_parallaxDepthbg2 = value;
		}
		
		static public function get parallaxDepthbg2(): Number
		{
			return _parallaxDepthbg2;
		}
		
		static public function get player():ieeeMan 
		{
			return _player;
		}
		
		static public function set player(value:ieeeMan):void 
		{
			_player = value;
		}
		
		static public function get gamestate():String 
		{
			return _gamestate;
		}
		
		static public function set gamestate(value:String):void 
		{
			_gamestate = value;
		}
		
		static public function get playerstep():int 
		{
			return _playerstep;
		}
		
		static public function set playerstep(value:int):void 
		{
			_playerstep = value;
		}
		
		static public function get coinSeperator():int 
		{
			return _coinSeperator;
		}
		
		static public function set coinSeperator(value:int):void 
		{
			_coinSeperator = value;
		}
		
		static public function get powerup_duration():int 
		{
			return _powerup_duration;
		}
		
		static public function set powerup_duration(value:int):void 
		{
			_powerup_duration = value;
		}
		
		static public function get powerup_type():String 
		{
			return _powerup_type;
		}
		
		static public function set powerup_type(value:String):void 
		{
			_powerup_type = value;
		}
		
		static public function get powerup_extracoin_amount():int 
		{
			return _powerup_extracoin_amount;
		}
		
		static public function set powerup_extracoin_amount(value:int):void 
		{
			_powerup_extracoin_amount = value;
		}
		
		static public function get powerup_slowdown_speed():int 
		{
			return _powerup_slowdown_speed;
		}
		
		static public function set powerup_slowdown_speed(value:int):void 
		{
			_powerup_slowdown_speed = value;
		}
		
		static public function get powerup_coinspeed():int 
		{
			return _powerup_coinspeed;
		}
		
		static public function set powerup_coinspeed(value:int):void 
		{
			_powerup_coinspeed = value;
		}
		
		static public function get soundsplayer():Sounds 
		{
			return _soundsplayer;
		}
		
		static public function set soundsplayer(value:Sounds):void 
		{
			_soundsplayer = value;
		}
		
	}

}