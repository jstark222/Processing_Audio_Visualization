//This Function Draws the Disco Background

int ptsW, ptsH;

PImage img;
PImage img2;
float spin = 0.0;
float input = 2;

int yheight = 0;
int reset = 800;
float slowspin = 0;



void DiscoInit() {
  
  noStroke();
  img2= loadImage("lights.jpg");
  img2.resize(w, h);
  
}

void BackgroundDiscoDraw(){
    image(img2, slowspin-800, 0);
    image(img2, slowspin, 0);
}

void DiscoDraw() {
  //background(0);
 

  if(slowspin >= 800)
  {
    slowspin = 0;
    //if(input < 3)
      //input += 0.1;
  
 
  }
 
  slowspin = slowspin + input + (input/2);
  

  
  yheight++;
  

}



