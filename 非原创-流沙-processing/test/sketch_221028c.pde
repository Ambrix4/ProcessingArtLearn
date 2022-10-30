// by SamuelYAN
// more works //
   // https://twitter.com/SamuelAnn0924
   // https://www.instagram.com/samuel_yan_1990/
//“Sands 002” by SamuelYANhttp://openprocessing.org/sketch/1353598License CreativeCommons Attribution NonCommercial ShareAlikehttps://creativecommons.org/licenses/by-nc-sa/3.0
//ArrayList比起数组更加方便
PGraphics pg;
ArrayList<Particle> particles = new ArrayList<Particle>();              
int[] colors = new int[2];
int parNum = 10000; // パーティクルの総数
int ct = 1;

void setup() {
  size(1920,1080);
  // pixelDensity(5);
  //转换成HSB模式，色调圆盘，饱和度，亮度，透明度
  //colorMode(HSB, 360, 100, 100, 100);
  //放进两种颜色
  //colors[0] = color(15, 90, 90, random(25, 50));
  colors[0] = color(229,74,22, random(100,100));
  //colors[1] = color(175, 90, 90, random(25, 50));
  colors[1] = color(22,229,212, random(100,100));
  //遍历放入parNum个粒子
  //java random是左闭右开的，而且是伪随机数，
  for (int i = 0; i < parNum; i++) {
    //println(i);
    particles.add(new Particle(random(width), random(height),colors[int(random(0,2))]));
  } 
  //背景黑色
  background(0, 0, 5, 100);
  pg = createGraphics(1920,1080);//新建一个看不见的图层
  PImage p = loadImage("test.png");
  pg.beginDraw();
  pg.imageMode(CENTER);
  pg.image(p,width/2,height/2);
  //pg.fill(0);
  //PFont font = createFont("Segoe UI Bold Italic", 300);
  //pg.textFont(font);
  //pg.text("Amber.Larix.", width/2-875, height/2+50);
  pg.endDraw();
  pg.loadPixels();
  noLoop();
}

void draw() {
  //image(pg,0,0);//这样才能展示出来
  //particles.size(),.get(),.set(),.remove(),
  //解决方法，倒序删除，迭代器remove()
  //遍历所有点，更新位置，显示位置，删除点
  for (int j = particles.size() - 1; j > 0; j--) {
    particles.get(j).update(pg.pixels,ct);//pixels就是刚才读出来的像素
    particles.get(j).show();
  
    if (particles.get(j).finished()) {
      particles.remove(j);
      //background();透明度覆盖问题
      //noStroke();
      //fill(0, 0, 5, 0.1);
      //rect(0,0,width,height);
      
    }
  }
  //如果不足粒子上限，就随机生成一下
  for (int i = particles.size(); i < parNum; i++) {
    particles.add(new Particle(random(width), random(height),colors[int(random(0,2))]));
  } // パーティクルを補充->补充粒子
}

void keyPressed() {
  //单引号和双引号的区别
  if (key == 's' || key == 'S') {
    noLoop();
    saveFrame("######.png");
  }
  if(key == 'r' || key == 'R'){
    background(0);
    ct += 1;
  }
}

void mousePressed(){
  loop();
}
