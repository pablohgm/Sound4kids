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
