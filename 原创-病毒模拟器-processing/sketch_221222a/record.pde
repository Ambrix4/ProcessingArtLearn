class record{
  int pnum,vnum;//人数，毒数
  float pimmunity, plife;//平均免疫力,平均寿命
  virus[] vcord;//需要展示的病毒
  int[]  vn;//病毒感染人数
  int free;
  int day;
  
  record(){
    pnum = 0;vnum = 0;pimmunity = 0;free = 0;plife=0;day=0;
  }
  
  void update(){
    day+=1;
    vcord = new virus[5];free=0;
    ArrayList<Integer> infnum = new ArrayList<Integer>();
    vnum = v.size();for(int i = 0 ; i < vnum;i++){infnum.add(0);}
    pnum = p.size();
    for(int i = pnum -1 ;i>=0;i--){
      pimmunity += p.get(i).immunity;
      plife += p.get(i).life;
      if(p.get(i).status){free+=1;continue;}
      int pos = v.indexOf(p.get(i).nowVirus);
      if(pos!=-1){
        infnum.set(pos,infnum.get(pos)+1);
      }
    }
    pimmunity /= pnum;
    plife /= pnum;
    vn = new int[]{-1,-1,-1,-1,-1};
    for(int i = vnum-1;i>=0;i--){
      for(int j=0;j<5;j++){
        if(infnum.get(i)>vn[j]){
          vcord[j]=v.get(i);
          vn[j] = infnum.get(i);
          break;
        }
      }
      if(infnum.get(i) == 0){
        infnum.remove(i);
        v.remove(v.get(i));
      }
    }
  }
}
