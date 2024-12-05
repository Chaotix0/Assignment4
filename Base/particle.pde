//setting the particle PVector values
class Particle{
  PVector position = new PVector(200,330);
  PVector velocity = new PVector(random(-4,4),-10);
  PVector acceleration = new PVector(0,-0.2);
}

void particleMove(){
  for (int i = 0; i < particles.size(); i++){
    particles.get(i).velocity.x -= particles.get(i).acceleration.x;
    particles.get(i).velocity.y -= particles.get(i).acceleration.y;
    
    particles.get(i).position.x += particles.get(i).velocity.x;
    particles.get(i).position.y += particles.get(i).velocity.y;
  }
}

void display(){
  //getting position of particle and drawing it where it's it is to be
  for (int i = 0; i < particles.size(); i++){
    image(treeChoppedImg, particles.get(i).position.x,  particles.get(i).position.y, treeImg.width * 4, treeImg.height * 4);
  }
}
