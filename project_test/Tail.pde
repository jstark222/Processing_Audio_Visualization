class Tail{
  float positionX,positionY;
  float speed;
  float lifespan;
  
  Tail (float posx,float posy){
    positionX = posx;
    positionY = posy;
    speed =1;
    
  }
  void display(){
    //translate(width*0.8+speed, height*0.5+speed);
    
    if(positionX < width){
      //positionY = 0.0004101 * positionX * positionX  - 0.36454 * positionX + 350;
      star(random(-250,-10), random(-10,10), 5, 10, 5); 
    }
    else
    {
      positionX = 0;
    }
  }
   
  
  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    stroke(255, 204, 0);
    fill(255, 204, 0);
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

}
