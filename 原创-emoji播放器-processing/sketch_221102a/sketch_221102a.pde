//根据输入声音进行emoji变化

import processing.sound.*;
File[] emojiname ;
int num;
int total;
String folderName="自行更改";
File file = new File(folderName);
ArrayList<PImage> emoji= new ArrayList<PImage>();
ArrayList<Integer> nmoji = new ArrayList<Integer>();
ArrayList<Float> de = new ArrayList<Float>();
float size;
PImage logo;
Amplitude loudness;
Waveform[] waveform = new Waveform[15];
int samples = 100;
int bands = 128;
FFT fft;
float smoothingFactor = 0.2;
float[] sum = new float[bands];
int scale = 5;
float barWidth;
SoundFile input;
//AudioIn input;

void setup() {
  size(1920,1080);
  print(file);
  background(255);
  input = new SoundFile(this, "新宝島-サカナクション.mp3");
  //input = new AudioIn(this, 0);
  //input.start();
  loudness = new Amplitude(this);
  loudness.input(input);
  for(int i=0;i<waveform.length;i++){waveform[i] = new Waveform(this, samples);samples*=2;waveform[i].input(input);}
  samples=100;
  noStroke();
  imageMode(CENTER);
  emojiname =file.listFiles();
  num = emojiname.length;
  int y = 300;
  int ys = 70;
  fft = new FFT(this, bands);
  fft.input(input);
  barWidth = width/float(bands);
  for(File i:emojiname){
    emoji.add(loadImage(folderName+i.getName()));
  }
  print(emoji.size());
  while (y <= height-300) {
    int x = 0; //width/2 - 5*ys z
    while (x <= width +ys) { //width/2 + 5*ys
      //nmoji.add(int(random(0,emoji.size()-1)));
      nmoji.add(int(random(0,emoji.size()-1)));
      de.add(0.0);
      x+=ys;
    }
    ys *=1.25;
    y += ys*0.8;
  }
  total = nmoji.size();
  input.loop();
}


void draw() {
  background(100);
    fft.analyze();
  fill(0);
  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;

    // Draw the rectangles, adjust their height using the scale factor
    rect(i*barWidth, height, barWidth*1.7, -sum[i]*height*scale);
  }
  input.amp(1);
  float volume = loudness.analyze();
  size = int(map(volume, 0, 0.5, 0, emoji.size()-1));
  strokeWeight(2);
  noFill();
  int count = 0;
  int y = 300;
  int ys = 70;
  int esize = int(size);
  int w = 0;
  boolean in = random(0,1)>0;
  while (y <= height-300) {
    waveform[w].analyze();
    int x = 0; //width/2 - 5*ys 
    while (x <= width +ys) { //width/2 + 5*ys
      de.set(count,lerp(de.get(count),waveform[w].data[int(map(x,0, width+ys,0,samples*pow(2,w)))]*1.5,0.1));
      push();
      translate(x,y);
      //rotate(de.get(count)/80);
      boolean t = de.get(count)<0.1;//random(0,1)>0.2 ;
      if(in && t && nmoji.get(count)+esize>emoji.size()-1){nmoji.set(count,nmoji.get(count)+int(map(esize%emoji.size(),0,emoji.size()-1,-nmoji.get(count),emoji.size()-1-nmoji.get(count))));}
      else if(in && t){nmoji.set(count,nmoji.get(count)+esize);}
      float sz = ys*map(de.get(count),-1,1,-1.5,3);
      if(!t){}else{sz*=0.4;}
      //text(randname(),0,0,sz,sz);
      image(take(int(nmoji.get(count))),0,0,sz,sz);
      x+=ys;
      pop();
      count += 1;
    }
    ys *=1.25;
    y += ys*0.8;
    w+=1;
  }
}

void mousePressed(){
  saveFrame("####.png");
}
