//Loggerheads
//name: Joshua Frampton

Particle particle = new Particle();

PImage stumpImg;
boolean posLeft = true;
boolean inMenu = true;
boolean chop = false;
boolean treeFalling = false;
boolean gameOver = false;
boolean game = false;
ArrayList<Integer> tree = new ArrayList<Integer>();
int frame;
int timer;
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
PImage gameOverImg;
PImage signImg;
PFont font;

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
  gameOverImg = loadImage("gameOver.png");
  signImg = loadImage("sign.png");
  font = createFont("Comic Sans MS", 30);
}

void gameSetup() {
  //makes the logs appear on the screen to the top
  tree.add(2);
  imageMode(CENTER);
  image(titleImg, 200, 200, 400, 400);//title screen image
  timer = 300;
  //spawns the first one before the rest to make sure there are no branches
  for (int i = 0; i <= 4; i++) {
    tree.add(int(random(0, 5)));
  }
  tree.set(0, 2);
}

void draw() {
  background(164, 228, 252);
  if (inMenu == true) {
    gameSetup();
  } else if (game == true) {
    game();
  }
  if (timer <= 0) {
    gameOver = true;
    frame = 0;
  }
  if (gameOver == true) {
    if (posLeft == true) {
      image(axeL3Img, 140, 380 - (treeImg.height), treeImg.height, treeImg.height);
      image(gameOverImg, 200, 200, 400, 400);
      if (key == ' ' && frame == 50) {
        inMenu = true;
        gameOver = false;
      }
    } else if (posLeft == false) {
      image(axeR3Img, 270, 380 - (treeImg.height), treeImg.height, treeImg.height);
      image(gameOverImg, 200, 200, 400, 400);
      if (key == ' ' && frame == 50) {
        inMenu = true;
        gameOver = false;
      }
    }
  }
}

void treeFall() {
  // if the frame of the animation is 0, make the particle appear
  if (frame == 0) {
    particles.add(new Particle());
  }
  // if frame is (whatever is long enough for the player to be able to dodge the branch above), make the code underneath run
  if (frame == 10) {
    // 0 = first log takes position of log above and transfers them to all above logs
    for (int i = 0; i < tree.size() - 1; i++) {
      tree.set(i, tree.get(i+1)); // taking wahts above and transfering underneath
    }
    //makes top branch random
    tree.set(5, (int(random(0, 5))));
    treeFalling = false;
  }
}

void game() {
  fill(0, 88, 0);
  rect(200, 370, 400, 60);
  image(signImg, 50, 310, stumpImg.height, stumpImg.height);
  image(stumpImg, 200, 330, stumpImg.height, stumpImg.height);
  //loop is going through all sections of the tree and diplaying them
  for (int i = 0; i < tree.size(); i++) {
    image(treeImg, 200, 330 - (i * treeImg.height), treeImg.height, treeImg.height);
  }
  //for loop showing all logs of the tree
  for (int i = 0; i < tree.size(); i++) {
    //if the branch value = 0 then spawn a brach on the right side
    if (tree.get(i) == 0) {
      image(rBranchImg, 200+60, 330 - (i * treeImg.height), treeImg.height, treeImg.height );
    }
    //if the branch value = 1 then spawn a brach on the left side
    else if (tree.get(i) == 1) {
      image(lBranchImg, 200-55, 330 - (i * treeImg.height), treeImg.height, treeImg.height);
    }
  }
  //setting player character on left or right of the tree
  if (posLeft == true) {
    //chop and facing left play left chop sprite
    if (gameOver == false) {
      if (chop == true) {
        image(axeL2Img, 150, 380 - (treeImg.height), treeImg.height, treeImg.height);
      } else {
        image(axeL1Img, 150, 380 - (treeImg.height), treeImg.height, treeImg.height);
      }
    }
  }
  //if the branch value = 1 then spawn a brach on the left side
  else {
    //chop and facing right play right chop sprite
    if (gameOver == false) {
      if (chop == true) {
        image(axeR2Img, 255, 380 - (treeImg.height), treeImg.height, treeImg.height);
      } else {
        image(axeR1Img, 255, 380 - (treeImg.height), treeImg.height, treeImg.height);
      }
    }
  }

  if (treeFalling == true) {
    treeFall();
  }
  if (frame == 5) {
    chop = false;
  }
  frame += 1;
  //setting the time
  timer -= 1;
  text(("Timer: " + (timer / 60)), 200, 40);
}

void keyPressed() {
  if (inMenu == true) {
    if (key == ' ') {
      inMenu = false;
      game = true;
    }
  } else {
    if (gameOver == false) {
      if (keyCode == LEFT) {
        posLeft = true;
      }
    }
    if (gameOver == false) {
      if (keyCode == RIGHT) {
        posLeft = false;
      }
    }
    if (key == ' ' && treeFalling == false) {
      if (int(posLeft) == tree.get(0)) {
        gameOver = true;
        frame = 0;
      } else {
        treeFalling = true;
        chop = true;
        //reset the tree falling timer
        timer = 300;
        frame = 0;
        // continue
      }
    }
  }
}
