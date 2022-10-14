// 颜色值的列表
int[] colors = new int[]{#75b9be,#696d7d,#d72638,#f49d37,#140f2d};
//int[] colors = new int[]{#75b9be};
// drip的列表
ArrayList<drip> rain = new ArrayList<drip>();
PFont font;


void setup(){
  // 窗口
  size(1920,1080);
  // 背景，blendMode是颜色重复覆盖的时候如何融合
  background(#f0ead6);
}

void draw(){
  if(frameCount==1){
    delay(1000);
  }
  else{
    // //生成一个透明度10的颜色
    //color backgroundColor=color(0xf0,0xea,0xd6,10);
    //////// 设定背景，意义在于抵消draw循环留下的痕迹
    if(frameCount%2==0){
      //增加一个drip
      rain.add(new drip(random(width), random(-100, height), random(5,30), colors));
      noStroke();
      fill(color(0xf0,0xea,0xd6,10));
      rect(0,0,width,height);
      
    }
    for(int i=rain.size()-1; i>=0; i--){
      rain.get(i).move();
      rain.get(i).show();
    }
  }
}
