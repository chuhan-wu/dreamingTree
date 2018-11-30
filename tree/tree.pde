import processing.sound.*;
import processing.video.*;

SoundFile bgm;
Movie startMovie;
//Movie wishMovie;
Movie[] wishMovie = new Movie[3];

boolean wish = false;
int num;

void setup(){
    //size(800, 800);
    fullScreen();
    startMovie = new Movie(this, "tree1.mp4");
    wishMovie[0] = new Movie(this, "flower.mp4");
    wishMovie[1] = new Movie(this, "flower1.mp4");
    wishMovie[2] = new Movie(this, "flower2.mp4");
    
    bgm = new SoundFile(this, "bgm.mp3");
    bgm.loop();
    bgm.amp(0.6);
    //wishMovie = new Movie(this, "flower.mp4");
    //startMovie.loop();
}

void movieEvent(Movie m){
  if(m == startMovie){
    startMovie.read();
  }
  else if(m == wishMovie[0]){
     wishMovie[0].read();
  }
  else if(m == wishMovie[1]){
     wishMovie[1].read();
  }
  else if(m == wishMovie[2]){
     wishMovie[2].read();
  }
}

void draw(){
  if(wish == false){
    startMovie.loop();
    image(startMovie,0,0, 1440,900);
  }
  if(wish == true){
    wishMovie[num].loop();
    image(wishMovie[num],0,0, 1440,900);
    
    if(wishMovie[num].time()+0.5>=wishMovie[num].duration()){
      //bgm.amp(0.1);
      print("enter");
      wishMovie[num].stop();
      wish = false;
      bgm.amp(0.6);
  }
    println(wishMovie[num].time()+"   "+wishMovie[num].duration());
  }
  //println(wishMovie.time());
/*  if(wishMovie.time()>=wishMovie.duration()){
      print("enter");
      wish = false;
      wishMovie.stop();
      startMovie.loop();
      image(startMovie,0,0, 1440,900);
  }*/
  
}

void keyPressed(){
  if(wish == false){
      if(key == CODED){
        if(keyCode == UP){
          bgm.amp(0.1);
          num = int(random(3));
          wish = true;
      }
    }
  }

}
