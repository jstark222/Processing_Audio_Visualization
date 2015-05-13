//Provides a self-contained way of playing a sound file by streaming it from disk. It provides methods for playing & looping the file, as well as methods for setting the position in the file and looping a section of the file.
FFT fft;             //FFT = Fast Fourier Transform - performs a Fourier Transform on audio data to generate a frequency spetrum

int wdth;  //This value is used to stretch the width of the spectrum display across the window
PImage fade1, fade2;  //The fade image takes what is currently displayed in the window, and then draws it onto the next frame, giving a fading effect to whatever is displayed
float rWidth, rHeight;  //This values are used to make the fade image appear slightly smaller than what is being displayed in the window, making it seem as if the viewer is constantly moving back and away from the image 




void RainbowInit() {
  //background(0);
  fade1 = get(0, 0, w/2, h);  //Initiates fade to what the window is currently displaying
  fade2 = get(w/2, 0, w, h);
}


void drawRainbow() {
  //background(0);
  
  stroke(255);
  strokeWeight(wdth);
  strokeCap(SQUARE);  //Default is ROUND, which does not look the greatest
  image(fade1, (w - rWidth) / 2 - 2, 0, rWidth, rHeight);
  image(fade2, w / 2 + 2, 0, rWidth, rHeight);
  
  fft.forward(player.mix);  //Performs a forward FFT on the input's mix buffer, which contains the mix of both the left and right channels of the input
  
  colorMode(HSB);  //Changes colorMode to Hue, Saturation, Brightness, so as hueVal increases, we're seeing different colors
  stroke(hueVal, 255, 255);  //Saturation & Brightness are maxed, while the value of Hue is incremented by 2 each draw loop, giving a rainbow effect
  colorMode(RGB);  //Changes colorMode back to Red, Green, Blue to avoid hiccups with other functions that may use RGB 
  
  for (int i = 0; i < fft.avgSize(); i++) {
    if (keyPressed && key == 'g') { println(i * wdth + w/2); }
    line((i * wdth + w/2) + 10, h, (i * wdth + w/2) + 10, h - fft.getAvg(i));  //Draws a line for frequeny band i, scaling it up so that it is easier to see
    //line((i * wdth) - 10, height, (i * wdth) - 10, height - fft.getAvg((fft.avgSize()-1) - i));
    //line(i * wdth + wdth / 2, height, i * wdth + wdth / 2, height - fft.getAvg(i) * 4);  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
  for (int i = fft.avgSize(); i > 0; i--) {
    line((i * wdth + w/2) - fft.avgSize() * wdth - 10, h, (i * wdth + w/2) - fft.avgSize() * wdth - 10, h - fft.getAvg(abs(i - fft.avgSize())));  //Draws a line for frequeny band i, scaling it up so that it is easier to see
  }
  
  fade1 = get(0, 0, w, h);  //fade is always equal to what the window is currently displaying
  fade2 = get(w/2, 0, w, h);
  hueVal += 2;
  if (hueVal > 255) { hueVal = 0; }  //Once hueVal reaches 255 (the maximum value) is restarts at 0, giving a cyclic rainbow effect
  rWidth = w * 0.99;
  rHeight = h * 0.99;
}

void drawRibbon() {
  int lineLength, thickness = 5, space = thickness + 1;
  
  strokeWeight(thickness);
  
  fft.forward(player.mix);
  stroke(0, 0, 255);
  float maxVal = 0.0, minVal = 10000000000.0;
  
  for (int i = 0; i < fft.specSize(); i++) {
    if (fft.getBand(i) > maxVal) maxVal = fft.getBand(i);
    else if (fft.getBand(i) < minVal) minVal = fft.getBand(i); 
  }
  /*
  for (int i = 0; i < fft.specSize(); i++) {
    lineLength = (int) map(fft.getBand(i), 0, maxVal, 0, 3 * h / 4);
    line(space * i, h, space * i, h - lineLength);
  }
  */
  colorMode(HSB);
  strokeWeight(1);
  stroke(255, 0, 0);
  
  for (int i = 0; i < player.mix.size() - 1; i++) {
    stroke(map(hueChange + i, 0, 1024, 0, 255), 255, 255);
    if (keyPressed  &&  key == 'k') { println(player.mix.size()); }  
    //stroke(i-i/2, i/2, i/50);
    line(i + w/4, h/3 - 50 + player.mix.get(i) * 50, i + w/4 + 1, h/3 + player.mix.get(i+1));
    stroke(map(hueChange + i, 0, 1024, 0, 255), 255, 255);
    //stroke(i-20, i-30, 255);
    line(i + w/4, h/3 + player.mix.get(i), i + w/4 + 1, h/3 + player.mix.get(i) * 50);
  }
  
  colorMode(RGB);
  
  /*background(0);
  fft.forward(audioPlayer[currentSong].mix);
  stroke(0, 0, 255);
  
  for (int i = 0; i <ifft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i) * 4);
    line(i + width/2, height, i + width/2, height - fft.getBand(i) * 4);
  }
  
  stroke(255);
  
  for (int i = 0; i < audioPlayer.bufferSize()-1; i++) {
    line(i, 50 + audioPlayer.left.get(i) * 50, i + 1, 50 + audioPlayer.left.get(i+1) * 50);
    line(i, 150 + audioPlayer.right.get(i) * 50, i + 1, 150 + audioPlayer.right.get(i+1) * 50);
  }*/
}

