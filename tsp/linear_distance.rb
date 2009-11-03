# Calculates the linear distances (relative to a earth ellipsoid).
class LinearDistance

  # === Parametes
  # Geo coordinate objects.
  def self.distance_to(from, to)  
    dputs "FROM (laenge, breite)"
    lon_from = from.lon_radiant
    lat_from = from.lat_radiant    
    dputs lon_from
    dputs lat_from
    
    dputs "FROM (laenge, breite)"    
    lat_to = to.lat_radiant
    lon_to = to.lon_radiant
    dputs lon_to
    dputs lat_to

    one = (lat_from - lat_to) / 2.0
    dputs "One: #{one}"
            
    two = (lon_from - lon_to) / 2.0
    dputs "Two: #{two}"

    sin2two = two ** 2.0
    dputs "Sin2two: #{sin2two}"
    
    three = Math.cos(lat_from) * Math.cos(lat_to)
    dputs "Three: #{three}"
    

    sin2one = one ** 2.0
    dputs "sin2one: #{sin2one}"
    
    four = sin2one + (three * sin2two)
    dputs "Four: #{four}"

    mysqrt = Math.sqrt(four)
    dputs "sqrt: #{mysqrt}"

    five = Math.asin(mysqrt)
    dputs "Five: #{five}"


    d_radiant = 2.0 * five
    dputs "d_radiant: #{d_radiant}"

    six = (180.0*60.0 / Math::PI) * d_radiant * 1.85
    dputs "Six: #{six}"

    return six
  end
  
  def self.dputs(arg)
    debug = false
    puts arg if debug
  end
end