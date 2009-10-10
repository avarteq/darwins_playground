# Represents a geographic coordinate.
class GeoCoordinate
  
  attr_accessor :lat_degrees, :lat_min, :lat_s, :lat_direction, :lon_degrees, :lon_min, :lon_s, :lon_direction
  attr_accessor :lat_radiant, :lon_radiant
  attr_accessor :lat_dec, :lon_dec
    
    
  # Pass latitude and longditude in hours, minutes and seconds.
  def initialize(lat_degrees, lat_min, lat_s, lat_direction, lon_degrees, lon_min, lon_s, lon_direction)
    @lon_degrees = lon_degrees.to_i
    @lon_min = lon_min.to_i
    @lon_s = lon_s.to_i
    @lon_direction = lon_direction
    @lat_degrees = lat_degrees.to_i
    @lat_min = lat_min.to_i
    @lat_s = lat_s.to_i
    @lat_direction = lat_direction

    convert_coords_to_radiant()
    convert_coords_to_decimal()
  end

  # Creates a geo coord using the given coords as a string.
  # ===Example
  # Berlin: "52,22,71,N,13,31,23,E"
  def self.build_from_coords_string(coordinate_string)
    coords = coordinate_string.split(/,/)    
    build_from_coords_array(coords)
  end
  
  # === Example
  # [52,22,71,"N",13,31,23,"E"]
  def self.build_from_coords_array(coords)
    GeoCoordinate.new(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7])
  end  
  
  # Converts to Google GLatLng
  def to_g_lat_lng
    'new GLatLng(' + @lat_dec.to_s + ' , ' + @lon_dec.to_s + ')'
  end
  
  private
  
  # Converts angle using time representation to decimal angle values.
  # 52°,31',24''' --> 52.523
  def convert_coords_to_decimal
    @lat_dec = convert_angle_minutes_to_decimal(@lat_degrees, @lat_min, @lat_s)
    @lon_dec = convert_angle_minutes_to_decimal(@lon_degrees, @lon_min, @lon_s)
    
    @lon_dec * -1 if @lon_direction == "E"
    @lat_dec * -1 if @lat_direction == "S"    
  end
  
  # Get radiant representation of the geo coordindate
  def convert_coords_to_radiant
    @lon_radiant = convert_lat_or_lon_to_radiant(@lon_degrees, @lon_min, @lon_s)
    @lat_radiant = convert_lat_or_lon_to_radiant(@lat_degrees, @lat_min, @lat_s)    
    
        
    @lon_radiant * -1 if @lon_direction == "E"
    @lat_radiant * -1 if @lat_direction == "S"
  end
  
  # Does not include direction. (E, S, W, N)
  def convert_lat_or_lon_to_radiant(degrees, min, s)
    decimal_degrees = convert_angle_minutes_to_decimal(degrees, min, s)
    radiant = convert_decimal_degrees_to_radiant(decimal_degrees)
    return radiant
  end
  
  # Converts angle using time representation to decimal angle values.
  # 52°,31',24''' --> 52.523
  def convert_angle_minutes_to_decimal(degrees, min, s)
    return (degrees + ( min + s / 60.0) / 60.0 )
  end
  
  def convert_decimal_degrees_to_radiant(decimal_degrees)
    rad = (Math::PI * decimal_degrees) / 180.0
  end
end