/***Final Project*/

/*PigButton pigButton;
CowButton cowButton;*/

PImage backgroundImage;

Button next;
Button startButton;

GameController controller;

boolean start;
int level;

void setup()
{
   size(640, 480);
   level = -1;
   backgroundImage = loadImage("background.jpg");
   
   PImage nextActive = loadImage("next.png");
   next = new Button("next", 500, 110, 128,128);
   next.setActiveImage(nextActive);
   
   PImage startActive = loadImage("start.png");
   startButton = new Button("start", 270, 180, 128,128);
   startButton.setActiveImage(startActive);
   start=false;
   
   controller = new GameController();
   controller.createScenes();
}

void draw()
{  
  background(backgroundImage);
  if(!start){
    startButton.display();
    return;
  }
  controller.displayScene(level);
  if(controller.isLevelCompleted()){
     next.display();
  }
}

void mousePressed()
{
  controller.mousePressedScene(level);
  if(next.mousePressed()){
    level+=1;
    controller.startLevel(level);
  }
  if(startButton.mousePressed()){
    start=true;
    level=0;
    controller.startLevel(level);
  }
}

void mouseReleased()
{
  controller.mouseReleasedScene(level);
}
