void setup()
{
  size(500, 500);
  loadData();
  listData();
}

void loadData()
{
  Table table = loadTable("HabHYG15ly.csv", "header");//creates a table object
  for(TableRow row:table.rows())
  {
    Star star = new Star(row);    
    stars.add(star);//stars is each element from the arrray list,this line basically adds each new star to the list 
  }
}

void listData()
{
  for(Star star:stars)//for each in the array list stars
  {
    println(star);//print info
  }
}

void drawGrid()
{
  fill(255, 0, 255);
  stroke(255, 0, 255);
  textAlign(CENTER, CENTER);
  for(float x = -5 ; x <=5; x ++)
  {
    float lx = map(x, -5, 5, border, width - border);
    line(lx, border, lx, height - border);
    text((int) x, lx, 10);
  }
  
  for(float y = -5 ; y <=5; y ++)
  {
    float ly = map(y, -5, 5, border, height - border);
    line(border, ly, width - border, ly);
    text((int) y, 10, ly);
  }
}

void drawStars()
{
  noFill();
  for(Star star:stars)//for every star in the array list 
  {
    float x = star.screenPos.x;
    float y = star.screenPos.y;  
    stroke(255, 255, 0);
    line(x-2, y, x+2, y);
    line(x, y - 2, x, y + 2);    
    stroke(255, 0, 0);  
    noFill();
    ellipse(x, y, star.magnitude, star.magnitude);
    
    textAlign(LEFT, CENTER);
    fill(255);
    text(star.displayName, x + 10, y - 2);//displays the name of the star
    
  }  
}

float border = 50; 
ArrayList<Star> stars = new ArrayList<Star>(); //declaring the array list stars :)


//variables controllig stars selected
int selected1 = -1;
int selected2 = -1;

void mousePressed()
{
  for(int i = 0 ; i < stars.size() ; i ++)
  {
    Star star = stars.get(i);
    
    if (dist(mouseX, mouseY, star.screenPos.x, star.screenPos.y) < star.magnitude / 2)//check if mouse pressed inside circle
    {
      if (selected1 == -1)
      {
        selected1 = i;
      }
      else if (selected2 == -1)
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
  drawGrid();
  drawStars();
  
  // If I have selected one of the stars
  if (selected1 != -1 && selected2 == -1)
  {
    Star star1 = stars.get(selected1);
    stroke(255, 255, 0);
    line(star1.screenPos.x, star1.screenPos.y, mouseX, mouseY);
  }
   // If I have selected both of the stars
  else if (selected1 != -1 && selected2 != -1)
  {
    Star star1 = stars.get(selected1);
    Star star2 = stars.get(selected2);
    stroke(255, 255, 0);
    line(star1.screenPos.x, star1.screenPos.y, star2.screenPos.x, star2.screenPos.y);    
    fill(255);
    float dist = dist(star1.pos.x, star1.pos.y, star1.pos.z, star2.pos.x, star2.pos.y, star2.pos.z);
    text("Distance from " + star1.displayName + " to " + star2.displayName + " is " + dist + " parsecs", border, height - 25);
  }
  
  
  
  
}