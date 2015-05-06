class Meteor{
  float positionX,positionY;
  float speed;
  Tail[] tail = new Tail[50];
  boolean touch_border;
  
  
  Meteor (){
    positionX = 0;
    positionY = height;
    speed = 1;
    for (int i =0; i<tail.length;i++){
      tail[i] = new Tail(positionX+i,positionY);
    }
    touch_border = false;
  }
  void display(){
    
    
    if(positionX < width){
      if(touch_border == false){
        positionY = 0.0004101 * positionX * positionX  - 0.36454 * positionX + 350;
        translate(positionX,positionY);
        rotate(frameCount /500.0);
        star(0, 0, 10, 30, 5); 
        positionX = positionX+speed;
      }
    }
    else{
      touch_border = true;
    }

    for (int i =0; i<tail.length;i++){
      tail[i].display();
    }
  }
  
  boolean get_touch(){
    return touch_border;
  }
  
  void modify_touch(){
    touch_border = false;
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
  
  void setSpeed(){
    speed = random(10,20);
  }

}
