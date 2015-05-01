//Main file to launch all other code



String fileName = "..\\..\\Music\\The Times.mp3";  //The default location the loadFile() method looks is in the sketch's data folder; this moves up two directories and into the Music folder; this will error if your directory structure is different from the one on GitHub.
int mode = 1;
Boolean initTrigger = true;
int effect = 2;
int w = 800;
int h = 600;


public JFrame new_window;

void setup() {
  size(w, h, JAVA2D);
  createGUI();
  enableGui();
  mainDisplayInit(fileName);
 

}


void draw() {
  switch(mode) {
    case 1:
      mainDisplayDraw();    
      break;
    case 2: //Options Menu
      background(0);
      break;  
    case 3:
 
      exit();
      break;
  }
}

