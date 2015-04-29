//Main file to launch all other code



String fileName = "..\\..\\Music\\The Times.mp3";  //The default location the loadFile() method looks is in the sketch's data folder; this moves up two directories and into the Music folder; this will error if your directory structure is different from the one on GitHub.
int mode = 2;
Boolean initTrigger = true;
int effect = 2;
int w = 800;
int h = 600;


public JFrame new_window;

void setup() {
  size(w, h, JAVA2D);
  createGUI();
  enableGui();
  
  //if (initTrigger) {
    //initTrigger = false;
    mainDisplayInit(fileName);
  //}

}


void draw() {
  switch(mode) {
    case 1:
    
      //addGui
      break;
      
    case 2:
      //disableGui(); 
      { mainDisplayDraw(); }
      break;
      
    case 3:
      if (initTrigger) { initTrigger = false; }
      else { }
      exit();
      break;
  }
}



/*
void keyPressed() {
  if (key == 'p' || key == 'P') {  //If the user presses p, the audio playback will toggle between play and pause
    if (audioPlayer.isPlaying()) { audioPlayer.pause(); }
    else { audioPlayer.play(); }
  }
  
  if (key == 'm' || key == 'M') {  //If the user presses m, the audio playback will toggle muted/unmuted
    if (audioPlayer.isMuted()) { audioPlayer.unmute(); }
    else { audioPlayer.mute(); }
  }
  
  if (key == 's') { println("Playback Position: (in seconds):\t" + (audioPlayer.position() / 1000.0)); }  //Writes the current playback position in seconds to the console
}


void keyReleased() {  //Constant calling of skip() results in choppy playback behavior; thus, keyReleased() is used here instead of keyPressed().
  if (key == CODED && keyCode == RIGHT) { audioPlayer.skip(100); }  //Skip() skips milliseconds from the current position. If a skip results in a position greater than length(), the new position will be clamped to length().
  if (key == CODED && keyCode == LEFT) { audioPlayer.skip(-500); }  //The skip value "millis" can be negative, causing the playback to skip backwards. If a negative skip results in a negative position, the new position will be clamped to zero.
}
*/
