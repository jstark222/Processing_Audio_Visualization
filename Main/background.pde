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
    image(img2, slowspin-w, 0);
    image(img2, slowspin, 0);
}


void BackgroundStrobe () {
  if(blackwhiteSwitch)
  {
    background(0);

  }
  else
  {
    background(255);
 
  } 
   
  
} 

void BlackBackground(){
 background(0); 
  
}
void WhiteBackground(){
  blackwhiteSwitch = false;
 background(255); 
  
}
void DiscoDraw() {
  
 

  if(slowspin >= w)
  {
    slowspin = 0;

  
 
  }
 
  slowspin = slowspin + input;
  

  
  yheight++;
  

}



