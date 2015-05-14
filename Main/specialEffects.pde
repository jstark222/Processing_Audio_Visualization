//This sketch contains code related to controlling the number, speed, direction, and color of the bubbles and explosion effect

//Special Effects library
import java.util.ArrayList;
float kickSize, snareSize, hatSize;
//set initial ball number
int NUMBALLS = 200;

//set initial ball speed
float speed = 20.0;
//this value will hold how many ball you want show
int num_show;

void ballinit(){
  for (int i =0; i<NUMBALLS;i++){
    b.add(new Ball());
  }
  num_show = NUMBALLS;
}

void ballreInit(){
 b.clear();
 for (int i =0; i<num_show;i++){
    b.add(new Ball());
  }
 
  
}

void balldraw(){
  fill(255,100);
  //fill(0,9);
  
    for (int i =0; i<num_show;i++)
      b.get(i).display();
}


//set the random number of ball change speed, and change the color
void ballsetspeed(){
  ArrayList<Integer> b2 = new ArrayList<Integer>();
    
    float newSpeed =  random(-10,10);
    int select_ball = (int) random(0, b.size() / 3);
    
    for(int i = 0; i < select_ball; i++){
      b2.add((int) random(0,b.size()));
    }
    for(int i = 0; i < b2.size(); i++){
       b.get(b2.get(i)).setFast(newSpeed);
    }
   changeColor();
}



//make the explosion happend
void drawExplosion(){
 rect(0,0,width,height);
  
  for (int i =0; i<b.size();i++)
  {
    b.get(i).display();
  }
  if( create_explotion == true){
    int select_ball = (int) random(0, b.size() / 3);
    for(int i = 0; i < select_ball; i++){
      b3.add((int) random(0,b.size()));
    }
    for(int i = 0; i < b3.size(); i++){
       try { b.get(b3.get(i)).create_explor(); } catch (Exception e) { }
    }   
    explotion = true;
    create_explotion = false;
  }
  
  if(explotion == true){
    for(int i= 0; i < b3.size(); i++){
       try { b.get(b3.get(i)).explor(); } catch (Exception e) { }
    }  
  }
 
  if (b3.size() >= 50) b3.clear(); 
  
}


void changeColor(){
   color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
   for (int i =0; i< num_show/3 ;i++){
      int ran_num = (int) random(0,num_show);
      b.get(ran_num).setColor(c);
      
   }
}
  





