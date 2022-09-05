void setup(){
   size(500,500); 
   background(#FFF2B2);
   stroke(255,0,0);
}
void draw(){
   if(mousePressed){
      line(mouseX, mouseY,pmouseX, pmouseY);
   }
}
void keyPressed(){
   if(key == '1') stroke(#C908FF);
   if(key == '2') stroke(#4078FF);
   if(key == '3') stroke(#90FF5A);
}
