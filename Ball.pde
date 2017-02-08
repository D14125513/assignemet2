class Ball
{
  int X = 0;
  int Y = 0;
  
  Ball()
  {
    
  weight = 20;
  heigh  = 20;
  
  speedX = 3;
  speedY = 3;
  
  }

 void display(){
   
 // ellipse(200,200,20,20);
   
 }
    
  }
  
void drawcricle() 
{

  ellipse(X, Y, weight, heigh);
  
}

void movecricle()
{
  
  X = X + speedX;
  Y = Y + speedY;
  
}

void keyPressed()
{
  if (key == 'w' || key == 'W') 
  {

     goUpL = true;
     
  }
  if (key == 's' || key == 'S')
  {
    
    goDownL = true;
    
  }
  if (keyCode == UP)
  {
    
    goUpR = true;
    
  }
  if (keyCode == DOWN)
  {
    
    goDownR = true;
    
  }
}

void keyReleased()
{
  if (key == 'w' || key == 'W')
  {
    
    goUpL = false;
    
  }
  if (key == 's' || key == 'S')
  {
    
    goDownL = false;
    
  }
  if (keyCode == UP)
  {
    
    goUpR = false;
    
  }
  if (keyCode == DOWN)
  {
    
    goDownR = false; 
    
  }
}
  
  
  