/***Final Project*/

PImage backgroundImage;
Maxim maxi;
AudioPlayer playerEnviroment;

Button next;
Button startButton;
Button gameOverButton;

GameController controller;

boolean gameOver;
boolean start;
int level;

void setup()
{
   size(640, 480);
   level = -1;
   backgroundImage = loadImage("background.jpg");
   
   maxi = new Maxim(this);
   playerEnviroment = maxi.loadFile("enviroment.wav");
   playerEnviroment.setLooping(true);
   
   PImage nextActive = loadImage("next.png");
   next = new Button("next", 500, 110, 128,128);
   next.setActiveImage(nextActive);
   
   PImage startActive = loadImage("start.png");
   startButton = new Button("start", 270, 180, 128,128);
   startButton.setActiveImage(startActive);
   start=false;
   
   PImage gameOverActive = loadImage("game-over.png");
   gameOverButton = new Button("gameOver", 50, 300, 89,128);
   gameOverButton.setActiveImage(gameOverActive);
   gameOver=false;
   
   controller = new GameController();
   controller.createScenes();
}

void draw()
{  
  background(backgroundImage);
  if(gameOver){
    gameOverButton.display();
    return;
  }
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
    if(level>5){
      gameOver=true;
      level=-1;
      playerEnviroment.stop();
    }
    controller.startLevel(level);
  }
  if(startButton.mousePressed()){
    start=true;
    level=0;
    controller.startLevel(level);
    playerEnviroment.play();
  }
  if(gameOverButton.mousePressed()){
    debugger;
    start=false;
    gameOver=false;
  }
}

void mouseReleased()
{
  controller.mouseReleasedScene(level);
}
