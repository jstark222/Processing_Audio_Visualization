class Explosive{
  float xpos,ypos;
  float xspeed, yspeed;
  float diameter;
  float lifespan = 255.0;
  color c = color(lifespan,0, 0);

  
  
  Explosive (float xp, float yp){
    //set diameter before position
    diameter = random(1,5);
    //Then don't let too close to edg
    //because it keeps bounce from working
    xpos = xp;
    ypos = yp;
    xspeed = random(-2.0,2.0);//adjust here to get the spare speed
    yspeed = random(-2.0,2.0);
    
    //set a random color
  }
  void display(){
    if(lifespan != 0){
      fill(c);
      //noFill();
      stroke(c);
      ellipse(xpos,ypos,diameter,diameter);
      xpos += xspeed;
      ypos += yspeed;
      lifespan = lifespan - 2.0; // adjust here to get the fade time
      this.setColor(color(lifespan,0,0));
      this.bounce();
    }
     else{
       noFill();
     }
  }
  
   void bounce(){
    if (xpos> width -diameter/2) xspeed = -xspeed;
    else if (xpos < diameter/2) xspeed = -xspeed;
    if (ypos > height - diameter/2) yspeed = -yspeed;
    else if (ypos < diameter/2) yspeed = -yspeed;
  }
  
  void setPos(float valx, float valy){
    xpos = valx;
    ypos = valy;
  }
  
  
  void setColor(color val){
    c = val;
  }
  
  float getlife(){
    return lifespan;
  }
  
  float getSpeedX(){
    return xpos;
  }
  float getSpeedY(){
    return ypos;
  }
  
  void setSpeed(float valx, float valy){
    xspeed = valx;
    yspeed = valy;
  }
}
