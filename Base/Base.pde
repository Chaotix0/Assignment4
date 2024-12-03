//Loggerheads
//name: Joshua Frampton

Particle particle = new Particle();

PImage stumpImg;
boolean posLeft = true;
ArrayList<Integer> tree = new ArrayList<Integer>();
ArrayList<Particle> particles = new ArrayList<Particle>();
PImage treeImg;
PImage lBranchImg;
PImage rBranchImg;

void setup(){
  size(400, 400);
  rectMode(CENTER);
  noStroke();
  //makes the logs appear on the screen to the top
  for (int i = 0; i <= 5; i++){
    tree.add(int(random(0,5)));
  }
  tree.set(0,2);
  treeImg = loadImage("tree.png");
  stumpImg = loadImage("stump.png");
  lBranchImg = loadImage("branchLeft.png");
  rBranchImg = loadImage("branchRight.png");
}

void draw(){
  background(164, 228, 252);
  fill(0, 88, 0);
  rect(200, 370, 400, 60);
  imageMode(CENTER);
  image(stumpImg, 200, 330, stumpImg.width * 4, stumpImg.height * 4);
  //loop is going through all sections of the tree and diplaying them
  for (int i = 0; i < tree.size(); i++){
    image(treeImg, 200, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
  }
  //for loop showing all logs of the tree
  for (int i = 0; i < tree.size(); i++){
    //if the branch value = 0 then spawn a brach on the right side
    if (tree.get(i) == 0){
      image(rBranchImg, 200+60, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
    //if the branch value = 1 then spawn a brach on the left side
    else if (tree.get(i) == 1){
      image(lBranchImg, 200-55, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
  }
  
}
