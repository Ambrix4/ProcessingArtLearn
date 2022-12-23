class person{
  PVector nowPosition, endPosition;//当前位置，移动位置
  PVector[] alwaysPosition;//常去位置
  float speed,immunity,buff;//移动速度，免疫力,状态
  float life;//生命长度
  virus nowVirus;//当前疾病
  boolean status;//是否有病
  ArrayList<Integer> virusList;//得过的病
  ArrayList<Integer> listNumber;//分别感染几次
  int name;//名字
  
  person(PVector n, int na){
    nowPosition = n;
    endPosition = new PVector(int(random(width)),int(random(height)));
    speed = random(0.1,0.5);
    virusList=new ArrayList<Integer>();
    listNumber = new ArrayList<Integer>();
    status=true;
    name = na;
    life = 80*random(0.8,1.2);
    immunity=random(0.6);
    buff = -0.1;
  }
  
  void infect(virus vv){
    int p = virusList.indexOf(vv.c);
    if(p!=-1 && random(1)*listNumber.get(p)<0.8){return;}
    status = false;
    nowVirus = vv;
    buff+=(immunity-nowVirus.toxcity)>0?0:(immunity-nowVirus.toxcity)*2.5;
    if(p!=-1){listNumber.set(p,listNumber.get(p)+1);buff*=0.8*listNumber.get(p);}
    else{virusList.add(vv.c);listNumber.add(1);}
  }
  
  void heal(){
    if(buff<-0.1){
      buff += 0.3*(-0.1-buff);
      if(abs(buff+0.1)<0.01 || buff > -0.1){
        nowVirus=null;
        status=true;
        buff=-0.1;
      }
    }
    life += buff;
  }
  
  void update(){
    if(life<=0){p.remove(this);return;}
    this.heal();
    if(status){
      for(person t:p){
        if(t.status){continue;}
        if(t.nowPosition.dist(nowPosition) < t.nowVirus.infectLen){
          if(random(1)> t.nowVirus.infectPower){continue;}
          if(random(1)<t.nowVirus.vary){
            v.add(new virus(t.nowVirus.gen));
            this.infect(v.get(v.size()-1));
          }else{this.infect(t.nowVirus);}
          break;
        }
      }
    }
    this.move();
  }
  
  void move(){
    nowPosition.add(PVector.sub(endPosition,nowPosition).mult(speed*0.04));
    if(nowPosition.x <0 ){nowPosition.x = 0;}
    if(nowPosition.x >width ){nowPosition.x = width;}
    if(nowPosition.y <0 ){nowPosition.y = 0;}
    if(nowPosition.y >height ){nowPosition.y = height;}
    if(status){stroke(255);}else{stroke(nowVirus.c);}
    strokeWeight(10);
    point(nowPosition.x,nowPosition.y);
    if(PVector.dist(nowPosition,endPosition)<10){
      endPosition = new PVector(int(random(width)),int(random(height)));
    }
  }
}
