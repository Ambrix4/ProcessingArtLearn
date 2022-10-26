ArrayList<Form> forms = new ArrayList<Form>();
int[] colors = new int[]{#f70640,#f78e2c,#fdd903,#cae509,#63be93,#81cfe5,#299dbf,#38187d,#a4459f,#f654a9,#2F0A30};
PImage logo;
void setup() {
  logo=loadImage("processing.png");
  size(1920,1080);
  // c 一行几个，w宽度高度
  int c = 18, w = width / c;
  for (int i = 0; i < c; i++) {
    for (int j = 0; j < c; j++) {
      float x = i * w + w / 2;
      float y = j * w + w / 2;//+ w / 2
      //00,01,10,11棋盘网格的偶数格，只在这里产生花花，5是最多5层花
      if ((i + j) % 2 == 0) {
        for (int k = 0; k < 5; k++) {
        println(i,j,x,y);
        forms.add(new Form(x, y,colors[int(random(1,colors.length+1))-1]));
        println(i,j,x,y);}
      }
    }
  }
  //print(forms);
  //background(255);
  noStroke();
  fill(color(255,255,255));
  rect(0,1080/2,1920,1080/2);
  fill(color(0,0,0));
  rect(0,0,1920,1080/2);

  imageMode(CENTER);
}

void draw() {
  if(frameCount >100){

  //以中央为0，0,把边界移动到屏幕外
  translate(width / 2, height / 2);
  scale(1.1);//所有作图的放大倍率是1.1
  translate(-width / 2, -height / 2);
  //noStroke();
  //fill(color(255,255,255,10));
  //rect(0,0,1920,1080);
  
  //fill(color(0,0,0,10));
  //rect(1920/2,0,1920/2,1080);
  //background(0);
    noStroke();
    fill(color(0,0,0,10));
    rect(0,0,1920/3,1080/2);
    fill(color(0,0,0,100));
    rect(1920/3,0,1920/3,1080/2);
    
    fill(color(255,255,255,10));
    rect(0,1080/2,1920/3,1080/2);
    fill(color(255,255,255,100));
    rect(1920/3,1080/2,1920/3,1080/2);

  for (Form i: forms) {
    i.show();
    i.move();
  }
  }
  //image(logo,width/2,height/2,976*1.5,225*1.5);
}

void mousePressed(){
  saveFrame("#####.png");
}
