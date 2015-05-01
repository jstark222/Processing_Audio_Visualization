//This Function Draws the Disco Background

int ptsW, ptsH;

PImage img;
PImage img2;
float spin = 0.0;


int yheight = 0;
int reset = 800;
int slowspin = 0;



void DiscoInit() {
  
  noStroke();
  img2= loadImage("lights.jpg");
  img2.resize(800, 600);
  
}

void BackgroundDiscoDraw(){
    image(img2, slowspin-800, 0);
    image(img2, slowspin, 0);
}

void DiscoDraw() {
  //background(0);
 
  if(spin >= 800)
  {
    spin = 0;
 
  }
  if(slowspin >= 800)
  {
    slowspin = 0;
 
  }
  spin = spin + input;
  slowspin = slowspin + input + (input/2);
  

  
  yheight++;
  

}



