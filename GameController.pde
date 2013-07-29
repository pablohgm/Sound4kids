class GameController{
  
  Scene[] scenes;
  boolean levelCompleted;
  
  GameController(){
    scenes = new Scene[4];
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
    AnimalButton duckButtonThree = new AnimalButton("duck", "duck.wav", "duck.png", "dcuk-selected.png", 150, 20, 128, 128);
    AnimalButton dogButtonThree = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 50, 160, 128, 128);
    AnimalButton roosterButtonThree = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 150, 300, 128, 128);
    sceneThree.getButtons().add(dogButtonThree);
    sceneThree.getButtons().add(duckButtonThree);
    sceneThree.getButtons().add(roosterButtonThree);
    scenes[2]=sceneThree;
    
    //scene four
    Scene sceneFour = new Scene("scene4.wav", "error.wav");
    sceneFour.getTypes().add("dog");
    AnimalButton dogButtonFour = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 250, 10, 128, 128);
    sceneFour.getButtons().add(dogButtonFour);
    scenes[3]=sceneFour;
    
    //scene five
    Scene sceneFive = new Scene("scene4.wav", "error.wav");
    sceneFive.getTypes().add("duck");
    AnimalButton duckButtonFive = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 250, 10, 128, 128);
    sceneFive.getButtons().add(duckButtonFive);
    scenes[4]=sceneFive;
    
    //scene six
    Scene sceneSix = new Scene("scene5.wav", "error.wav");
    sceneSix.getTypes().add("bull");
    AnimalButton bullButtonSix = new AnimalButton("bull", "bull.wav", "bull.png", "bull-selected.png", 250, 10, 128, 128);
    sceneSix.getButtons().add(bullButtonSix);
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
    debugger;
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
