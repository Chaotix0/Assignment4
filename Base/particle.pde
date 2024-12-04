//setting the particle PVector values
class Particle{
  PVector position = new PVector(200,330);
  PVector velocity = new PVector(0,5);
  PVector acceleration = new PVector(0,-0.2);
}

void particleMove(){
  for (int i = 0; i < particles.size(); i++){
    particles.get(i).velocity.x += particles.get(i).acceleration.x;
    particles.get(i).velocity.y += particles.get(i).acceleration.y;
  }
}
