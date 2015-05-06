//Main file to launch all other code
//String fileName = "..\\..\\Music\\The Times.mp3";  //The default location the loadFile() method looks is in the sketch's data folder; this moves up two directories and into the Music folder; this will error if your directory structure is different from the one on GitHub.
import ddf.minim.*;             //Provides Minim and AudioInput
import ddf.minim.analysis.*;    //Provides FFT
import g4p_controls.*;


Minim minim;         //The Minim class contains methods for obtaining and playing audio input
AudioPlayer player;  //Provides a self-contained way of playing a sound file by streaming it from disk. It provides methods for playing & looping the file, as well as methods for setting the position in the file and looping a section of the file.
FFT fft;             //FFT = Fast Fourier Transform - performs a Fourier Transform on audio data to generate a frequency spetrum


ArrayList<String> fileName = new ArrayList(1);
String songName;
int currentSong = 0, mode = 1, hueVal = 0;
Boolean initTrigger = true, songLoaded = false, initSongSelected = false;
int effect = 4;
int w = 0;
int h = 0;
boolean optionBool = false;
boolean fillTrue = false;



public JFrame new_window;
boolean sketchFullScreen(){
  return true;
}


void setup() {
  w = displayWidth;
  h = displayHeight;
  //w = 800;
  //h = 800;
  size(w, h, JAVA2D);
  textSize(16);
  mainInitializer();

  
}

void mainInitializer(){
  minim = new Minim(this);
  background(255);
  createOptionsGUI();
  createGUI();
  
  enableGui(); 
  drawSongSlider();
  mainDisplayInit();
  drawRectangle();
  
}

void draw() {
  switch(mode) {
    case 1:
      if (initSongSelected) {
        mainDisplayDraw();
        songName = fileName.get(currentSong).substring(fileName.get(currentSong).lastIndexOf('\\') + 1, fileName.get(currentSong).lastIndexOf('.'));
        colorMode(HSB);
          fill(hueVal, 255, 255);  //Provides a rainbow effect to the displayed text; this was implemented to prevent text from becoming unreadable against any BG
          text(songName, 0, 12);  //Display the name of the current song in the top left corner of the window
          text("Queue: " + fileName.size(), w - 80, 12);  //Display the number of songs in the queue in the top right hand corner of the window
          noFill();
        colorMode(RGB);
        hueVal = (hueVal > 255) ? 0 : hueVal + 1;
        
        
        if ((player.position() >= player.length() - 1000)  &&  currentSong < fileName.size() -1) {
          currentSong++;
          player.pause();
          loadSong();
          player.play();
        }
      }
      break;
    case 2: //Options Menu
      background(0);
      break;  
    case 3:
 
      exit();
      break;
  }
}
