package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Mohamed Mayla (Divoo)
	 */
	public class Sounds 
	{
		//Embedded sound
		[Embed(source = "../media/sounds/start.mp3")]
		public var SND_START:Class;
		
		[Embed(source="../media/sounds/creditscreen.mp3")]
		public var SND_CREDIT:Class;
		
		[Embed(source = "../media/sounds/play.mp3")]
		
		public var SND_PLAY:Class;
		
		[Embed(source="../media/sounds/hit.mp3")]
		public var SND_HIT:Class;
		
		[Embed(source="../media/sounds/lose.mp3")]
		public var SND_LOSE:Class;
		
		[Embed(source="../media/sounds/coin.mp3")]
		public var SND_COIN:Class;
		
		[Embed(source="../media/sounds/powerup.mp3")]
		public var SND_POWERUP:Class;
		
		
		//Initialized Sound objects
		public var sndstart:Sound;
		public var sndcredit:Sound;
		public var sndplay:Sound;
		public var sndhit:Sound;
		public var sndlose:Sound;
		public var sndcoin:Sound;
		public var sndpowerup:Sound;
		
		public function Sounds()
		{
			/*sndstart = new Sound();
			sndcredit = new Sound();
			sndplay = new Sound();
			sndhit = new Sound();
			sndlose = new Sound();
			sndfinish = new Sound();
			sndcoin = new Sound();
			sndpowerup = new Sound();
			
			
			sndstart.load(new URLRequest("../media/sounds/start.mp3"));
			sndcredit.load(new URLRequest("../media/sounds/creditscreen.mp3"));
			sndplay.load(new URLRequest("../media/sounds/play.mp3"));
			sndhit.load(new URLRequest("../media/sounds/hit.mp3"));
			sndlose.load(new URLRequest("../media/sounds/lose.mp3"));
			sndfinish.load(new URLRequest("../media/sounds/endscreen.mp3"));
			sndcoin.load(new URLRequest("../media/sounds/coin.mp3"));
			sndpowerup.load(new URLRequest("../media/sounds/powerup.mp3"));*/
			
			sndstart = (new SND_START) as Sound;
			sndcredit = (new SND_CREDIT) as Sound;
			sndplay = (new SND_PLAY) as Sound;
			sndhit = (new SND_HIT) as Sound;
			sndlose = (new SND_LOSE) as Sound;
			sndcoin = (new SND_COIN) as Sound;
			sndpowerup = (new SND_POWERUP) as Sound;
		}
		
	}

}