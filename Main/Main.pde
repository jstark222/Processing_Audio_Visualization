//Document mixture of effects.
//README file with user documentation
//Front page user documentation
//Comments in code
//Clean up superfluous code
//Write and print out contribution report


//Main file to launch all other code
import ddf.minim.*;             //Provides Minim and AudioInput
import ddf.minim.analysis.*;    //Provides FFT
import g4p_controls.*;


Minim minim;         //The Minim class contains methods for obtaining and playing audio input
AudioPlayer player;  //Provides a self-contained way of playing a sound file by streaming it from disk. It provides methods for playing & looping the file, as well as methods for setting the position in the file and looping a section of the file.



ArrayList<String> fileName = new ArrayList(1);  //This is effectively our "queue". Holds a list of file paths that are loaded into the minim object
String songName;  //Name of the current song
int currentSong = 0, mode = 1, hueVal = 0;  //Values for current song, playback mode, and hue (hueVal is related to Infinite Mirror effect
Boolean initTrigger = true, songLoaded = false, initSongSelected = false;
int w = 0;
int h = 0;
boolean optionBool = true;
boolean fillTrue = false;
int hueChange = 0;
boolean hueToggle = false;



public JFrame new_window;
boolean sketchFullScreen(){
  return true;
}


void setup() {
  w = displayWidth;
  h = displayHeight;
  background(0);
  size(w, h, JAVA2D);
  textSize(16);
  mainInitializer();
  
}

void mainInitializer(){  //Initialize minim and create & display main GUI and options GUI
  minim = new Minim(this);
  background(255);
  createOptionsGUI();
  createGUI();
  
  enableGui(); 
  drawSongSlider();
  mainDisplayInit();
  background(0);
 
  
}

void draw() {
  switch(mode) {
    case 1:  //Song is being played
      if (initSongSelected) {  //Draw song name and queue information (and draw pause, if song is paused)
        mainDisplayDraw();
        songName = fileName.get(currentSong).substring(fileName.get(currentSong).lastIndexOf('\\') + 1, fileName.get(currentSong).lastIndexOf('.'));
        colorMode(HSB);
          fill(hueVal, 255, 255);  //Provides a rainbow effect to the displayed text; this was implemented to prevent text from becoming unreadable against any BG
          text(songName, 0, 12);  //Display the name of the current song in the top left corner of the window
          text("Queue: " + fileName.size(), w - 72 - (String.valueOf(fileName.size()).length() - 1) * 12, 12);  //Display the number of songs in the queue in the top right hand corner of the window
          if (!player.isPlaying()  &&  !(player.position() >= player.length() - 1000)) {
            text("Paused", w / 2, 42);
          }
          noFill();
        colorMode(RGB);
        hueVal = (hueVal > 255) ? 0 : hueVal + 1;
        
        
        if ((player.position() >= player.length() - 1000)  &&  currentSong < fileName.size() - 1  &&  !stop) {  //If song has ended and there is another song in the queue, start playing the next song
          slider1.setValue(w - 2);
          currentSong++;
          player.pause();
          loadSong();
          player.play();
        }
        else if ((player.position() >= player.length() - 1000)  &&  currentSong == fileName.size() -1) {  //Else if song has ended but there is not another song in the queue, stop playback and set slider to end
          player.pause();
          slider1.setValue(w - 2);
        }
        else if (stop) { slider1.setValue(w - 2); }  //Else if user has chosen to stop playback, set slider to end
      }
      
      if (!initSongSelected  &&  showOptions) { drawRectangle(); }  //Display the option menu when program starts
      
      if (hueChange == 0) { hueToggle = false; }  //This and the following 3 lines control the shifting coloration of the waveform effect
      else if (hueChange == 255) { hueToggle = true; }
      if (hueToggle) { hueChange--; }
      else { hueChange++; }
      
      if (!initSongSelected) {
        fill(233);
        rect(60, 60, 1000, 440);
        fill(0);
        text("Click 'Add Song' to choose and start playing a music file.", 100, 100);
        text("Click 'Play' to toggle between pause/playback of current song.", 100, 140);
        text("Click 'Stop' to stop playback of current song.", 100, 180);
        text("Change how responsive effects are with 'Beat Sensitivity': lower values = more sensitive, higher values = less sensitive.", 100, 260);
        text("Setting a value for 'Number of Bubbles' will determine how many bubbles are displayed when using the 'Bubbles' effect.", 100, 300);
        text("Right clicking will open a menu to show/hide interface, navigate through song queue, and exit program.", 100, 340);
        text("Select an option under 'Background' to change what kind of background is displayed.", 100, 420);
        text("Select any combination of 'Effects' to draw them to the screen.", 100, 460);
        noFill();
      }
      
      break;
    case 2: //Options Menu
      background(0);
      break;  
    case 3:  //Exit program
 
      exit();
      break;
  }
}
