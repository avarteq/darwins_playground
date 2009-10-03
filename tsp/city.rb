class City < Gene
  
  attr_accessor :name, :lat, :lon
  
  def initialize(gene_id, name, lat, lon)
    super(gene_id)    
    @name = name
    @lat = lat
    @lon = lon
  end
  
  
  # Should be exchangable. Maybe port to the f-function.
  # public double distanceTo(City city) {
  def distance_to(city)

    one = lat - city.lat / 2.0
    two = lon - city.long / 2.0
    sin2two = two ** 2.0
    three = Math.cos(lat) * Math.cos(city.lat)
    
    
    #     double eins =
    #     (getCoordinate().getBreiteRadiant() - city.coordinate.getBreiteRadiant())/2;     // ergebnis korrekt 0.022044478080050667

    
    #     double zwei =
    #     (getCoordinate().getLaengeRadiant() - city.getCoordinate().getLaengeRadiant())/2;      // ergebnis korrekt 0.041165529663010694

    #     double sin2zwei = Math.pow(zwei,2.0);   // ergebnis korrekt   0.0016946008324362134


    #     double drei = Math.cos(coordinate.getBreiteRadiant()) * Math.cos(city.getCoordinate().getBreiteRadiant());   //ergebnis korrekt 0.3905040077815


    #     double sin2eins = Math.pow(eins,2.0);   // Ergebnis korrekt 4.8595901382183436E-4
    
    sin2one = one ** 2.0
    
    #      double vier = sin2eins + (drei * sin2zwei);     // ergebnis korrekt 0.0011477074304782104

    four = sin2one + (three * sin2two)

    #     double wurzel = Math.sqrt(vier);        //ergebnis korrekt 0.03387783095887649
    mysqrt = Math.sqrt(four)

    #     double fuenf = Math.asin(wurzel);       // ergebnis korrekt 0.033884314614424496
    five = Math.asin(mysqrt)
    


    #     double d_radiant = 2.0* fuenf;
    d_radiant = 2.0 * five

    #     double sechs = (180.0*60.0/Math.PI) * d_radiant *1.85;    // ergenis korrekt 232.9713862919975

    six = (180.0*60.0 / Math::PI) * d_radiant

    return six
  end
  
end