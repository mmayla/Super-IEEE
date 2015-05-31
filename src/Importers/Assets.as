package Importers
{
	import flash.display.Bitmap;
	import flash.text.Font;
	import flash.utils.Dictionary;
	
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import starling.text.TextField;

	public class Assets
	{
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		//font
		[Embed(source="../../media/font/angrybirds-regular.ttf", embedAsCFF = "false", fontFamily = "angrybirds-regular")]
		private static const hudfont:Class;
		
		[Embed(source="../../media/spritesheet.png")]
		public static const AtlasTexture:Class;
		
		[Embed(source="../../media/spritesheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXml:Class;
		
		//backgrounds assets
		[Embed(source="../../media/bg1.png")]
		public static const bg1:Class;
		
		[Embed(source="../../media/startbg.jpg")]
		public static const strtbg:Class;
		
		//power up statue
		[Embed(source="../../media/power up statue/normal.png")]
		public static const powerupstat_normal:Class;
		
		[Embed(source="../../media/power up statue/char1.png")]
		public static const powerupstat_char1:Class;
		
		[Embed(source="../../media/power up statue/char2.png")]
		public static const powerupstat_char2:Class;
		
		[Embed(source="../../media/power up statue/char3.png")]
		public static const powerupstat_char3:Class;
		
		[Embed(source="../../media/power up statue/char4.png")]
		public static const powerupstat_char4:Class;
		
		[Embed(source="../../media/power up statue/bar.png")]
		public static const powerupstat_bar:Class;
		
		//screens
		[Embed(source="../../media/credit screen.png")]
		public static const creditscreen:Class;
		
		[Embed(source="../../media/tutorial screen.png")]
		public static const tutorialscreen:Class;
		
		[Embed(source="../../media/IEEE_LOGO.png")]
		public static const ieeecusblogo:Class;
		
		//buttons
		[Embed(source="../../media/buttons/credit_icon.png")]
		public static const creditbtn:Class;
		
		[Embed(source="../../media/buttons/main_menu_button.png")]
		public static const mainmenbtn:Class;
		
		[Embed(source="../../media/buttons/start_button.png")]
		public static const startbtn:Class;
		
		[Embed(source="../../media/buttons/tutorial_button.png")]
		public static const tutorialbtn:Class;
		
		//bubbles
		[Embed(source="../../media/bubble.png")]
		public static const bubbleImg:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTexture");
				var xml:XML = XML(new AtlasXml());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}

		
		public static function getTexture(name:String):Texture
		{
			
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
			
		}
	}
}