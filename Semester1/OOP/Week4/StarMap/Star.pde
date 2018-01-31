class Star
{
  boolean hab;
  String displayName;
  float distance;
  float xg, yg, zg;
  float mag;
  
  // Constructors dont have a return type.give each field some value.
  // Name of the constructor has to be the same as the class
  // You can have lots of different constructors
  // Java knows which one to use based on the parameters 
  // You pass
  Star(boolean hab, String displayName, float distance, float xg, float yg, float zg, float mag)
  {
    // this refers to the field
    this.hab = hab;//this. is used to differentiate between to variables with the same name
    this.displayName = displayName;
    this.distance = distance;
    this.xg = xg;
    this.yg = yg;
    this.zg = zg;
    this.mag = mag;
    
  }
  
  // This constructor takes a single row from the table
  // and assigns the fields from the columns
  Star(TableRow row)
  {
    displayName = row.getString("Display Name");
    distance = row.getFloat("Distance");
    hab = row.getInt("Hab?") == 1;
    xg = row.getFloat("Xg");
    yg = row.getFloat("Yg");
    zg = row.getFloat("Zg");
    mag = row.getFloat("AbsMag");
    //..
    
  }
  
    Star()
    {
    }
    
}