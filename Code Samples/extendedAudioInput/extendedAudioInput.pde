/*
    This is a sample block of code extends the sketch audioInputExample by creating a colorful fading
    effect based on the audio input from the user.
      
    Minim documentation:
      http://code.compartmental.net/minim/
    
    Minim documentation (Javadocs):
      http://code.compartmental.net/minim/javadoc/overview-summary.html
*/


import ddf.minim.*;             //Provides Minim and AudioInput
import ddf.minim.analysis.*;    //Provides FFT

Minim minim;         //The Minim class contains methods for obtaining and playing audio input
AudioInput audioIn;  //AudioInput is a connection to the current record source of the computer
FFT fft;             //FFT = Fast Fourier Transform - performs a Fourier Transform on audio data to generate a frequency spetrum

int wdth;  //This value is used to stretch the width of the spectrum display across the window
PImage fade;  //The fade image takes what is currently displayed in the window, and then draws it onto the next frame, giving a fading effect to whatever is displayed
float rWidth, rHeight;  //This values are used to make the fade image appear slightly smaller than what is being displayed in the window, making it seem as if the viewer is constantly moving back and away from the image 
int hueVal = 0;  //This value is used to set the hue value for the fade image


void setup() {
  size(640, 480);
  
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.STEREO, 512);  //getLineIn monitors the currently active audio input
  fft = new FFT(audioIn.bufferSize(), audioIn.sampleRate());  //The two parameters simply return the respective values from the audio input
  fft.logAverages(60, 7);  //Groups frequency bands by octave; allows specification of the size of the smallest octave to use (in Hertz) and how many bands to split each octave into 
  
  wdth = width/fft.avgSize();
  stroke(255);
  strokeWeight(wdth);
  strokeCap(SQUARE);  //Default is ROUND, which does not look the greatest
  
  background(0);
  fade = get(0, 0, width, height);  //Initiates fade to what the window is currently displaying
}


void draw() {
  background(0);
  image(fade, (width - rWidth) / 2, 0, rWidth, rHeight);
  
  fft.forward(audioIn.mix);  //Performs a forward FFT on the input's mix buffer, which contains the mix of both the left and right channels of the input
  
  colorMode(HSB);  //Changes colorMode to Hue, Saturation, Brightness, so as hueVal increases, we're seeing different colors
  stroke(hueVal, 255, 255);  //Saturation & Brightness are maxed, while the value of Hue is incremented by 2 each draw loop, giving a rainbow effect
  colorMode(RGB);  //Changes colorMode back to Red, Green, Blue to avoid hiccups with other functions that may use RGB 
  
  for (int i = 0; i < fft.avgSize(); i++) {
    line(i * wdth + wdth / 2, height, i * wdth + wdth / 2, height - fft.getAvg(i) * 4);  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
  
  fade = get(0, 0, width, height);  //fade is always equal to what the window is currently displaying
  hueVal += 2;
  if (hueVal > 255) { hueVal = 0; }  //Once hueVal reaches 255 (the maximum value) is restarts at 0, giving a cyclic rainbow effect
  rWidth = width * 0.99;
  rHeight = height * 0.99;
}
