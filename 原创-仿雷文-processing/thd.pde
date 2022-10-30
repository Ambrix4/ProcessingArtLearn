class thd{
  PVector[] k;
  int pos = 0;
  thd(){
    k = new PVector[6];
    pos = 0;
  }
  void add(PVector t){
    k[pos] = t;
    pos += 1;
  }
  
}
