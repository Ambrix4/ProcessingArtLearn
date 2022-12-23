ArrayList<virus> v;
ArrayList<person> p;
record rcd;
showwin cf;
int Total=1000;
void setup(){
  size(1000,1000);
  v = new ArrayList<virus>();
  v.add(new virus(0));
  p = new ArrayList<person>();
  for(int i=0;i<Total;i++){p.add(new person(new PVector(random(width),random(height)),i));}
  p.get(0).infect(v.get(0));
  rcd = new record();
  rcd.update();
  cf = new showwin(this, 950, 500, "Controls");
}

void draw(){
  background(100);
  for(int i = p.size()-1;i>=0;i--){
    p.get(i).update();
  }
  for(int i=0;i<random(0,0.0017)*p.size();i++){p.add(new person(new PVector(random(width),random(height)),i));}
  rcd.update();
}

void mousePressed(){
  v.clear();
  v.add(new virus(0));
  p.clear();
  for(int i=0;i<Total;i++){p.add(new person(new PVector(random(width),random(height)),i));}
  p.get(0).infect(v.get(0));
  rcd = new record();
  rcd.update();
}
