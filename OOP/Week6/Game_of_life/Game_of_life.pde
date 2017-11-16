//rules
/*                     IF THE CELL IS ALIVE
1. if there are less than 2 lives cells around cell ,the cell dies 
2.if more than 3 cells around the cell it dies 
3. if there are 2 or 3 cells around the cell,then it survives


            IF THE CELL IS DEAD
            
  1. if cell has 3 around it then it comes alive 



-------------------------------------------------------------------------------------------------------
you have to keep 2 board - current board and next board


-------------------------------------------------------------------------------------------------------

*/

void setup ()
{
  size (500,500);
  board = new Board(100);
}

Board board ;
void draw()
{
  background(0);
  board.render();
  
  board.update();
}