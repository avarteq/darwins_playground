# Calculates the linear distances (relative to a earth ellipsoid).
class LinearDistance

  # === Parametes
  # Geo coordinate objects.
  def self.distance_to(from, to)  
    dputs "FROM (länge, breite)"
    lon_from = from.lon_radiant
    lat_from = from.lat_radiant    
    dputs lon_from
    dputs lat_from
    
    dputs "FROM (länge, breite)"    
    lat_to = to.lat_radiant
    lon_to = to.lon_radiant
    dputs lon_to
    dputs lat_to


    #     double eins =
    #     (getCoordinate().getBreiteRadiant() - city.coordinate.getBreiteRadiant())/2;     // ergebnis korrekt 0.022044478080050667    
    one = (lat_from - lat_to) / 2.0
    dputs "One: #{one}"
    
    #     double zwei =
    #     (getCoordinate().getLaengeRadiant() - city.getCoordinate().getLaengeRadiant())/2;      // ergebnis korrekt 0.041165529663010694    
    two = (lon_from - lon_to) / 2.0
    dputs "Two: #{two}"

    #     double sin2zwei = Math.pow(zwei,2.0);   // ergebnis korrekt   0.0016946008324362134
    sin2two = two ** 2.0
    dputs "Sin2two: #{sin2two}"
    
    #     double drei = Math.cos(coordinate.getBreiteRadiant()) * Math.cos(city.getCoordinate().getBreiteRadiant());   //ergebnis korrekt 0.3905040077815
    three = Math.cos(lat_from) * Math.cos(lat_to)
    dputs "Three: #{three}"
    

    #     double sin2eins = Math.pow(eins,2.0);   // Ergebnis korrekt 4.8595901382183436E-4    
    sin2one = one ** 2.0
    dputs "sin2one: #{sin2one}"
    
    #      double vier = sin2eins + (drei * sin2zwei);     // ergebnis korrekt 0.0011477074304782104

    four = sin2one + (three * sin2two)
    dputs "Four: #{four}"

    #     double wurzel = Math.sqrt(vier);        //ergebnis korrekt 0.03387783095887649
    mysqrt = Math.sqrt(four)
    dputs "sqrt: #{mysqrt}"

    #     double fuenf = Math.asin(wurzel);       // ergebnis korrekt 0.033884314614424496
    five = Math.asin(mysqrt)
    dputs "Five: #{five}"


    #     double d_radiant = 2.0* fuenf;
    d_radiant = 2.0 * five
    dputs "d_radiant: #{d_radiant}"

    #     double sechs = (180.0*60.0/Math.PI) * d_radiant *1.85;    // ergenis korrekt 232.9713862919975

    six = (180.0*60.0 / Math::PI) * d_radiant * 1.85
    dputs "Six: #{six}"

    return six
  end
  
  def self.dputs(arg)
    debug = false
    puts arg if debug
  end
end