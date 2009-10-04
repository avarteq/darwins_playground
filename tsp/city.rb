class City < Gene
  
  attr_accessor :name, :geo_coordinate
  
  def initialize(gene_id, name, geo_coordinate)
    super(gene_id)    
    @name = name
    @geo_coordinate = geo_coordinate
  end
  
  # Builds a city from a given coords string.
  # "7,Berlin,52,22,71,N,13,31,23,E"
  def self.build_from_csv_record(coords_string)
    coords = coords_string.split(/,/)
    gene_id = coords[0]
    name = coords[1]
    
    2.times { coords.shift }
    
    geo_coords = GeoCoordinate.build_from_coords_array(coords)
    return City.new(gene_id, name, geo_coords)
  end
  
  def self.build_from_csv_file(csv_filename)
    cities = []
    city = nil
    
    csv = File.open(csv_filename)
    csv.each_line do |record|
      city = City.build_from_csv_record(record)
      cities << city
    end
    
    return cities
  end
  
  # Calculates the distance between given cities.
  def distance_to(city)
    LinearDistance.distance_to(geo_coordinate, city.geo_coordinate)
  end
  
end