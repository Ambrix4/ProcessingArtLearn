//“220919a” by Okazzhttp://openprocessing.org/sketch/1653811License CreativeCommons Attribution NonCommercial ShareAlikehttps://creativecommons.org/licenses/by-nc-sa/3.0
let forms = [];
let colors = ['#f70640', '#f78e2c', '#fdd903', '#cae509', '#63be93', '#81cfe5', '#299dbf', '#38187d', '#a4459f', '#f654a9', '#2F0A30'];

function setup() {
  createCanvas(900, 900);

  let c = 18;
  let w = width / c;
  for (let i = 0; i < c; i++) {
    for (let j = 0; j < c; j++) {
      let x = i * w + w / 2;
      let y = j * w + w / 2;
      if ((i + j) % 2 == 0) {
        for (let k = 0; k < 5; k++) {
          forms.push(new Form(x, y));
        }
      }
    }
  }
  background(0);

}

function draw() {
  //先转移到中央0,0然后转移到左上角度
  translate(width / 2, height / 2);
  scale(1.1);
  translate(-width / 2, -height / 2);
  background(255);
  for (let i of forms) {
    i.show();
    i.move();
  }
}

class Form {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.x0 = x;
    this.y0 = y;
    this.r0 = random(10, 25);
    this.r = this.r0;
    this.d0 = random(15) * random() + 5;
    this.d = this.d0;
    this.n = int(random(3, 13));
    this.a = random(100);
    this.t = random(10000);
    this.r1 = random(0.01);
    this.r2 = random(0.01);
    this.r3 = random(0.01);
    this.col = color(random(colors));
  }

  show() {
    noStroke();
    fill(this.col);
    push();
    translate(this.x, this.y);
    rotate(this.a);
    for (let i = 0; i < this.n; i++) {
      let theta = map(i, 0, this.n, 0, TAU);
      ellipse(this.r * cos(theta), this.r * sin(theta), this.d, this.d);
    }
    pop();
  }

  move() {
    this.t++;
    this.a = TAU * sin(this.t * this.r1);
    this.r = this.r0 * sin(this.t * this.r2);
    this.d = this.d0 * sin(this.t * this.r3);
    this.x += 0.5;
    this.y -= 0.5;
    if (this.x > width) {
      this.x = 0;
    }
    if (this.y < 0) {
      this.y = height;
    }
  }
}
