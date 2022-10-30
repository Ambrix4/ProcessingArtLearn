float c = 100,k=100;
void setup(){
  size(1920,1080);
  noLoop();
}
void draw(){
  fill(0);
  rect(0,0,width,150);
  rect(0,height-150,width,150);
  noFill();
  stroke(0);
  for(float i=0;i<height;i=i+c){
    for(float j=0;j<width;j=j+k){
      push();
      translate(j,i);
      strokeWeight(10);
      beginShape();
      vertex(0,k/2-10);
      vertex(c/2+10,k);
      vertex(c,k/2-10);
      vertex(c/2,0);
      
      vertex(25,k/2-5);
      vertex(c/2+5,k-25);
      vertex(c-25,k/2-10);
      vertex(c/2,30);
      vertex(c/2,k/2);
      endShape();
      pop();
    }
  }
  translate(-50,-50);
  for(float i=0;i<height;i=i+c){
    for(float j=0;j<width;j=j+k){
      push();
      translate(j,i);
      strokeWeight(10);
      beginShape();
      vertex(c-20,k/2-20);
      vertex(c/2+5,k-30);
      vertex(0+35,k/2);
      vertex(c/2,25);
      vertex(c/2+10,k/2-5);
      endShape();
      pop();
    }
  }

}
