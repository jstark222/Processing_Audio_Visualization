/*
    This is a sample block of code modifies and extends the sketch extendedAudioInput by changing the
    audio input from the user's default microphone to input from an audio file.
    
    Additional functions include pressing P to toggle play/pause, pressing M to toggle mute/unmute,
    pressing the right arrow key to skip the playback forward by 100 ms, and pressing the left arrow
    key to skip the playback backward by 500 ms.
      
    Minim documentation:
      http://code.compartmental.net/minim/
    
    Minim documentation (Javadocs):
      http://code.compartmental.net/minim/javadoc/overview-summary.html
*/


import ddf.minim.*;             //Provides Minim and AudioInput
import ddf.minim.analysis.*;    //Provides FFT

Minim minim;         //The Minim class contains methods for obtaining and playing audio input
AudioPlayer audioPlayer;  //Provides a self-contained way of playing a sound file by streaming it from disk. It provides methods for playing & looping the file, as well as methods for setting the position in the file and looping a section of the file.
FFT fft;             //FFT = Fast Fourier Transform - performs a Fourier Transform on audio data to generate a frequency spetrum

int wdth;  //This value is used to stretch the width of the spectrum display across the window
PImage fade1, fade2;  //The fade image takes what is currently displayed in the window, and then draws it onto the next frame, giving a fading effect to whatever is displayed
float rWidth, rHeight;  //This values are used to make the fade image appear slightly smaller than what is being displayed in the window, making it seem as if the viewer is constantly moving back and away from the image 
int hueVal = 0;  //This value is used to set the hue value for the fade image
String fileName = "..\\..\\Music\\The Times.mp3";  //The default location the loadFile() method looks is in the sketch's data folder; this moves up two directories and into the Music folder; this will error if your directory structure is different from the one on GitHub.


void setup() {
  size(640, 480);
  
  minim = new Minim(this);
  audioPlayer = minim.loadFile(fileName);  //This method functions much the same way as loadImage()
  audioPlayer.play();  //Self-evident, but the play() method simply starts playing the loaded file
  fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());  //The two parameters simply return the respective values from the audio input
  fft.logAverages(60, 7);  //Groups frequency bands by octave; allows specification of the size of the smallest octave to use (in Hertz) and how many bands to split each octave into 
  
  wdth = width/fft.avgSize();
  stroke(255);
  strokeWeight(wdth);
  strokeCap(SQUARE);  //Default is ROUND, which does not look the greatest
  
  background(0);
  fade1 = get(0, 0, width/2, height);  //Initiates fade to what the window is currently displaying
  fade2 = get(width/2, 0, width, height);
}


void draw() {
  background(0);
  image(fade1, (width - rWidth) / 2 - 2, 0, rWidth, rHeight);
  image(fade2, width / 2 + 2, 0, rWidth, rHeight);
  
  fft.forward(audioPlayer.mix);  //Performs a forward FFT on the input's mix buffer, which contains the mix of both the left and right channels of the input
  
  colorMode(HSB);  //Changes colorMode to Hue, Saturation, Brightness, so as hueVal increases, we're seeing different colors
  stroke(hueVal, 255, 255);  //Saturation & Brightness are maxed, while the value of Hue is incremented by 2 each draw loop, giving a rainbow effect
  colorMode(RGB);  //Changes colorMode back to Red, Green, Blue to avoid hiccups with other functions that may use RGB 
  
  for (int i = 0; i < fft.avgSize(); i++) {
    if (keyPressed && key == 'g') { println(i * wdth + width/2); }
    line((i * wdth + width/2) + 10, height, (i * wdth + width/2) + 10, height - fft.getAvg(i));  //Draws a line for frequeny band i, scaling it up so that it is easier to see
    //line((i * wdth) - 10, height, (i * wdth) - 10, height - fft.getAvg((fft.avgSize()-1) - i));
    //line(i * wdth + wdth / 2, height, i * wdth + wdth / 2, height - fft.getAvg(i) * 4);  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
  for (int i = fft.avgSize(); i > 0; i--) {
    line((i * wdth + width/2) - fft.avgSize() * wdth - 10, height, (i * wdth + width/2) - fft.avgSize() * wdth - 10, height - fft.getAvg(abs(i - fft.avgSize())));  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
  
  fade1 = get(0, 0, width, height);  //fade is always equal to what the window is currently displaying
  fade2 = get(width/2, 0, width, height);
  hueVal += 2;
  if (hueVal > 255) { hueVal = 0; }  //Once hueVal reaches 255 (the maximum value) is restarts at 0, giving a cyclic rainbow effect
  rWidth = width * 0.99;
  rHeight = height * 0.99;
}


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
