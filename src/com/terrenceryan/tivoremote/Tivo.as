package com.terrenceryan.tivoremote
{
	public class Tivo
	{
		private var _id:int = 0;
		private var _name:String = null;
		private var _hostname:String = null;
		private var _active:Boolean = true;
		
		public function Tivo()
		{
		}

		public function get active():Boolean
		{
			return _active;
		}

		public function set active(value:Boolean):void
		{
			_active = value;
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function get hostname():String
		{
			return _hostname;
		}

		public function set hostname(value:String):void
		{
			_hostname = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

	}
}