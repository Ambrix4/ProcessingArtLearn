// 墨滴类
class drip{
  // 啪嗒列表，全是坐标点
  ArrayList<pointer> splat;
  // 颜色
  int colora;
  // x
  float x;
  // y
  float y;
  // death时间
  float death;
  // 墨晕
  float extent;
  // 噪声开始
  float noiseStart;

  drip(float ox,float oy,float oextent,int[] c){
    //新建一个点集
    splat = new ArrayList<pointer>();
    //随机一个颜色，
    colora = color(c[int(random(c.length))]);
    // 屏幕上随机横坐标
    x=ox;
    // 屏幕随机纵坐标但可以是屏幕上方-100内，营造全局感
    y=oy;
    // 生命周期500
    death=500;
    // 5-30内的一个数
    extent=oextent;
    // 2pi内随机一个数
    noiseStart=random(TWO_PI);
    // 实际上好像就是2pi个数字
    // 0.1产生墨水感，1就很园
    for(float i = noiseStart; i<noiseStart+TWO_PI; i+=0.1){
    //for(float i = noiseStart; i<noiseStart+1; i+=1){
      // 0-1之间的一个噪声Perlin noise
      float acc= (noise(i));
      // 啪嗒列表增加一个pointer,point的i逐渐变大 acc随机，extent不变
      this.splat.add(new pointer(i, acc, extent));
    }  
  }
  
  
 void move(){
   // 遍历所有的啪嗒  
   for(int n=0;n<splat.size();n++){
     // 执行一个pointer的move
     splat.get(n).move();
   }
   // death-1
   death-=1;
   // 如果death<1,删除
   if(death<1){
      rain.remove(rain.indexOf(this));
   }
 } 
 
 void show(){
    // 无边线
    //noStroke();
    // 填充颜色是本类的colors
    String s = hex(colora,6);
    int r = Integer.parseInt(s.substring(0,2),16);
    int g = Integer.parseInt(s.substring(2,4),16);
    int b = Integer.parseInt(s.substring(4,6),16);
    color ne=color(r,g,b,80);
    colora = ne;
    fill(colora);
    // 保留所有绘图状态
    push();
    // 转换起始坐标到某个位置
    translate(x, y);
    // 开始绘图，绘制复杂图
    beginShape();
    // 遍历啪嗒类，所有的点连成线
    for(int i=0; i<splat.size(); i++){
      curveVertex(splat.get(i).pos.x, splat.get(i).pos.y);
    }
    endShape(CLOSE);
    //恢复属性
    pop() ;
   }
}
