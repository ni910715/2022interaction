//step02-2_瘋狂做菜_5種料理放不同的素材,有食譜,要照順序做菜
//Step01: 食譜, 畫出食譜 (陣列,順序/色彩、答案)
//Step02: 畫出食材的盤子
//Step03: 用drag的方法,把右方的食物,拖到下方的料理區
PImage img_ham1;//漢堡上皮
PImage img_ham2;//漢堡下皮
PImage img_cheese;//起司
PImage img_meat;//肉
PImage img_tomato;//番茄
PImage img_veg;//蔬菜
PImage img_hamburger;
PImage background_color;
Timer timer;

int currentTime=30;//總秒數
String s;
String score;
void setup() {
  size(500, 500);
  background_color = loadImage("background.jpg");

  timer = new Timer(1000);
  s="";
  score="";
  images = new PImage[6];
  images[0] = img_ham1 = loadImage("ham1.PNG");
  images[1] = img_ham2 = loadImage("ham2.png");
  images[2] = img_cheese = loadImage("cheese.PNG");
  images[3] = img_meat = loadImage("meat.png");
  images[4] = img_tomato = loadImage("tomato.png");
  images[5] = img_veg = loadImage("veg.png");

  img_hamburger = loadImage("hamburger.png");
}
int []book={0, 5, 4, 2, 3, 1};
PImage[] images;
//color[]bookC={#FA7C7C, #FABB7C, #F7FA7C, #7CFA89, #7C87FA};
PImage[]mat1;
void draw_material_dish() {
  for (int i=0; i<6; i++) {
    image(images[i], 450, 40+80*i, 70, 70);
  }
}
void draw() {
  background_color.resize(500, 500);
  background(background_color);

  if (timer.complete() == true && currentTime!=0) {//倒數
    currentTime--;
    timer.start();
  }

  fill(255, 0, 0);
  textSize(48);
  textAlign(CENTER);
  s = "time: " + currentTime;
  text(s, 330, 40);

  imageMode(CENTER);
  image(img_hamburger, 200, 100, 130, 130);

  draw_material_dish();//material材料

  noFill();
  rect(10, 250, 310, 140);//料理區

  if (mousePressed && selected != -1 ) {
    image(images[selected], mouseX, mouseY, 30, 30);//選取圖示
  }

  for (int i=0; i<N; i++) {
    int c = result[i];
    image(images[c], 40+i*50, 300, 50, 50);//顯示料理區圖示
  }

  fill(#AEFF03);
  rect(10, 10, 50, 50);
  textSize(32);
  fill(0, 102, 153);
  text(k, 35, 40);


  if (currentTime == 0) { //end計分
    background(background_color);
    textSize(48);
    textAlign(CENTER);
    score = "score: " + k;
    text(score, width/2, height/2);
  }
}

int selected=-1;
int []result=new int[7];//我們現在做出來的料理哦!
int N=0; //有放了幾個材料

void mousePressed() {
  int select=-1;
  for (int i=0; i<6; i++) {
    if ( dist(mouseX, mouseY, 450, 40+80*i)<40 ) select=i;
  }
  if (select!=-1) selected=select;
}
void mouseReleased() {
  if ( 10<mouseX && mouseX<10+310 && 310<mouseY && mouseY<310+140 && N<7-1) {
    //background( bookC[selected] );
    result[N]=selected;
    N++;
  }
}//rect(10, 250, 290,140);//料理區A
int k=0;
void keyPressed() {
  if (keyCode==BACKSPACE && N>0 ) N--;
  if (key==' ') {//準備送菜
    if ( N != 6 ) {
      background(255, 0, 0); //bad!!
      println("bad");
      if (k!=0) k-=5;//計分
      return;
    }
    for (int i=0; i<6; i++) {
      if (result[i]!=book[i]) {
        background(255, 0, 0);
        println("bad");
        if (k!=0) k-=5;//計分
        return;
      }
    }
    println("good");
    k+=10;//計分
    N=0;
  }
  println(N);
}
