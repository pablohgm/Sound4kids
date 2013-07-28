class GameController{
  
  Scene[] scenes;
  
  boolean levelCompleted;
  
  GameController(){
    scenes = new Scene[4];
  }
  
  void createScenes(){
    Scene sceneOne = new Scene("scene1.wav");
    sceneOne.getTypes().add("pig");
    PigButton pigButton = new PigButton(100, 10, 128, 128);
    CowButton cowButton = new CowButton(250, 10, 128, 128);
    sceneOne.getButtons().add(pigButton);
    sceneOne.getButtons().add(cowButton);
    scenes[0]=sceneOne;
    
    //scene two
    Scene sceneTwo = new Scene("scene1.wav");
    sceneTwo.getTypes().add("cow");
    CowButton cowButtonTwo = new CowButton(250, 10, 128, 128);
    sceneTwo.getButtons().add(cowButtonTwo);
    scenes[1]=sceneTwo;
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
     println("counter -> "+counter);
     return counter;
  }
  
  void startLevel(int argLevel){
    setLevelCompleted(false);
    scenes[argLevel].playScene();
  }
}
