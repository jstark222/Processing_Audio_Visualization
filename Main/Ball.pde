class Ball{
  float xpos,ypos;
  float xspeed, yspeed;
  float diameter;
  color c = color(0,0,250,90);
  Explosive[] c4 = new Explosive[10];
  
  Ball (){
    //set diameter before position
    diameter = random(10,50);
    //Then don't let too close to edg
    //because it keeps bounce from working
    xpos = random(diameter, w-diameter);
    ypos = random(diameter, h-diameter);
    xspeed = random(0.1,5.0);
    yspeed = random(0.1,5.0);
  }
  
  void display(){
    
    if(fillTrue)
    {
      fill(c);
    }
    else
    {
      noFill();
    }
    stroke(c);
    strokeWeight(1);
    ellipse(xpos,ypos,diameter,diameter);
    xpos += xspeed;
    ypos += yspeed;
    this.bounce();
  }
  
   void bounce(){
    if (xpos> w-diameter/2) xspeed = -xspeed;
    else if (xpos < diameter/2) xspeed = -xspeed;
    if (ypos > h - diameter/2) yspeed = -yspeed;
    else if (ypos < diameter/2) yspeed = -yspeed;
  }
  
  
  float getX(){
    return xpos;
  }
  float getY(){
    return ypos;
  }
  
  void create_explor(){
    for (int i =0; i<c4.length;i++){
      c4[i] = new Explosive(this.getX(),this.getY());
    }
  }
  
  void explor(){
    for (int i =0; i<c4.length;i++)
      try { c4[i].display(); } catch (Exception e) { }
  }
  
  void setColor(color val){
    c = val;
  }
  
  void setPos(float valx, float valy){
    xpos = valx;
    ypos = valy;
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
