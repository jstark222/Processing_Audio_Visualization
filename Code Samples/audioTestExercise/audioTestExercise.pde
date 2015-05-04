import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


String[] playFile = {"Beach Boys - Good Vibrations.mp3", "Johnny Nash - I Can See Clearly Now.MP3"};
int nsongs = 2, currentSong = 0;
Minim[] minim = new Minim[nsongs];
AudioPlayer[] audioPlayer = new AudioPlayer[nsongs];
FFT[] fft = new FFT[nsongs];
BeatDetect beat;
TickRate rateControl;
FilePlayer filePlayer;


void setup() {
  size(3 * displayWidth / 4, displayHeight / 2);
  for (int i = 0; i < nsongs; i++) {
    minim[i] = new Minim(this);
    audioPlayer[i] = minim[i].loadFile(playFile[i], 1024);  //Default sound buffer = 1024
    fft[i] = new FFT(audioPlayer[i].bufferSize(), audioPlayer[i].sampleRate());
  }
  
  audioPlayer[currentSong].play();
  
  rateControl = new TickRate(1.f);
  
  //audioPlayer.patch(rateControl).patch(out);
}


void draw() {
  int lineLength, thickness = 5, space = thickness + 1;
  
  background(0);
  strokeWeight(thickness);
  
  fft[currentSong].forward(audioPlayer[currentSong].mix);
  stroke(0, 0, 255);
  float maxVal = 0.0, minVal = 10000000000.0;
  
  for (int i = 0; i < fft[currentSong].specSize(); i++) {
    if (fft[currentSong].getBand(i) > maxVal) maxVal = fft[currentSong].getBand(i);
    else if (fft[currentSong].getBand(i) < minVal) minVal = fft[currentSong].getBand(i); 
  }
  
  for (int i = 0; i < fft[currentSong].specSize(); i++) {
    lineLength = (int) map(fft[currentSong].getBand(i), 0, maxVal, 0, 3 * height / 4);
    line(space * i, height, space * i, height - lineLength);
  }
  
  strokeWeight(1);
  stroke(255, 0, 0);
  
  for (int i = 0; i < audioPlayer[currentSong].mix.size()-1; i++) {
    stroke(255, i/2, i/30);
    line(i, height/2 - 50 + audioPlayer[currentSong].mix.get(i) * 50, i + 1, height/2 + audioPlayer[currentSong].mix.get(i+1));
    stroke(i-20, i-30, 255);
    line(i, height/2 + audioPlayer[currentSong].mix.get(i+1), i + 1, height/2 + audioPlayer[currentSong].mix.get(i) * 50);
  }
  
  /*background(0);
  fft.forward(audioPlayer[currentSong].mix);
  stroke(0, 0, 255);
  
  for (int i = 0; i < fft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i) * 4);
    line(i + width/2, height, i + width/2, height - fft.getBand(i) * 4);
  }
  
  stroke(255);
  
  for (int i = 0; i < audioPlayer.bufferSize()-1; i++) {
    line(i, 50 + audioPlayer.left.get(i) * 50, i + 1, 50 + audioPlayer.left.get(i+1) * 50);
    line(i, 150 + audioPlayer.right.get(i) * 50, i + 1, 150 + audioPlayer.right.get(i+1) * 50);
  }*/
}


void keyPressed() {
  for (int i = 0; i < nsongs; i++) audioPlayer[i].pause();
  if (key == 'a') { for( int i = 0; i < nsongs; i++) { audioPlayer[i].play(); } }
  else if (key >= '0'  &&  key <= '9') {
    int k = Character.getNumericValue(key);
    audioPlayer[k].play();
    currentSong = k;
  }
}
