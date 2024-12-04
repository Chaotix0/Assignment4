//Loggerheads
//name: Joshua Frampton

Particle particle = new Particle();

PImage stumpImg;
boolean posLeft = true;
boolean inMenu = true;
boolean chop = false;
boolean treeFalling = false;
ArrayList<Integer> tree = new ArrayList<Integer>();
ArrayList<Particle> particles = new ArrayList<Particle>();
PImage treeImg;
PImage lBranchImg;
PImage rBranchImg;
//animations for player character
PImage axeL1Img;
PImage axeL2Img;
PImage axeL3Img;
PImage axeR1Img;
PImage axeR2Img;
PImage axeR3Img;
PImage titleImg;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  noStroke();
  titleImg = loadImage("loggerheads.png");
  treeImg = loadImage("tree.png");
  stumpImg = loadImage("stump.png");
  lBranchImg = loadImage("branchLeft.png");
  rBranchImg = loadImage("branchRight.png");
  axeL1Img = loadImage("axeLeft1.png");
  axeL2Img = loadImage("axeLeft2.png");
  axeL3Img = loadImage("axeLeft3.png");
  axeR1Img = loadImage("axeRight1.png");
  axeR2Img = loadImage("axeRight2.png");
  axeR3Img = loadImage("axeRight3.png");
}

void gameSetup() {
  //makes the logs appear on the screen to the top
  tree.add(2);
  imageMode(CENTER);
  image(titleImg, 200, 200, 400, 400);//title screen image
  //spawns the first one before the rest to make sure there are no branches
  for (int i = 0; i <= 4; i++) {
    tree.add(int(random(0, 5)));
  }
}

void draw() {
  background(164, 228, 252);
  if (inMenu == true) {
    gameSetup();
  } else {
    game();
  }
}

void treeFall(){
  // if the frame of the animation is 0, make the particle appear
  // if frame is (whatever is long enough for the player to be able to dodge the branch above), make the code underneath run
  // 0 = first log takes position of log above and transfers them to all above logs
  for (int i = 0; i < tree.size() - 1; i++) {
    tree.set(i, i+1); // taking wahts above and transfering underneath
  }
  treeFalling = false;
}

void game() {
  fill(0, 88, 0);
  rect(200, 370, 400, 60);
  image(stumpImg, 200, 330, stumpImg.width * 4, stumpImg.height * 4);
  //loop is going through all sections of the tree and diplaying them
  for (int i = 0; i < tree.size(); i++) {
    image(treeImg, 200, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
  }
  //for loop showing all logs of the tree
  for (int i = 0; i < tree.size(); i++) {
    //if the branch value = 0 then spawn a brach on the right side
    if (tree.get(i) == 0) {
      image(rBranchImg, 200+60, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
    //if the branch value = 1 then spawn a brach on the left side
    else if (tree.get(i) == 1) {
      image(lBranchImg, 200-55, 330 - (i * treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
  }
  //setting player character on left or right of the tree
  if (posLeft == true) {
    //chop and facing left play left chop sprite
    if (chop == true) {
      image(axeL2Img, 150, 380 - (treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
    else {
      image(axeL1Img, 150, 380 - (treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
  }
  //if the branch value = 1 then spawn a brach on the left side
  else {
    //chop and facing right play right chop sprite
    if (chop == true) {
      image(axeR2Img, 150, 380 - (treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
    else {
      image(axeR1Img, 255, 380 - (treeImg.height * 4), treeImg.width * 4, treeImg.height * 4);
    }
  }
}

void keyPressed() {
  if (inMenu == true) {
    if (key == ' ') {
      inMenu = false;
    }
  } else {
    if (keyCode == LEFT) {
      posLeft = true;
    } else if (keyCode == RIGHT) {
      posLeft = false;
    }
    if (key == ' ' && treeFalling == false) {
      if (int(posLeft) == tree.get(0)) {
        // game over
      } else {
        chop = true;
        // reset the tree falling timer
        treeFall();
        // continue
      }
    }
  }
}
