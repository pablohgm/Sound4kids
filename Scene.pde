class Scene{
   Maxim maxi;
   AudioPlayer player;
   ArrayList <Toggle> buttons = new ArrayList <Toggle>();
   ArrayList <String> types = new ArrayList <String>(); 
   
   Scene(String argSound){
     maxi = new Maxim(this);
     player = maxi.loadFile(argSound);  
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
}
