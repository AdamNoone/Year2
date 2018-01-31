class Star
{
  String displayName;
  float distance;
  float magnitude;
  boolean habitable;
  PVector pos;
  PVector screenPos;
  
  Star(TableRow row)
  {
    displayName = row.getString("Display Name");
    distance = row.getFloat("Distance");
    magnitude = row.getFloat("AbsMag");
    habitable = (row.getInt("Hab?") == 1);
    pos = new PVector(
      row.getFloat("Xg")
      ,row.getFloat("Yg") 
      ,row.getFloat("Zg")
      );
   screenPos = new PVector(
    map(pos.x, -5, 5, border, width - border)
    , map(pos.y, -5, 5, border, height - border)
    );
  }
  
  String toString()
  {
    return displayName
      + "," + distance
      + "," + magnitude
      + "," + habitable
      + "," + pos
      ;
  }
  
}