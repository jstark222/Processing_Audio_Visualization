import ddf.minim.*;             //Provides Minim and AudioInput
import ddf.minim.analysis.*;    //Provides FFT
import g4p_controls.*;

Minim minim;         //The Minim class contains methods for obtaining and playing audio input
AudioPlayer player;  //Provides a self-contained way of playing a sound file by streaming it from disk. It provides methods for playing & looping the file, as well as methods for setting the position in the file and looping a section of the file.
FFT fft;             //FFT = Fast Fourier Transform - performs a Fourier Transform on audio data to generate a frequency spetrum
BeatDetect beat;
BeatListener beatListener;

int kickCounter = 0;
int hatCounter = 0;
int snareCounter = 0;


void mainDisplayInit(String fileName) {  
  minim = new Minim(this);
  loadSong();
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  beat.setSensitivity(50);
  beatListener = new BeatListener(beat, player);
  ballinit();
  drawSongSlider();
}


void mainDisplayDraw() {
  beat.detect(player.mix);
  triggers();
  slider1.setTrackOffset(map(player.position(), 0, player.length(), 0, 10.0));
  balldraw();
}


void loadSong()
{
  player = minim.loadFile(fileName);  //This method functions much the same way as loadImage()
   
  
}

void triggers() {
  
  if (beat.isKick()) { kickCounter++; ballsetspeed(); } //Call function
  if (beat.isHat()) { hatCounter++; } //Call function
  if (beat.isSnare()) { snareCounter++; } //Call function
  if (kickCounter % 5 == 0) {} //Call function
  if (hatCounter % 5 == 0) {} //Call function
  if (snareCounter % 5 == 0) {} //Call function
  
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
