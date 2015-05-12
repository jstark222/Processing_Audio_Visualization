import ddf.minim.analysis.*;    //Provides FFT

BeatDetect beat;
BeatListener beatListener;

int kickCounter = 0;
int hatCounter = 0;
int snareCounter = 0;
boolean blackwhiteSwitch = true;
float addme = 0;
boolean mRelease = false;
boolean explotion = false;
boolean create_explotion = false;
boolean star_create = false;
ArrayList<Ball> b = new ArrayList<Ball>();
ArrayList<Integer> b3 = new ArrayList<Integer>();
boolean starActive = false;//Set true to see star 
int bSensitive = 50;
int backgroundEffect = 0;



void beatInitializer(){
   beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(bSensitive);
  beatListener = new BeatListener(beat, player);
   
  initSongSelected = true;
}



void mainDisplayInit() {  
  //loadSong();
  RainbowInit();
  ballinit();
  starInit();
 
  DiscoInit();
 
}


void mainDisplayDraw() {
  if (initSongSelected) {
    beat.detect(player.mix);
    triggers();
  }
  mRelease = false;
  beat.setSensitivity(bSensitive);
  slider1.setValue(map(player.position(), 0, player.length(), 0, 1.0));
  
  switch(backgroundEffect)
  {
     
   case 0://Default black
      BlackBackground();
      break;
    case 1://No Background
      if (showOptions) { drawRectangle(); }
      break;
    case 2://White Background
      WhiteBackground();
      break;
    case 3://Strobe
      BackgroundStrobe();
      break;
    case 4://Disco Background
      BackgroundDiscoDraw();
      DiscoDraw();
      break;
     
  }

  
  if(checkbox10.isSelected())//Rainbow Checked
  {
    
      drawRainbow();
    
  }
  
  if(checkbox7.isSelected())//ball draw checked
  {
    
     balldraw(); 
    
  }
  
  if(checkbox8.isSelected())//Explosion draw
  {
    
     drawExplosion(); 
    
  }
  
  if(checkbox9.isSelected())//Draw Ribbon
  {
     drawRibbon(); 
    
  }
  

 //drawRectangle();

}


void triggers() {
  
  if (beat.isKick()) { kickCounter++; ballsetspeed(); } //Call function
  if (beat.isHat()) { hatCounter++; 
      
//      if(starActive)
//        setStar();
  
  } 
  if (beat.isSnare()) { 
    snareCounter++; 
    create_explotion = true;
    if(strobe_enable == true){
      if (snareCounter % 2 == 0) {
         if(blackwhiteSwitch){blackwhiteSwitch = false;}
        else{blackwhiteSwitch = true;}
      
      } //Call function
    }
  }
  if (kickCounter % 5 == 0) {
      
      
  } //Call function
  if (hatCounter % 5 == 0) {
    
    } //Call function

 
}






class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}
