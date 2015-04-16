//Draw a moving ball
//5 : change color
//0 : random move
//+ : plus ball number
//- : minus ball number



final int NUMBALLS = 100;
Ball[] b = new Ball[NUMBALLS];
boolean frozen = false;
float speed;

int num_show;

void setup(){
  size(640,360);
  background(0);
  for (int i =0; i<b.length;i++)
    b[i] = new Ball();
  num_show = 100;
  speed = 1.0;
}

void draw(){
  
  //fill(255,100);
  fill(0,9);
  
  rect(0,0,width,height);
  for (int i =0; i<num_show;i++)
    b[i].display();
}

void keyReleased(){
  if (key == 'f'){
    if(frozen){
      loop();
    frozen = false;
  }
  else{
   noLoop(); //Freeze it
   frozen = true;
  }
 } 
 else if (key =='s' && frozen) redraw();
 
 else if (key == '5'){
   color c = color(random(0,255),random(0,255),random(0,255),random(0,255));
   for (int i =0; i< num_show/3 ;i++){
    int ran_num = (int) random(0,num_show);
    b[ran_num].setColor(c);
   }
 }
 
 else if (key == '+'){
   if (num_show <= 90 ){
     num_show = num_show + 10;
   }
 }
 
 else if (key == '-'){
   if (num_show >= 10){
     num_show = num_show - 10;
   }
 }
 
 else if (key == '4'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(-speed,0.0);
   }
 }
 
 else if (key == '8'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(0.0,-speed);
   }
 }
 
 else if (key == '2'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(0.0, speed);
   }
 }
 
 else if (key == '6'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(speed,0.0);
   }
 }
 
 else if (key == '7'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(-speed,-speed);
   }
 }
 
 else if (key == '9'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(speed,-speed);
   }
 }
 
 else if (key == '1'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(-speed,speed);
   }
 }
 
 else if (key == '3'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(speed,speed);
   }
 }
 
 
 else if (key == '0'){
   for (int i =0; i<num_show;i++){
    //b[i].setSpeed(b[i].getSpeedX()-0.5, b[i].getSpeedY()-0.5);
    
    b[i].setSpeed(random(0.1,5.0),random(0.1,5.0));
   }
 }
 
 else if (key == '*'){
     speed = speed +1;
     println("current speed is " + speed);
 }
 
 else if (key == '/'){
   speed = speed - 1;
   println("current speed is " + speed);
 }
 
   

   
}

