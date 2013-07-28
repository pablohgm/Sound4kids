class PigButton extends Toggle{
    
   PImage ButtonInactive = loadImage("pig.png");
   PImage ButtonActive = loadImage("pig-selected.png");
   Maxim maxi;
   AudioPlayer player;
   String type = "pig";
  
   
   PigButton(int argPosX, int argPosY, int argWidth, int argHeight){
     super("", argPosX, argPosY, argWidth, argHeight);
     maxi = new Maxim(this);
     player = maxi.loadFile("pig.wav");
     super.setInactiveImage(ButtonInactive);
     super.setActiveImage(ButtonActive);  
   }
   
   void playSound(){
     player.cue(0);
     player.play();
   }
}

class CowButton extends Toggle{
    
   PImage ButtonInactive = loadImage("cow.png");
   PImage ButtonActive = loadImage("cow-selected.png");
   Maxim maxi;
   AudioPlayer player;
    String type = "cow";
   
   CowButton(int argPosX, int argPosY, int argWidth, int argHeight){
     super("", argPosX, argPosY, argWidth, argHeight);
     maxi = new Maxim(this);
     player = maxi.loadFile("cow.wav");
     super.setInactiveImage(ButtonInactive);
     super.setActiveImage(ButtonActive);  
   }
   
   void playSound(){
     player.cue(0);
     player.play();
   }
}





