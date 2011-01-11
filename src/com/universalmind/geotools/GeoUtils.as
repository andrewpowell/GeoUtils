package com.universalmind.geotools
{
	public class GeoUtils
	{
		
		public function GeoUtils()
		{
		}
		
		public static function distance(pointFrom:Point,pointTo:Point):Number{
			
			var latA:Number=toRad(pointFrom.latitude);
			var latB:Number=toRad(pointTo.latitude);
			var lonA:Number=toRad(pointFrom.longitude);
			var lonB:Number=toRad(pointTo.longitude);
			
			var delta:Number = Math.acos(Math.sin(latA)*Math.sin(latB) + 
						Math.cos(latA)*Math.cos(latB) *
						Math.cos(lonB-lonA)) * GeoConstants.R;
						
			return delta;
		}
		
		public static function bearing(pointFrom:Point,pointTo:Point):Number{
			var lonFrom:Number = toRad(pointFrom.longitude);
			var latFrom:Number = toRad(pointFrom.latitude);
			var lonTo:Number   = toRad(pointTo.longitude);
			var latTo:Number   = toRad(pointTo.latitude);
			
			var dLon:Number = delta(pointFrom.longitude,pointTo.longitude);
			var y:Number = Math.sin(dLon) * Math.cos(latTo);
			var x:Number = Math.cos(latFrom)*Math.sin(latTo) - Math.sin(latFrom)*Math.cos(latTo)*Math.cos(dLon);
			return Math.round(toDeg(Math.atan2(y,x)));
		}
		
		public static function midpoint(pointFrom:Point,pointTo:Point):Point{
			var lonFrom:Number = toRad(pointFrom.longitude);
			var latFrom:Number = toRad(pointFrom.latitude);
			var lonTo:Number   = toRad(pointTo.longitude);
			var latTo:Number   = toRad(pointTo.latitude);
			
			var dLon:Number = delta(pointFrom.longitude,pointTo.longitude);
			var Bx:Number = Math.cos(latTo)*Math.cos(dLon);
			var By:Number = Math.cos(latTo)*Math.sin(dLon);
			var point:Point=new Point();
			point.latitude = toDeg(Math.atan2(Math.sin(latFrom)+Math.sin(latTo),
								   Math.sqrt((Math.cos(latFrom)+Bx)*(Math.cos(latFrom)+Bx)+By*By)));
			point.longitude= toDeg(lonFrom + Math.atan2(By, Math.cos(latFrom) + Bx));
			return point;			
		}
		
		
		private static function toRad(degrees:Number):Number{
			return degrees * GeoConstants.RadConv;
		}
		
		private static function toDeg(radians:Number):Number{
			return (radians*180/Math.PI);
		}
		
		private static function delta(from:Number,to:Number):Number{
			return toRad(to-from);
		}
		
		
		
		
	}
}