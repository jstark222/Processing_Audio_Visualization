import ddf.minim.analysis.*;    //Provides FFT

BeatDetect beat;
BeatListener beatListener;

int kickCounter = 0;
int hatCounter = 0;
int snareCounter = 0;
boolean blackwhiteSwitch = true;
float addme = 0;
boolean mRelease = false;



void mainDisplayInit() {  
  //loadSong();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(50);
  beatListener = new BeatListener(beat, player);
  ballinit();
  DiscoInit();
  
  initSongSelected = true;
}


void mainDisplayDraw() {
  if (initSongSelected) {
    beat.detect(player.mix);
    triggers();
  }
  mRelease = false;
  
  slider1.setValue(map(player.position(), 0, player.length(), 0, 1.0));
 

  
  switch(effect)//Switch for choosing what effects to draw USE EVERY PERMUTATION
  {
    case 0:
      //BackgroundDiscoDraw();
      BackgroundStrobe();
      balldraw();
      break;
    case 1:
       rect(0,0,w,h);
       balldraw();
      break;
    case 2:
      BackgroundDiscoDraw();
      balldraw();
      DiscoDraw();
      break;
    case 3:
     
      BackgroundDiscoDraw();
      balldraw();
     
      break;
    case 4:
    
      break;
    case 5:
    
    
      break;
    case 6:
    
      break;
  } 
 

}


void triggers() {
  
  if (beat.isKick()) { kickCounter++; ballsetspeed(); } //Call function
  if (beat.isHat()) { hatCounter++; 
      
  
  } 
  if (beat.isSnare()) { 
    snareCounter++; 
      if (snareCounter % 2 == 0) {
         if(blackwhiteSwitch){blackwhiteSwitch = false;}
        else{blackwhiteSwitch = true;}

      } //Call function
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
