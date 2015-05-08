//Displays histograms of random values

float positionX,positionY,posX,posY;
float star_speed = 1;
float[] multi = new float [10];
float[] multi1 = new float [10];
float lifespan = 255;
boolean shine = true;
boolean left = false;
boolean right = false;


void starInit() {
  for(int i = 0; i < 10; i ++){
    //multi[i] = random(-300,300);
    multi[i] = random(0.0004101,0.00084101);
  }
  for(int i = 0; i < 10; i ++){
    //multi[i] = random(-300,300);
    //multi1[i] = random(-0.0004101,0.00084101);
    multi1[i] = random(-0.0006101,-0.0004101);
  }
  positionX = 1;
  posX = w;
}
void star_draw() {
  if(left){
    draw_left();
  }
  
  if(right){
    draw_right();
  }

}
void keyReleased() {
  // You don't need a mouseMoved function if you do everything
  // in draw().
  if      (key == '7'){
    if(left == true) left = false;
    else left = true;
  }
  
  if      (key == '8'){
    if(right == true) right = false;
    else right = true;
  }
}

void draw_left(){
  if(shine ==  true){
    lifespan = lifespan - 2;
    if(lifespan < 50) shine = false; 
    //println(lifespan);
  }
    if(shine == false){
      lifespan = lifespan +2;
      if(lifespan > 255) shine = true;
      //println(lifespan);
    }
  for(int j = 0; j < 10; j++){
    //float tail = 50;
    if(positionX < width){      
      star(positionX, positionY, 10, 30, 5,255); 
      for(int i = 0; i < 10; i++){
        float tail = random(50,200);
        star(positionX-tail, positionY, 5, 15, 5,lifespan); 
        tail = tail + 50;     
      }
      positionX = positionX+star_speed;
      //positionY = 0.0004101 * positionX * positionX  - 0.36454 * positionX + 350 - multi[j];
      positionY = multi[j] * positionX * positionX  - 0.36454 * positionX + 100;
    }
    else{
      positionX = 0;
    }
  }
}


void draw_right(){
  if(shine ==  true){
    lifespan = lifespan - 2;
    if(lifespan < 50) shine = false; 
    //println(lifespan);
  }
    if(shine == false){
      lifespan = lifespan +2;
      if(lifespan > 255) shine = true;
      //println(lifespan);
    }
  
  
  for(int j = 0; j < 10; j++){
    //float tail = 50;
    if(posX > 0){      
      star(posX, posY, 10, 30, 5,255); 
      for(int i = 0; i < 10; i++){
        float tail = random(50,200);
        star(posX+tail, posY, 5, 15, 5,lifespan); 
        tail = tail - 50;     
      }
      posX = posX-star_speed;
      posY = multi1[j] * posX * posX  - 0.36454 * posX + 500;
      //posY = multi1[j] * posX * posX  - 0.36454 * posX + 100;
      //posY = 100;
    }
    else{
      posX = width;
    }
  }
}

void star(float x, float y, float radius1, float radius2, int npoints,float z) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    stroke(z, z-51, 0);
    fill(z, z - 51, 0);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
