require File.dirname(__FILE__) + "/../../" + "tsp/linear_distance"
require File.dirname(__FILE__) + "/../../" + "tsp/geo_coordinate"
require File.dirname(__FILE__) + "/../../" + "genetic/gene"
require File.dirname(__FILE__) + "/../../" + "tsp/city"

describe City do
  
  before(:each) do
    @berlin = "7,Berlin,52,31,24,N,13,24,41,E,350,170"
    @saarbruecken = "18,Saarbrücken,49,14,5,N,6,59,40,E,90,340"
  end
  
  it "should create the city berlin" do
    berlin = City.build_from_csv_record(@berlin)
    berlin.should be_instance_of(City)
  end
  
  
  it "should create berlin and saarbrücken and calculate the linear distance between them as something near 798 km" do
    berlin = City.build_from_csv_record(@berlin)
    sb = City.build_from_csv_record(@saarbruecken)
    
    berlin_sb = berlin.distance_to(sb)
    berlin_sb.should be_close(798.0174571413487, 50)
  end
  
  it "should build 21 cities from csv file" do
    cities = City.build_from_csv_file(File.dirname(__FILE__) + "/../../" + "tsp/coordinates.csv")
    cities.size.should be(21)
    cities[0].should be_instance_of(City)
  end
end