require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"

describe GeoCoordinate do
  it "should create a geo coordinate" do
    
    berlin = "52,31,24,N,13,24,41,E"
    #saarbruecken = "49,14,2,N,6,58,35,E"
    
    bc = GeoCoordinate.build_from_coords_string(berlin)
    bc.lon_degrees.should be(52)
    bc.lon_min.should be(31)
    bc.lon_s.should be(24)
    bc.lon_direction.should eql("N")
    bc.lat_degrees.should be(13)
    bc.lat_min.should be(24)
    bc.lat_s.should be(41)
    bc.lat_direction.should eql("E")    
  end
  
  it "should create a geo coordinate and calculate radiant lat/lon of berlin" do 
    berlin = "52,22,71,N,13,31,23,E"    
    
    bc = GeoCoordinate.build_from_coords_string(berlin)
    bc.lat_radiant.should be_close(0.2360218443745554, 0.001)
    bc.lon_radiant.should be_close(0.914314969341285, 0.001)
  end
end