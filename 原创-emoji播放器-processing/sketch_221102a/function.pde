PImage take(){
  return emoji.get(floor(random(0,emoji.size())));
}

PImage take(int k){
  return emoji.get(k);
}
