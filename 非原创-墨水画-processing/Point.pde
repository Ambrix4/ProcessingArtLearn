class pointer{
  int dist;
  float rad;
  float speed;
  float acc;
  PVector pos;
  float finalSize;
  PVector downSpeed;
  PVector downAcc;
  
  pointer(float orad,float oacc,float ofinalSize){
    dist=1;
    rad=orad;
    speed=0;
    acc=oacc;
    pos=new PVector(0, 0);
    finalSize=ofinalSize;
    downSpeed=new PVector(0, 0.01);
    downAcc=new PVector(0, 0.05+acc/500);
  }
 void move(){
    if(dist<=finalSize){
      speed+=acc;
      dist+=speed;
      pos=new PVector (cos(rad)*dist, sin(rad)*dist);
    } else{
      downSpeed.add(downAcc);
      pos.add(downSpeed);  
    }
  }
}
