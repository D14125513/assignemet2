/*
Sultan Alotaibi
D14125513
DT2282
*/


import ddf.minim.*;
//minim imports above

PImage img;
PImage mainImg;

PFont newFont;

Ball myBall;

float ScreenWidth,ScreenHeight; 
int X , Y;
int  weight , heigh;
int speedX , speedY;
int stepX , stepY;
int stepW , stepH , stepS;
int stepXR, stepYR;
int stepXL , stepYL;
String ScoreLeftx="Sultan";
int ScoreLeft = 0; 
String ScoreRightx= "Mark";
int ScoreRight = 0;
int endScore = 5;

PVector location;
PVector velocity;

boolean goUpL, goDownL;
boolean goUpR, goDownR;

Minim minim;//audio context
AudioPlayer player;
AudioPlayer gameover;
AudioPlayer missball;

//String welcome = "Welcome to The game";
//String start = "Press The space to Start";


void setup() 
{
  img = loadImage("pitch.jpg");
  // mainImg = loadImage("images//start_back_ground.png");
   
  //new code
  minim = new Minim(this);
  player = minim.loadFile("hit.wav");
  gameover = minim.loadFile("finish.wav");//paste gameover sound here
  missball = minim.loadFile("missball.wav");
  
    newFont = loadFont("CooperBlack-48.vlw"); 

   size(500, 500);
 
   myBall = new Ball();
 
   location = new PVector(100,100);
   velocity = new PVector(2.5,5);
  
   X = width/2;
   Y = height/2;
  
   ScreenWidth  = width;
   ScreenHeight = height;
 
   rectMode(CENTER);
   stepX = 10;
   stepY = height/2;

   stepXR = width - 10;
   stepYR = height/2;

   stepW = 10;
   stepH = 100;
   stepS = 5;
  
   textSize(20);
   textAlign(CENTER, CENTER);
  
}

// method to setup the home page
//void firstgame()
//{
//  background(mainImg);
//  textFont(newFont, 25);
//  fill(255);
//  text(welcome, 10, 200); 
//  fill(255);
//  text(start, 10, 260);
//}


void draw() 
{
   
 // background(mainImg);
   myBall.display();
  
   image(img,0,0,ScreenWidth,ScreenHeight);

   location.add(velocity);

if ((location.x > width) || (location.x < 0)) 
{
    velocity.x = velocity.x * -1;
    
  }
  
if ((location.y > height) || (location.y < 0))
{
    
    velocity.y = velocity.y * -1;
}
  
 // firstgame();
  
  drawcricle();
  movecricle();
  actionOff();

  drawstep();
  movestep();
  recordstep();
  contactstep();
  
  scores();
  GameOver();
  
}

void drawstep() 
{
  
  rect(stepX, stepY, stepW, stepH);

  rect(stepXR, stepYR, stepW, stepH);

}

void movestep()
{
  if ( goUpL )
  {
    
    stepY = stepY - stepS;
    
  }
  if ( goDownL ) 
  {
    
    stepY = stepY + stepS;
    
  }
  if ( goUpR )
  {
    
    stepYR = stepYR - stepS;
    
  }
  if ( goDownR )
  {
    
    stepYR = stepYR + stepS;
    
  }
}

void recordstep()
{
  if (stepY - stepH/2 < 0)
  {

    stepY = stepY + stepS;
    
  }
  if (stepY + stepH/2 > height) 
  {

    stepY = stepY - stepS;
    
  }
  if (stepYR - stepH/2 < 0)
  {

    stepYR = stepYR + stepS;
    
  }
  if (stepYR + stepH/2 > height)
  {

    stepYR = stepYR - stepS;
    
  }
  
}

void contactstep()
{
  
  if (X - weight/2 < stepX + stepW/2 && Y - heigh/2 < stepY + stepH/2 && Y + heigh/2 > stepY - stepH/2 )
  {
    player.play();
    if (speedX < 0)
    {
      player.play();
      speedX = -speedX;
      
    }
  }
  
  else if (X + weight/2 > stepXR - stepW/2 && Y - heigh/2 < stepYR + stepH/2 && Y + heigh/2 > stepYR - stepH/2 ) 
  {
    if (speedX > 0)
    {
      player.play();
      speedX = -speedX;
      
    }
  }
}

void  actionOff()
{
  if ( X > width - weight/2)
  {
    
    setup();
    speedX = - speedX;
    ScoreLeft = ScoreLeft + 1;
    missball.play();
  } 
  else if ( X < 0 + weight/2)
  {
    
    setup();
    ScoreRight = ScoreRight + 1;
    missball.play();
  }

  if ( Y > height - heigh/2) 
  {
   missball.play();
    speedY = - speedY;
    
  } 
  else if ( Y < 0 + heigh/1) 
  {
    missball.play();
    speedY = - speedY;
    
  }
}

void scores() 
{
 
  fill(255);
  text(ScoreLeftx, 100 ,30);
  text(ScoreLeft , 100 , 50);
  text(ScoreRightx, 400, 30);
  text(ScoreRight , width-100 , 50);
  
}

void GameOver() 
{
  if(ScoreLeft == endScore) 
  {
    GameOver("Sultan wins.");
    
  }
  if(ScoreRight == endScore)
  {
    GameOver("Mark wins."); 
    
  }
}

void GameOver(String text) 
{
  speedX = 100;
  speedY = 100;
  
  gameover.play();
  setup();
  text("To play again click th mouse", width/2 , height/2 + 20);
  text(text, width/2 , height/3);
  
  if(mousePressed) 
  {
    setup();
    ScoreRight = 0;
    ScoreLeft = 0;
    speedX = 4;
    speedY = 4;
    
  }  
}