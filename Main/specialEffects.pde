//Special Effects library
import java.util.ArrayList;
float kickSize, snareSize, hatSize;
final int NUMBALLS = 100;
Ball[] b = new Ball[NUMBALLS];

boolean frozen = false;
float speed;

int num_show;

void ballinit(){
  for (int i =0; i<b.length;i++)
    b[i] = new Ball();
  num_show = 100;
  speed = 10.0;
}

void balldraw(){
  fill(255,100);
  //fill(0,9);
  
    for (int i =0; i<num_show;i++)
      b[i].display();
}

void ballsetspeed(){
    changeColor();
    float newSpeed =  random(-10,10);
    int select_ball = (int) random(0, num_show / 3);
    ArrayList<Integer> b2 = new ArrayList<Integer>();
    for(int i = 0; i < select_ball; i++){
      b2.add((int) random(0,num_show));
    }
    for(int i = 0; i < b2.size(); i++){
       b[b2.get(i)].setFast(newSpeed);
    }
   
}
  

void changeColor(){
  color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
   for (int i =0; i< num_show/3 ;i++){
    int ran_num = (int) random(0,num_show);
    b[ran_num].setColor(c);
   }
}
  

void move_left(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    b[i].setSpeed(-speed,0.0);
   }
}
  
void move_right(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
     b[i].setSpeed(speed,0.0);
   }
}
   
void move_up(){
  int ran_num = (int) random(0,num_show);
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
     b[i].setSpeed(0.0,-speed);
   }
}




