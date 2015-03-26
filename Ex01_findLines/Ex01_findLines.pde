//This program finds colors in an image and creates new images with only selected colors.
//It's set up to process emptyroad.jpg: type 0, 1, 2, or 3 to display images
//This version uses img get() and set() methods, rather than pixel arrays
PImage[] img = new PImage[4];
int imgIndex = 0;
color black = color(0, 0, 0);

void setup() {
  //Reference colors for emptyroad.jpg
  color refWhite = color(255), refYellow = color(244, 217, 126);
  float white_thr = 75, yellow_thr = 50; //Thresholds for emptyroad.jpg

  // Load "emptyroad.jpg" into img[0]
  // Set size to the width & height of img[0]
  // First color is reference; second color is replacement color
  img[1] = findColor(img[0], refWhite, white_thr, refWhite);
  img[2] = findColor(img[0], refYellow, yellow_thr, refYellow);
  img[3] = addImages(img[1], img[2]);
  //Set imgIndex to 0 to display original image
}
void draw() {
  image(img[imgIndex], 0, 0);
}
//Select pixels that are close to refColor in img1; return an image with pixels
//that are close to refColor set to repColor; other pixels are set to black
//NOTE: using a replacement color allows you to make the lines red or whatever
PImage findColor (PImage img1, color refColor, float thr, color repColor) {
  float d;
  //Create an image (img2) that is the same width and height as img1
  //Use a nested loop to examine each pixel in img1
      //Set d to cdist between the current pixel and the reference color
      //if d > thr, set the current pixel in img2 to black
      //else set the current pixel in img2 to the replacement color
  //Return img2
}
float cdist(color c1, color c2) {
  //Return Euclidean distance between c1 and c2
}
//Print a pixel value to the console; called from mousePressed()
void showColor(color c) {
  println(red(c) + "," + green(c) + "," + blue(c));
}
PImage addImages(PImage img1, PImage img2) {
  float r, g, b;
  // Assume img1 and img2 are the same size
  //Create a new image (img3) that is the same width and height as img1 and img2
  // img3 <-- img1 + img2
}

void keyPressed() { //Set imgIndex according to key pressed (0, 1, or 2)
}
void mousePressed() { //Print RGB pixel value from the display window
}
// hellow world!
