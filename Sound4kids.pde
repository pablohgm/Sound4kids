/***Final Project*/

PigButton pigButton;
CowButton cowButton;

/*GameController controller;

int level;*/

void setup()
{
   size(640, 480);
   //level = 0;
   pigButton = new PigButton(100, 10, 128, 128);
   cowButton = new CowButton(250, 10, 128, 128);
   //controller = new GameController();
   //controller.createScenes();
}

void draw()
{  
  //controller.displayScene(level);
   pigButton.display();
   cowButton.display();
}

void mousePressed()
{
  /*if(pigButton.mousePressed())
  {
    pigButton.playSound();
  }
  if(cowButton.mousePressed())
  {
    cowButton.playSound();
  } */ 
}

void mouseReleased()
{
  /*pigButton.mouseReleased();
  cowButton.mouseReleased();*/
}
