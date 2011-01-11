package com.universalmind.geotools
{
	public class Point
	{
		
		private var _lat:Number=0;
		private var _lon:Number=0;
		
		public function Point(latitude:Number=0,longitude:Number=0)
		{
			this._lat=latitude;
			this._lon=longitude;			
		}
		
		public function get latitude():Number{
			return _lat;
		}
		
		public function set latitude(value:Number):void{
			this._lat=value;
		}
		
		public function get longitude():Number{
			return this._lon
		}
		
		public function set longitude(value:Number):void{
			this._lon=value;
		}
		
	}
}