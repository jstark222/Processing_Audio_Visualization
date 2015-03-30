/*
    This is a sample block of code demonstrating some of the basic functions that are included with
    the Minim library.
    The program takes audio input from the user's microphone and draws a simple spectrum to the window
    based on that input.
    
    The majority of this code comes from:
      https://vimeo.com/7586074
      
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
}


void draw() {
  background(0);
  fft.forward(audioIn.mix);  //Performs a forward FFT on the input's mix buffer, which contains the mix of both the left and right channels of the input
  
  for (int i = 0; i < fft.avgSize(); i++) {
    line(i * wdth + wdth / 2, height, i * wdth + wdth / 2, height - fft.getAvg(i) * 4);  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
}
