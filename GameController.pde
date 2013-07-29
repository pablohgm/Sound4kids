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
    Scene sceneSix = new Scene("scene5.wav", "error.wav");
    sceneSix.getTypes().add("bull");
    sceneSix.getTypes().add("rooster");
    AnimalButton bullButtonSix = new AnimalButton("bull", "bull.wav", "bull.png", "bull-selected.png", 300, 10, 128, 128);
    AnimalButton duckButtonSix = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 150, 20, 128, 128);
    AnimalButton roosterButtonSix = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 10, 100, 128, 128);
    AnimalButton dogButtonSix = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 10, 250, 128, 128);
    AnimalButton pigButtonSix = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 150, 320, 128, 128);
    AnimalButton cowButtonSix = new AnimalButton("cow", "cow.wav", "cow.png", "cow-selected.png", 300, 340, 128, 128);
    sceneSix.getButtons().add(bullButtonSix);
    sceneSix.getButtons().add(duckButtonSix);
    sceneSix.getButtons().add(roosterButtonSix);
    sceneSix.getButtons().add(dogButtonSix);
    sceneSix.getButtons().add(pigButtonSix);
    sceneSix.getButtons().add(cowButtonSix);
    scenes[5]=sceneSix;
    
    //scene seven
    Scene sceneSeven = new Scene("scene6.wav", "error.wav");
    sceneSeven.getTypes().add("bull");
    sceneSeven.getTypes().add("rain");
    AnimalButton bullButtonSeven = new AnimalButton("bull", "bull.wav", "bull.png", "bull-selected.png", 300, 10, 128, 128);
    AnimalButton duckButtonSeven = new AnimalButton("duck", "duck.wav", "duck.png", "duck-selected.png", 150, 20, 128, 128);
    AnimalButton roosterButtonSeven = new AnimalButton("rooster", "rooster.wav", "rooster.png", "rooster-selected.png", 10, 100, 128, 128);
    AnimalButton dogButtonSeven = new AnimalButton("dog", "dog.wav", "dog.png", "dog-selected.png", 10, 250, 128, 128);
    AnimalButton pigButtonSeven = new AnimalButton("pig", "pig.wav", "pig.png", "pig-selected.png", 150, 320, 128, 128);
    AnimalButton rainButtonSeven = new AnimalButton("rain", "rain.wav", "rain.png", "rain-selected.png", 300, 340, 128, 128);
    sceneSeven.getButtons().add(bullButtonSeven);
    sceneSeven.getButtons().add(duckButtonSeven);
    sceneSeven.getButtons().add(roosterButtonSeven);
    sceneSeven.getButtons().add(dogButtonSeven);
    sceneSeven.getButtons().add(pigButtonSeven);
    sceneSeven.getButtons().add(rainButtonSeven);
    scenes[6]=sceneSeven;
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
