// Form 类
class Form {
  float x,y;//起始坐标位
  float r,r0;//10-25随机数
  float d,d0;//0-15*%+5
  int n;//随机3-13,圈层个数
  float a,t,r1,r2,r3;
  //a随机100，t初始时间状态随机10000,r1，r2，r3随机0.01
  int col;//颜色
  float temp;
  
  Form(float x0,float y0,int c0){
    x = x0;
    y = y0;
    r0 =random(10, 25)*2;//1000;
    r = r0;
    d0 = random(15) * random(1) + 5;
    d = d0;
    n = int(random(3, 13));
    a = random(100);
    t = random(10000);//0；
    r1 = random(0.01);
    r2 = random(0.01);
    r3 = random(0.01);
    col = c0;
    temp=random(0.01);
  }
  //绘制一个Form
  void show() {
    noStroke();  //无外边线
    fill(col);  //填充颜色
    push();  //保存坐标
    translate(x, y); 
    //转移坐标到xy，和直接xy没有区别，但是不需要计算，更常采用
    rotate(a);  //旋转角度a
    //stroke(255,0,0);strokeWeight(30);
    //noFill();stroke(col);strokeWeight(5);
    //ellipse(0,0,2*r,2*r);
    //fill(col);noStroke();
    for (int i = 0; i < n; i++) {
      float theta = map(i, 0, n, 0, TAU); 
      //转换为0,2*PI之间的值，相当于等分
      ellipse(r * cos(theta), r * sin(theta), d, d);//+10*sin(t*temp)
      //圆，sin cos 做位置，半径为d
    }
    pop();//还原坐标位置
  }
  //状态转移函数
  void move() {
    t++;  //t增加1
    a = TAU * sin(t * r1); //2pi*sin(t*r1),随时间变，是旋转角速度,和初始a关系不大
    r = r0 * sin(t * r2);//r是轨道的半径大小，半径在变化
    d = d0 * sin(t * r3);//d是每一个圆点直径
    //向右上角移动
    x += 0.5;
    y -= 0.5;//*(1080/1920)
    //超过右下的回到左上
    if (x > width) {x = 0;}
    if (y < 0) {y = height+800;}
  }
}
