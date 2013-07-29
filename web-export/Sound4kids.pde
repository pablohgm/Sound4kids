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
    level=5;
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
class AnimalButton extends Toggle{
    
   PImage buttonInactive;// = loadImage("pig.png");
   PImage buttonActive;// = loadImage("pig-selected.png");
   Maxim maxi;
   AudioPlayer player;
  
   AnimalButton(String argName, String argSound, String argActive, String argInactive, int argPosX, int argPosY, int argWidth, int argHeight){
     super(argName, argPosX, argPosY, argWidth, argHeight);
     maxi = new Maxim(this);
     player = maxi.loadFile(argSound);
     buttonInactive = loadImage(argActive);
     buttonActive = loadImage(argInactive);
     super.setInactiveImage(buttonInactive);
     super.setActiveImage(buttonActive);  
   }
   
   void playSound(){
     player.cue(0);
     player.play();
   }
}



int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      //println(mouseX + " " + mouseY);
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(color c)
  {
    imageTint = c;
  }

  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      //tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      //noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textWidth, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textWidth, extents.x, extents.y-textWidth);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textWidth-4); 
        rect(pos.x+textWidth+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2 + (extents.y-textWidth-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;

  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}

class GameController{
  
  Scene[] scenes;
  boolean levelCompleted;
  
  GameController(){
    scenes = new Scene[6];
  }
  
  void createScenes(){
    //scene one
    Scene sceneOne = new Scene("scene1.wav", "error.wav");
    sceneOne.getTypes().add("pig");
    AnimalButton pigButton = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 100, 10, 128, 128);
    AnimalButton cowButton = new AnimalButton("cow", "cow.wav", "cow.png", "cow-selected.png", 250, 10, 128, 128);
    sceneOne.getButtons().add(pigButton);
    sceneOne.getButtons().add(cowButton);
    scenes[0]=sceneOne;
    
    //scene two
    Scene sceneTwo = new Scene("scene2.wav", "error.wav");
    sceneTwo.getTypes().add("cow");
    sceneTwo.getTypes().add("pig");
    AnimalButton cowButtonTwo = new AnimalButton("cow", "cow.wav", "cow.png", "cow-selected.png", 150, 20, 128, 128);
    AnimalButton pigButtonTwo = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 50, 160, 128, 128);
    AnimalButton roosterButtonTwo = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 150, 300, 128, 128);
    sceneTwo.getButtons().add(cowButtonTwo);
    sceneTwo.getButtons().add(pigButtonTwo);
    sceneTwo.getButtons().add(roosterButtonTwo);
    scenes[1]=sceneTwo;
    
    //scene three
    Scene sceneThree = new Scene("scene3.wav", "error.wav");
    sceneThree.getTypes().add("dog");
    sceneThree.getTypes().add("rooster");
    AnimalButton duckButtonThree = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 150, 20, 128, 128);
    AnimalButton dogButtonThree = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 50, 160, 128, 128);
    AnimalButton roosterButtonThree = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 150, 300, 128, 128);
    sceneThree.getButtons().add(dogButtonThree);
    sceneThree.getButtons().add(duckButtonThree);
    sceneThree.getButtons().add(roosterButtonThree);
    scenes[2]=sceneThree;
    
    //scene four
    Scene sceneFour = new Scene("scene4.wav", "error.wav");
    sceneFour.getTypes().add("duck");
    sceneFour.getTypes().add("dog");
    sceneFour.getTypes().add("cow");
    AnimalButton duckButtonFour = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 250, 10, 128, 128);
    AnimalButton roosterButtonFour = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 110, 50, 128, 128);
    AnimalButton dogButtonFour = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 10, 180, 128, 128);
    AnimalButton pigButtonFour = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 110, 300, 128, 128);
    AnimalButton cowButtonFour = new AnimalButton("cow", "cow.wav", "cow.png", "cow-selected.png", 260, 340, 128, 128);
    sceneFour.getButtons().add(duckButtonFour);
    sceneFour.getButtons().add(roosterButtonFour);
    sceneFour.getButtons().add(dogButtonFour);
    sceneFour.getButtons().add(pigButtonFour);
    sceneFour.getButtons().add(cowButtonFour);
    scenes[3]=sceneFour;
    
    //scene five
    Scene sceneFive = new Scene("scene5.wav", "error.wav");
    sceneFive.getTypes().add("rooster");
    sceneFive.getTypes().add("bull");
    AnimalButton bullButtonFive = new AnimalButton("bull", "bull.wav", "bull.png", "bull-selected.png", 300, 10, 128, 128);
    AnimalButton duckButtonFive = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 150, 20, 128, 128);
    AnimalButton roosterButtonFive = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 10, 100, 128, 128);
    AnimalButton dogButtonFive = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 10, 250, 128, 128);
    AnimalButton pigButtonFive = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 150, 320, 128, 128);
    AnimalButton cowButtonFive = new AnimalButton("cow", "cow.wav", "cow.png", "cow-selected.png", 300, 340, 128, 128);
    sceneFive.getButtons().add(bullButtonFive);
    sceneFive.getButtons().add(duckButtonFive);
    sceneFive.getButtons().add(roosterButtonFive);
    sceneFive.getButtons().add(dogButtonFive);
    sceneFive.getButtons().add(pigButtonFive);
    sceneFive.getButtons().add(cowButtonFive);
    scenes[4]=sceneFive;
    
    //scene six
    Scene sceneSix = new Scene("scene6.wav", "error.wav");
    sceneSix.getTypes().add("bull");
    sceneSix.getTypes().add("rain");
    AnimalButton bullButtonSix = new AnimalButton("bull", "bull.wav", "bull.png", "bull-selected.png", 300, 10, 128, 128);
    AnimalButton duckButtonSix = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 150, 20, 128, 128);
    AnimalButton roosterButtonSix = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 10, 100, 128, 128);
    AnimalButton dogButtonSix = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 10, 250, 128, 128);
    AnimalButton pigButtonSix = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 150, 320, 128, 128);
    AnimalButton rainButtonSix = new AnimalButton("rain", "rain.wav", "rain.png", "rain-selected.png", 300, 340, 128, 128);
    sceneSix.getButtons().add(bullButtonSix);
    sceneSix.getButtons().add(duckButtonSix);
    sceneSix.getButtons().add(roosterButtonSix);
    sceneSix.getButtons().add(dogButtonSix);
    sceneSix.getButtons().add(pigButtonSix);
    sceneSix.getButtons().add(rainButtonSix);
    scenes[5]=sceneSix;
  }

  void displayScene(int argLevel){
      ArrayList<Toggle> tmpButtons = scenes[argLevel].getButtons();
      for(int i=0; i < tmpButtons.size(); i++){
        if(tmpButtons.get(i) != null){
          tmpButtons.get(i).display();
        }
      }
  }
  
  void mousePressedScene(int argLevel){
    if(argLevel<0){
      return;
    }
    ArrayList<Toggle> tmpButtons = scenes[argLevel].getButtons();
    for(int i=0; i < tmpButtons.size(); i++){
     if(tmpButtons.get(i).mousePressed()){
       if(!validatePressButton(tmpButtons.get(i), argLevel)){
         scenes[argLevel].playError();
         tmpButtons.get(i).set(true);
         return;
       }
       tmpButtons.get(i).playSound();
     }
    }
  }
  
  void mouseReleasedScene(int argLevel){
    if(argLevel<0){
      return;
    }
     ArrayList<Toggle> tmpButtons = scenes[argLevel].getButtons();
      for(int i=0; i < tmpButtons.size(); i++){
        tmpButtons.get(i).mouseReleased();
        setLevelCompleted(validateLevelCompleted(argLevel));
      }
  }
  
  boolean validateLevelCompleted(int argLevel){
     if(getCounterButtonsSelected(argLevel) == scenes[argLevel].getTypes().size()){
       return true;
     }
     return false;
  }
  
  boolean validatePressButton(Toggle argButton, int argLevel){
    if(argLevel<0){
      return;
    }
    ArrayList<String> tmpTypes = scenes[argLevel].getTypes();
    for(int i=0; i<tmpTypes.size(); i++){
      if(tmpTypes.get(i).equals(argButton.getName())){
        return true;
      }
    }
    return false;
  }
  
  boolean isLevelCompleted(){
    return levelCompleted;
  }
  
  void setLevelCompleted(boolean argLevelCompleted){
    levelCompleted = argLevelCompleted;
  }
  
  int getCounterButtonsSelected(int argLevel){
     ArrayList<Toggle> tmpButtons = scenes[argLevel].getButtons();
     int counter = 0;
     for(int i=0; i < tmpButtons.size(); i++){
       if(tmpButtons.get(i).get()){
         counter++;
       }
     }
     return counter;
  }
  
  void startLevel(int argLevel){
    setLevelCompleted(false);
    scenes[argLevel].playScene();
  }
}
class Scene{
   Maxim maxi;
   AudioPlayer player;
   AudioPlayer errorPlayer;
   ArrayList <Toggle> buttons = new ArrayList <Toggle>();
   ArrayList <String> types = new ArrayList <String>(); 
   
   Scene(String argSound, String argErrorSound){
     maxi = new Maxim(this);
     player = maxi.loadFile(argSound);
     errorPlayer = maxi.loadFile(argErrorSound);
   }
   
   ArrayList<Toggle> getButtons(){
     return buttons;
   }
   
   ArrayList <String> getTypes(){
     return types;
   }
   
   void playScene(){
     player.cue(0);
     player.play();
   }
   
   void playError(){
     errorPlayer.cue(0);
     errorPlayer.play();
   }
}

