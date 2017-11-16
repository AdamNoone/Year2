class 
{
  String name;
  String party;
  String constituency;
  float amount_returned;
  float amount_claimed;
  
  //constructors don't have a return type
  //name of constructor has to be name of the class
  //lots of different constructors
  
  Expense(TableRow row)
  {
    name = row.getString("name");
    party = row.getString("party");
    constituency = row.getString("constituency");
    amount_returned = row.getFloat("amount_returned");
    amount_claimed = row.getFloat("amount_claimed");
    println(name 
    + ", " + party + ", " 
    + "(" + constituency + " ," + amount_returned + " ," + amount_claimed + ")");
  }
  
  
   String toString()
  {
    return name
    return party
    return constituency
      
      + "," + amount_returned;
      + "," + amount_claimed;
      ;
  }
  
}
}