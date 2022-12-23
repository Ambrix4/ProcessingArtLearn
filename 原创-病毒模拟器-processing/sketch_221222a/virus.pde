class virus{
  int c;//独立颜色
  float infectPower, infectLen;//感染力，感染半径
  int gen; //变异周期
  float toxcity;//毒性，生命威胁系数
  float vary;//变异概率
  virus(int f){
    infectPower = random(1);infectLen = random(5,10);
    gen = f + 1; toxcity = random(1);vary = random(1);
    //c = color((1-toxcity)*255,(1-infectPower)*255,(1-infectLen/10)*255);
    c = color(random(255),random(255),random(255));
    //c = color((toxcity)*255,(infectPower)*255,(infectLen/10)*255);
  }
}
