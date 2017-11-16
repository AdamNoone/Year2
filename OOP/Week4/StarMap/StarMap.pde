void setup()
{
  size(700, 700);
  
  loadData();
  
 // Star s = new Star();         //similar to malloc in c  -------------made it a global variable becuase program would not work
  
  
 //How to create a single star
         s.displayName = "Sun";
          println(s.displayName);
         
          Star s1 = new Star();
          s1.displayName = "Bob";
          println(s1.displayName);
          
          s1 = s;
          s.displayName = "Tom";
          println(s1.displayName);
          
          
          
          
          
          
          
          
          
          
}
Star s = new Star();


void loadData()
{
  // Check out 
  // https://processing.org/reference/loadTable_.html
  // Make sure the file is in the data folder of the sketch
  Table table = loadTable("HabHYG15ly.csv", "header");
  
  // Table.rows() returns all the table rows
  // We can iterate over all the rows using a for each loop
  for(TableRow r:table.rows())
  {
    // Create a new star object from each of the rows
    // By passing the TableRow into the Star constructor
    Star star = new Star(r);///make star from row
    // Add the new Star object to the stars ArrayList
    stars.add(star);
  }
  
  // Iterate over the stars ArrayList
  for(Star s:stars)//using a for each loop 
  {
    println(s.displayName);
  }
  
  // Iterate over the stars arraylist using a standard for loop
  // stars.size() returns the number of elements in the ArrayList
  for(int i = 0 ; i < stars.size() ; i ++)
  {
    Star s = stars.get(i);
    println(s.displayName);
  }
}

// An ArrayList is similar to an array, but it can grow and shrink in size
// as you add and remove elements
// The <Star> means the ArrayList is for holding objects of type Star
ArrayList<Star> stars = new ArrayList<Star>(); //same as an array but can start at zero and insert/take data from any [n] .........(dynamic)


void drawStars()
{
  float border = width * 0.1f;
  for(Star s:stars )
  {
     float x = map(s.xg,-5,5,border,width-border); 
     float y = map(s.yg,-5,5,border,width-border); 
     
     stroke(255);
     
     line(x-2,y,x+2,y);
     line(x,y-2,x,y+2);
     
     stroke(255,0,0);
     noFill();
     ellipse(x,y,s.mag,s.mag);
     textAlign(LEFT,CENTER);
     fill(255);
     text(s.displayName,x+10,y-2);
     
  }
}

void drawGrid()
{
  
  /*
  // A solution that doesnt use map
  float border = width * 0.1f;
  float drawable = width * 0.8f;
  float gap = drawable / 10.0f;
  textAlign(CENTER, CENTER);
  fill(0);
  float pos = border;
  for(int xg = -5 ; xg <= 5 ; xg ++)
  {
    text(xg, pos, border * 0.5);
    text(xg, border * 0.5, pos);
    
    line(pos, border, pos, height - border);
    line(border, pos, width - border, pos);   
    pos += gap;
  }
  */
  
  
  // A better solution that uses map!
  // https://processing.org/reference/map_.html
  float border = width * 0.1f;
  textAlign(CENTER, CENTER);
  for(int xg = -5 ; xg <= 5 ; xg ++)
  {
    float pos = map(xg, -5, 5, border, width - border); 
    text(xg, pos, border * 0.5);
    text(xg, border * 0.5, pos);
    
    line(pos, border, pos, height - border);
    line(border, pos, width - border, pos);   
  }  
}

float border = 50;
int selected1 = -1;
int selected2 = -1;

void mousePressed()
{
    float border = width * 0.1f;
  for(int i =0;i <stars.size();i++ )
  {
     float x = map(s.xg,-5,5,border,width-border); 
     float y = map(s.yg,-5,5,border,width-border); 
     
       float dist = dist(mouseX,mouseY,x,y);
       if (dist < s.mag/2)
       {
         if (selected1 ==-1)
         {
           selected1 = i;
         }
         else if (selected2 ==-1)
         {
             selected2 = i;
         }
         else
         {
            selected1 = i;
            selected2 = -1;
         }
       }
     
     
  }
}

  


void draw()
{
  background(0);
  stroke(0, 255, 0);
  fill(255);
  drawGrid();
  drawStars();
  float border = width * 0.1f;
     float x = map(s.xg,-5,5,border,width-border); 
     float y = map(s.yg,-5,5,border,width-border); 
     stroke(255);
  
  
  //if I have selected one of the stars
  if (selected1 != -1 && selected2 ==-1)
  {
    Star s = stars.get(selected1);
    Star s2 = stars.get(selected2);
     
     
     stroke(255);
     line(X,Y,mouseX,mouseY);
  }
  else if (selected1 != -1 && selected2 != -1)
  {
        Star s = stars.get(selected1);
        Star s2 = stars.get(selected2);
        
        stroke(255, 255, 0);
   line(X,Y,mouseX,mouseY);
    fill(255);
     float dist = dist(mouseX,mouseY,x,y);
    text("Distance from " + s.displayName + " to " + s2.displayName + " is " + dist + " parsecs", border, height - 25);
    
  } 
  
}