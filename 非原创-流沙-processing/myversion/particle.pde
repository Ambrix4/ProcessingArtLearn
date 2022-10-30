//这里改造成面向对象的想法
class Particle{
  PVector pos;  //点的位置
  float life;  //点的生命周期
  int c;    //点的颜色
  float ff;  //？？？从0开始
  
  Particle(float x, float y, int c0){
    pos = new PVector(x, y);
    life = random(1);
    c = c0;
    ff = 0;
  }
  

  void update(){
    //TAU可以表示方向，noise可以看作是某种和位置相关的随机特性
    //即很多点到这个位置之后都会出现一样的noise,柏林噪声是连续的，放大尺幅
    ff = noise(pos.x/120, pos.y/120) * TWO_PI; // Flow Field
    //ff=(0,1)*2pi
    float mainP = 1200;
    //changeDir是改变的方向的单位大小
    float changeDir = TWO_PI / mainP; // 方向を変わる
    //round(四舍五入),
    float roundff = round((ff / TWO_PI) * mainP); // round ff
    // *** main point *** //
    //ff=方向*距离=(单位角度)*(0,2pi)
    ff = changeDir * roundff; // 新方向

    println(ff,tan(ff),sin(ff),cos(ff));
    if(ff>TWO_PI*7/8){println(ff,changeDir,roundff);}
    //改变颜色
    if (ff < 6 && ff > 3) {//右下角流动
      c = colors[0];//红线
      stroke(c);
      pos.add(tan(ff)*random(1,3), tan(ff));//移动的距离x更大一些
      //产生斜角，去掉random则是平的，tanff的范围是负无穷到正无穷
      //所以会有很大的空缺，但是数据类型限制了他的大小，这和js可能产生不同
    } else {
      c = colors[1];
      stroke(c);
      println(ff);
      pos.sub(sin(ff)*random(0.1,1), cos(ff));
      //同理红线
    }
  };

  void show(){
    noFill();
    strokeWeight(random(1.25));//点的粗细
    float lx = 20;//左边距
    float ly = 20;//上边距
    float px = constrain(pos.x, lx, width - lx);//约束框
    float py = constrain(pos.y, ly, height - ly);
    point(px, py);
  };

  boolean finished(){
    life -= random(random(random(random(1)))) / 10;
    //生命周期，很多很多random来确保他是一个很小很小的数
    life = constrain(life, 0, 1);//范围约束
      if (life == 0) {
        return true;
      } else {
        return false;
      }
    };
}
