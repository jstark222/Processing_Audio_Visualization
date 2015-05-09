class Explosive{
  float xpos,ypos;
  float xspeed, yspeed;
  float diameter;
  float lifespan_white = 255.0;
  float lifespan_black = 0.0;
  color c = color(lifespan,lifespan, lifespan);

  
  
  Explosive (float xp, float yp){
    //set diameter before position
    diameter = random(1,8);
    //Then don't let too close to edg
    //because it keeps bounce from working
    xpos = xp;
    ypos = yp;
    xspeed = random(-3.0,3.0);//adjust here to get the spare speed
    yspeed = random(-3.0,3.0);
    
    //set a random color
  }
  void display(){
    
    
    //set a to trigger, when the background is black, use this draw
    if(lifespan_white != 0){
      fill(c);
      //noFill();
      stroke(c);
      ellipse(xpos,ypos,diameter,diameter);
      xpos += xspeed;
      ypos += yspeed;
      lifespan_white = lifespan_white - 2.0; // adjust here to get the fade time
      this.setColor(color(lifespan_white,lifespan_white,lifespan_white));
      this.bounce();
    }
     else{
       noFill();
     }
  
  
  
  //set a to trigger, when the background is white, use this draw
  if(lifespan_black != 255){
      fill(c);
      //noFill();
      stroke(c);
      ellipse(xpos,ypos,diameter,diameter);
      xpos += xspeed;
      ypos += yspeed;
      lifespan_black = lifespan_black + 2.0; // adjust here to get the fade time
      this.setColor(color(lifespan_black,lifespan_black,lifespan_black));
      this.bounce();
    }
     else{
       noFill();
     }
     
     
  }
  
   void bounce(){
    if (xpos> w -diameter/2) xspeed = -xspeed;
    else if (xpos < diameter/2) xspeed = -xspeed;
    if (ypos > h - diameter/2) yspeed = -yspeed;
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
