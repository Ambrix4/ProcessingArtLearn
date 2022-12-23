class showwin extends PApplet {
  int w, h;
  PApplet parent;

  public showwin(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;w=_w;h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  void draw() {
    background(190);
    int pos = 50;
    PFont f = createFont("仿宋",155);
    textFont(f);
    textSize(30);
    text("时间："+String.format("%.0f", float(rcd.day/365)).toString()+"年",0,pos);
    pos += 40;
    text("人口数："+rcd.pnum,0,pos);
    pos += 40;
    text("毒种数："+rcd.vnum,0,pos);
    pos += 40;
    for(int t = 0;t<rcd.vcord.length;t++){
      virus tv = rcd.vcord[t];
      if(tv==null){continue;}
      fill(tv.c);
      text("迭代"+tv.gen+": ",0,pos);
      fill(0);
      text(rcd.vn[t]+" 毒性："+String.format("%.3f", tv.toxcity).toString()
          +" 感染力：" + String.format("%.3f", tv.infectPower).toString()
          +" 变异率：" + String.format("%.3f", tv.vary).toString()
          +" 半径：" + String.format("%.3f", tv.infectLen).toString(),100,pos);
      pos += 40;
    }
    pos = height -120;
    fill(0);
    text("平均抵抗力："+String.format("%.3f", rcd.pimmunity).toString(),0,pos);
    pos += 40;
    fill(0);
    text("平均寿命："+String.format("%.0f", rcd.plife).toString(),0,pos);
    pos += 40;
  }
}
