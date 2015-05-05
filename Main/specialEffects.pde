//Special Effects library
import java.util.ArrayList;
float kickSize, snareSize, hatSize;
final int NUMBALLS = 200;
//Ball[] b = new Ball[NUMBALLS];

boolean frozen = false;
float speed;

int num_show;

void ballinit(){
  for (int i =0; i<NUMBALLS;i++){
    //b[i] = new Ball();
    b.add(new Ball());
  }
  star = new Meteor();
  num_show = 200;
  speed = 20.0;
}

void balldraw(){
  fill(255,100);
  //fill(0,9);
  
    for (int i =0; i<num_show;i++)
      b.get(i).display();
}

void ballsetspeed(){
  ArrayList<Integer> b2 = new ArrayList<Integer>();
    
    float newSpeed =  random(-10,10);
    int select_ball = (int) random(0, b.size() / 3);
    
    for(int i = 0; i < select_ball; i++){
      b2.add((int) random(0,b.size()));
    }
    for(int i = 0; i < b2.size(); i++){
       //b[b2.get(i)].setFast(newSpeed);
       b.get(b2.get(i)).setFast(newSpeed);
    }
   changeColor();
}
void drawStar(){
   if(star.get_touch() == true){
    star_create = false;
  }
  
  if(star_create == true){
      star.display();
   }  
  
}


  
void drawExplosion(){
 rect(0,0,width,height);
  
  for (int i =0; i<b.size();i++)
  {
    //b[i].display();
    b.get(i).display();
  }
  if( create_explotion == true){
    int select_ball = (int) random(0, b.size() / 3);
    for(int i = 0; i < select_ball; i++){
      b3.add((int) random(0,b.size()));
    }
    for(int i = 0; i < b3.size(); i++){
       //b[b3.get(i)].create_explor();
       b.get(b3.get(i)).create_explor();
    }   
    explotion = true;
    create_explotion = false;
  }
  
  if(explotion == true){
    for(int i= 0; i < b3.size(); i++){
       //b[b3.get(i)].explor();
       b.get(b3.get(i)).explor();
       //b.remove(b3.get(i));
    }  
  }
  //println(b3.size());
  if (b3.size() >= 50) b3.clear(); 
  
}


void setStar(){
  if(!star_create){
      star = new Meteor();
      star.setSpeed();
      star_create = true;
      
  }
  
 
}
void changeColor(){
   color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
   for (int i =0; i< num_show/3 ;i++){
      int ran_num = (int) random(0,num_show);
      b.get(ran_num).setColor(c);
      
   }
}
  

void move_left(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    b.get(i).setSpeed(-speed,0.0);
   }
}
  
void move_right(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
     b.get(i).setSpeed(speed,0.0);
   }
}
   
void move_up(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
     b.get(i).setSpeed(0.0,-speed);
   }
}




