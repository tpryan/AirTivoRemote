package com.terrenceryan.tivoremote
{
	public class TivoRemote
	{
		
		private var _log:String = "";
		
		private const UP:String = "IRCODE UP";
		private const DOWN:String = "IRCODE DOWN";
		private const LEFT:String = "IRCODE LEFT";
		private const RIGHT:String = "IRCODE RIGHT";
		private const SELECT:String = "IRCODE SELECT";
		private const TIVO:String = "IRCODE TIVO";
		private const LIVETV:String = "IRCODE LIVETV";
		private const THUMBSUP:String = "IRCODE THUMBSUP";
		private const THUMBSDOWN:String = "IRCODE THUMBSDOWN";
		private const CHANNELUP:String = "IRCODE CHANNELUP";
		private const CHANNELDOWN:String = "IRCODE CHANNELDOWN";
		private const RECORD:String = "IRCODE RECORD";
		private const DISPLAY:String = "IRCODE DISPLAY";
		private const DIRECTV:String = "IRCODE DIRECTV";
		private const NUM0:String = "IRCODE NUM0";
		private const NUM1:String = "IRCODE NUM1";
		private const NUM2:String = "IRCODE NUM2";
		private const NUM3:String = "IRCODE NUM3";
		private const NUM4:String = "IRCODE NUM4";
		private const NUM5:String = "IRCODE NUM5";
		private const NUM6:String = "IRCODE NUM6";
		private const NUM7:String = "IRCODE NUM7";
		private const NUM8:String = "IRCODE NUM8";
		private const NUM9:String = "IRCODE NUM9";
		private const ENTER:String = "IRCODE ENTER";
		private const CLEAR:String = "IRCODE CLEAR";
		private const PLAY:String = "IRCODE PLAY";
		private const PAUSE:String = "IRCODE PAUSE";
		private const SLOW:String = "IRCODE SLOW";
		private const FORWARD:String = "IRCODE FORWARD";
		private const REVERSE:String = "IRCODE REVERSE";
		private const STANDBY:String = "IRCODE STANDBY";
		private const NOWSHOWING:String = "IRCODE NOWSHOWING";
		private const REPLAY:String = "IRCODE REPLAY";
		private const ADVANCE:String = "IRCODE ADVANCE";
		private const DELIMITER:String = "IRCODE DELIMITER";
		private const GUIDE:String = "IRCODE GUIDE";
		
		
		private var _ipaddress:String = null;
		private var _telnet:Telnet = null;
		private var TIVOPORT:int = 31339;
		
		
		public function TivoRemote(ipaddress:String)
		{
			this.ipaddress = ipaddress;
			_telnet = new Telnet(_ipaddress, TIVOPORT);
		}
		
		public function get log():String
		{
			return _telnet.log;
		}

		public function set log(value:String):void
		{
			_log = value;
		}

		public function up():void{
			_telnet.send(UP);
		}
		public function down():void{
			_telnet.send(DOWN);
		}
		public function left():void{
			_telnet.send(LEFT);
		}
		public function right():void{
			_telnet.send(RIGHT);
		}
		public function select():void{
			_telnet.send(SELECT);
		}
		public function tivo():void{
			_telnet.send(TIVO);
		}
		public function livetv():void{
			_telnet.send(LIVETV);
		}
		public function thumbsup():void{
			_telnet.send(THUMBSUP);
		}
		public function thumbsdown():void{
			_telnet.send(THUMBSDOWN);
		}
		public function channelup():void{
			_telnet.send(CHANNELUP);
		}
		public function channeldown():void{
			_telnet.send(CHANNELDOWN);
		}
		public function record():void{
			_telnet.send(RECORD);
		}
		public function display():void{
			_telnet.send(DISPLAY);
		}
		public function directv():void{
			_telnet.send(DIRECTV);
		}
		public function num0():void{
			_telnet.send(NUM0);
		}
		public function num1():void{
			_telnet.send(NUM1);
		}
		public function num2():void{
			_telnet.send(NUM2);
		}
		public function num3():void{
			_telnet.send(NUM3);
		}
		public function num4():void{
			_telnet.send(NUM4);
		}
		public function num5():void{
			_telnet.send(NUM5);
		}
		public function num6():void{
			_telnet.send(NUM6);
		}
		public function num7():void{
			_telnet.send(NUM7);
		}
		public function num8():void{
			_telnet.send(NUM8);
		}
		public function num9():void{
			_telnet.send(NUM9);
		}
		public function enter():void{
			_telnet.send(ENTER);
		}
		public function clear():void{
			_telnet.send(CLEAR);
		}
		public function play():void{
			_telnet.send(PLAY);
		}
		public function pause():void{
			_telnet.send(PAUSE);
		}
		public function slow():void{
			_telnet.send(SLOW);
		}
		public function forward():void{
			_telnet.send(FORWARD);
		}
		public function reverse():void{
			_telnet.send(REVERSE);
		}
		public function standby():void{
			_telnet.send(STANDBY);
		}
		public function nowshowing():void{
			_telnet.send(NOWSHOWING);
		}
		public function replay():void{
			_telnet.send(REPLAY);
		}
		public function advance():void{
			_telnet.send(ADVANCE);
		}
		public function delimiter():void{
			_telnet.send(DELIMITER);
		}
		public function guide():void{
			_telnet.send(GUIDE);
		}
		

		public function get ipaddress():String
		{
			return _ipaddress;
		}

		public function set ipaddress(value:String):void
		{
			_ipaddress = value;
		}

	}
}