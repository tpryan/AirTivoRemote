package com.terrenceryan.tivoremote
{
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;

	public class TivoService
	{
		private var connection:SQLConnection = new SQLConnection();
		private var dbFile:File = File.applicationStorageDirectory.resolvePath("tivo.db"); 
		private var dbStatement:SQLStatement = new SQLStatement();
		
		private var _tivos:ArrayCollection = new ArrayCollection();
		private var _active:Tivo = null;
		
		
		public function TivoService()
		{
			connection.addEventListener(SQLEvent.OPEN, createTables);
			connection.open(dbFile);
			
			trace('Connection Opened.');
		}
		
		public function get active():Tivo
		{
			return _active;
		}

		public function set active(value:Tivo):void
		{
			_active = value;
		}

		public function get tivos():ArrayCollection
		{
			return _tivos;
		}

		private function set tivos(value:ArrayCollection):void
		{
			_tivos = value;
		}

		private function createTables(e:SQLEvent):void{
			var sql:SQLStatement = new SQLStatement();
			
			
			var text:String = "CREATE TABLE IF NOT EXISTS tivo (" +   
				"    id INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				"    name VARCHAR, " +   
				"    hostname VARCHAR, " +
				"    active INTEGER" +   
				")"; 
			sql.sqlConnection = connection;
			sql.text = text;
			sql.addEventListener(SQLEvent.RESULT, loadData);
			sql.execute();
			trace('Tables Created.');
			
		}
		
		public function add(tivo:Tivo):void{
			var active:int = 0;
			
			if(tivo.active == true){
				active = 1;
			}
			
			
			
			trace('Record Save started.');
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = connection;
			var text : String = "INSERT INTO tivo ( name, hostname, active) " +
				"VALUES ( '" + tivo.name +"', '" + tivo.hostname +"', '" + active + "')";
			sql.text = text;
			trace('Record Save Requested.');
			sql.execute();
			
		}
		
		public function destroy(tivo:Tivo):void{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = connection;
			var text:String = 	"DELETE FROM tivo  " +
								"WHERE id = " + tivo.id + ";";
			sql.text = text;
			sql.execute();
			
		}
		
		
		
		public function update(tivo:Tivo):void{
			var sql:SQLStatement = new SQLStatement();
			sql.sqlConnection = connection;
			
			var active:int = 0;
			
			if(tivo.active == true){
				active = 1;
			}
			
			var text:String =   "UPDATE tivo " +
								"SET name = '" + tivo.name + "', "+
								"	 hostname = '" + tivo.hostname + "', "+
								"	 active = '" + active + "' "+
								"WHERE id = " + tivo.id + ";";
			
			sql.text = text;
			sql.execute();
			sql.addEventListener(SQLEvent.RESULT, onRetrieveDataResult);
			
		}
		
		private function loadData(e:SQLEvent):void
		{
			dbStatement = new SQLStatement();
			dbStatement.sqlConnection = connection;
			var text:String = "select * from tivo";
			dbStatement.text = text;
			dbStatement.addEventListener(SQLEvent.RESULT, onRetrieveDataResult);
			dbStatement.execute();
			trace('Records Requested.');
		}
		
		private function onRetrieveDataResult(e:SQLEvent):void
		{
			var result:SQLResult = dbStatement.getResult();
			var ac:ArrayCollection = new ArrayCollection();
			for each( var el : Object in result.data )
			{
				var tivo:Tivo = new Tivo();
				tivo.id = el.id;
				tivo.name = el.name;
				tivo.hostname = el.hostname;
				if (el.active == 1){
					tivo.active = true;
				}
				else{
					tivo.active = false;
				}
				
				ac.addItem( tivo );
				
				if (el.active == 1){
					_active = tivo;
				}
				
				
			}
			trace('Records Loaded.');
			_tivos = ac;
		}

		
		
		
	}
}