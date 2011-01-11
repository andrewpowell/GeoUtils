package flexUnitTests
{
	import com.universalmind.geotools.GeoUtils;
	import com.universalmind.geotools.Point;
	
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	public class TestGeoUtils
	{	
		
		private var pointA:Point = new Point(38.898748,-77.037684);
		private var pointB:Point = new Point(40.755932,-73.486508);
		
		[Before]
		public function setUp():void
		{
			
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testBearing():void
		{
			var bearing:Number = GeoUtils.bearing(pointA,pointB);
			Assert.assertTrue(bearing==55);
		}
		
		[Test]
		public function testDistance():void
		{
			var distance:Number = GeoUtils.distance(pointA,pointB);
			Assert.assertTrue(distance==366.8405004900219);
		}
		
		[Test]
		public function testMidpoint():void
		{
			var midpoint:Point = GeoUtils.midpoint(pointA,pointB);
			Assert.assertTrue(39.84087294762936==midpoint.latitude);
			Assert.assertTrue(-75.2861050960642==midpoint.longitude);
		}
	}
}