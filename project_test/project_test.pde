//Draw a moving ball
//5 : change color
//0 : random move
//+ : plus ball number
//- : minus ball number

import ddf.minim.*;
import ddf.minim.analysis.*;
import java.util.ArrayList;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener b1;

float kickSize, snareSize, hatSize;
int NUMBALLS = 100;
boolean frozen = false;
float speed;
boolean explotion = false;
boolean create_explotion = false;
boolean star_create = false;

//Ball[] b = new Ball[NUMBALLS];
ArrayList<Ball> b = new ArrayList<Ball>();
ArrayList<Integer> b3 = new ArrayList<Integer>();
//ArrayList<Meteor> star = new ArrayList<Meteor>();
Meteor star;



class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

void setup(){
  size(900,800);
  background(0);
  for (int i =0; i<NUMBALLS;i++){
    //b[i] = new Ball();
    b.add(new Ball());
  }
  star = new Meteor();
  //b.size() = 100;
  speed = 10.0;
  minim = new Minim(this);
  song = minim.loadFile("ao3project.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(1000);  
  kickSize = snareSize = hatSize = 16;
  b1 = new BeatListener(beat, song);  
}

void draw(){
  
  //fill(255,100);
  //fill(0,9);
  fill(0);
   


    //translate(width*0.8+speed, height*0.5+speed);
    
  
  
  
  if ( beat.isKick() ) {
    ArrayList<Integer> b2 = new ArrayList<Integer>();
    changeColor();
    float newSpeed =  random(-10,10);
    int select_ball = (int) random(0, b.size() / 3);
    
    for(int i = 0; i < select_ball; i++){
      b2.add((int) random(0,b.size()));
    }
    for(int i = 0; i < b2.size(); i++){
       //b[b2.get(i)].setFast(newSpeed);
       b.get(b2.get(i)).setFast(newSpeed);
    }
  }
      
  
      
  if ( beat.isSnare()){
    create_explotion = true;
  }
  
  
  rect(0,0,width,height);
  
  for (int i =0; i<b.size();i++)
    //b[i].display();
    b.get(i).display();
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
  
  if ( beat.isHat()){
  
    if(!star_create){
      star = new Meteor();
      star.setSpeed();
      star_create = true;
      }
  }
  
  if(star.get_touch() == true){
    star_create = false;
  }
  
  if(star_create == true){
      star.display();
   }
}


  


void changeColor(){
  color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
   for (int i =0; i< b.size()/3 ;i++){
    int ran_num = (int) random(0,b.size());
    //b[ran_num].setColor(c);
    b.get(ran_num).setColor(c);
   }
}
  

void move_left(){
  int ran_num = (int) random(0,b.size());
  for (int i =0; i<ran_num;i++){
    //b[i].setSpeed(-speed,0.0);
    b.get(i).setSpeed(-speed,0.0);
   }
}
  
void move_right(){
  int ran_num = (int) random(0,b.size());
  for (int i =0; i<ran_num;i++){
     //b[i].setSpeed(speed,0.0);
     b.get(i).setSpeed(speed,0.0);
   }
}
   
void move_up(){
  int ran_num = (int) random(0,b.size());
  for (int i =0; i<ran_num;i++){
     //b[i].setSpeed(0.0,-speed);
     b.get(i).setSpeed(0.0,-speed);
   }
}



void keyReleased(){

// if (key =='s' && frozen) redraw();
// 
// else if (key == '5'){
//   color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
//   for (int i =0; i< b.size()/3 ;i++){
//    int ran_num = (int) random(0,b.size());
//    b[ran_num].setColor(c);
//   }
// }
// 
if (key == '+'){
   if (b.size() <= 90 ){
     for(int i =0; i < 10; i++){
       b.add(new Ball());
     }
   }
 }
 
 else if (key == '-'){
   if (b.size() >= 10){
     for(int i =0; i < 10; i++){
       b.remove(0);
     }
   }
 }
// 
// else if (key == '4'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    b[i].setSpeed(-speed,0.0);
//   }
// }
// 
// else if (key == '8'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(0.0,-speed);
//   }
// }
// 
// else if (key == '2'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(0.0, speed);
//   }
// }
// 
// else if (key == '6'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(speed,0.0);
//   }
// }
// 
// else if (key == '7'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(-speed,-speed);
//   }
// }
// 
// else if (key == '9'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(speed,-speed);
//   }
// }
// 
// else if (key == '1'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(-speed,speed);
//   }
// }
// 
// else if (key == '3'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(speed,speed);
//   }
// }
// 
// 
// else if (key == '0'){
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//    b[i].setSpeed(random(0.1,5.0),random(0.1,5.0));
//   }
// }
// 
// else if (key == '*'){
//     speed = speed +1;
//     println("current speed is " + speed);
//     
//     for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//      b[i].setFast(speed);
//   }
// }
// 
// else if (key == '/'){
//   speed = speed -1;
//   println("current speed is " + speed);
//   for (int i =0; i<b.size();i++){
//    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
//    
//      b[i].setFast(speed);
//   }
// }
 
 else if (key == 'e'){
   if(create_explotion== true){
     create_explotion= false;
    }
   else{
     create_explotion= true;
   }
 }
}
 
