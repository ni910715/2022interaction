import processing.sound.*;
SoundFile sound1,sound2,sound3;

void setup(){
   size(400,300);
   textSize(50);
   fill(255,0,0);
   sound1 = new SoundFile(this, "SparkSFX.mp3");
   sound1.play();
}
int stage=1;
void draw(){
   
}
