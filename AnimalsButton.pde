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


