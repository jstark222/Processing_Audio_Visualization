//Main file to launch all other code



//String fileName = "..\\..\\Music\\The Times.mp3";  //The default location the loadFile() method looks is in the sketch's data folder; this moves up two directories and into the Music folder; this will error if your directory structure is different from the one on GitHub.
ArrayList<String> fileName = new ArrayList();
String songName;
int currentSong = 0, mode = 1, hueVal = 0;
Boolean initTrigger = true, initSongSelected = false;
int effect = 0;
int w = 800;
int h = 600;


public JFrame new_window;

void setup() {
  size(w, h, JAVA2D);
  textSize(16);
  fileName.add("..\\..\\Music\\NepentheOriginal.mp3");
  
  createGUI();
  enableGui();
  mainDisplayInit(fileName.get(currentSong));
 

}


void draw() {
  switch(mode) {
    case 1:
      mainDisplayDraw();
      songName = fileName.get(currentSong).substring(fileName.get(currentSong).lastIndexOf('\\') + 1, fileName.get(currentSong).lastIndexOf('.'));
        colorMode(HSB);
          fill(hueVal, 255, 255);  //Provides a rainbow effect to the displayed text; this was implemented to prevent text from becoming unreadable against any BG
          if (initSongSelected) { text(songName, 0, 12);  //Display the name of the current song in the top left corner of the window
          text("Queue: " + fileName.size(), width - 80, 12); }  //Display the number of songs in the queue in the top right hand corner of the window
          noFill();
        colorMode(RGB);
        hueVal = (hueVal > 255) ? 0 : hueVal + 1;
      break;
    case 2: //Options Menu
      background(0);
      break;  
    case 3:
 
      exit();
      break;
  }
}

