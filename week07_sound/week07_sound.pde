import processing.sound.*;

void setup(){
   Sound s= new Sound(this);
   SoundFile file = new SoundFile(this, "Intro Song_Final.mp3");
   file.play();
}
void draw(){
  
}
void mousePressed(){
    SoundFile file2 = new SoundFile(this, "In Game Music.mp3");
}
