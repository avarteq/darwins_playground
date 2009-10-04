require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance"
require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"

describe LinearDistance do
  
  before(:each) do
    @berlin = "52,31,24,N,13,24,41,E"
    @saarbruecken = "49,14,5,N,6,59,40,E"
  end
  
  it "should calculate the linear distance between berlin and saarbrücken as something near 798 km" do
    berlin = GeoCoordinate.build_from_coords_string(@berlin)
    sb = GeoCoordinate.build_from_coords_string(@saarbruecken)
    
    berlin_sb = LinearDistance.distance_to(berlin, sb)
    berlin_sb.should be_close(798.0174571413487, 50)
  end
end