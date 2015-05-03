class Ball{
  float xpos,ypos;
  float xspeed, yspeed;
  float diameter;
  color c = color(0,0,250,90);
  
  Ball (){
    //set diameter before position
    diameter = random(10,50);
    //Then don't let too close to edg
    //because it keeps bounce from working
    xpos = random(diameter, w-diameter);
    ypos = random(diameter, h-diameter);
    xspeed = random(0.1,5.0);
    yspeed = random(0.1,5.0);
    //set a random color
  }
  void display(){
    //fill(c);
    noFill();
    stroke(c);
    ellipse(xpos,ypos,diameter,diameter);
    xpos += xspeed;
    ypos += yspeed;
    this.bounce();
  }
  void bounce(){
    if (xpos> w -diameter/2) xspeed = -xspeed;
    else if (xpos < diameter/2) xspeed = -xspeed;
    if (ypos > h - diameter/2) yspeed = -yspeed;
    else if (ypos < diameter/2) yspeed = -yspeed;
  }
  
  void setColor(color val){
    c = val;
  }
  
  float getSpeedX(){
    return xspeed;
  }
  float getSpeedY(){
    return yspeed;
  }
  
  void setSpeed(float valx, float valy){
    xspeed = valx;
    yspeed = valy;
  }
  
  
  void setFast(float speed){
    if (xspeed < 0 && yspeed < 0 && speed < 0){
      xspeed = speed;
      yspeed = speed;
    }
    else if (xspeed < 0 && yspeed < 0 && speed > 0){
      xspeed = -speed;
      yspeed = -speed;
    }
    else if (xspeed < 0 && yspeed > 0 && speed < 0){
      xspeed = speed;
      yspeed = -speed;
    }
    else if (xspeed < 0 && yspeed > 0 && speed > 0){
      xspeed = -speed;
      yspeed = speed;
    }
    else if (xspeed > 0 && yspeed < 0 && speed < 0){
      xspeed = -speed;
      yspeed = speed;
    }
    else if (xspeed > 0 && yspeed < 0 && speed > 0){
      xspeed = speed;
      yspeed = -speed;
    }
    else if (xspeed > 0 && yspeed > 0 && speed < 0){
      xspeed = -speed;
      yspeed = -speed;
    }
    else if (xspeed > 0 && yspeed > 0 && speed > 0){
      xspeed = speed;
      yspeed = speed;
    }
  }
}
