class Droplet{
  Vector pos;
  Vector vel;
  float rC,gC,bC;
  float r;
  float theta;
  float temperature;
  float lifespan;
  float opacity;
  
  Droplet(){
    r = rWG*sqrt(random(1));
    theta = 2*PI*random(1);
    
    // intial position
    // (400,655,153) is the location of elephant's nose 
    pos = new Vector(400+r*sin(theta),655,153+r*cos(theta));
    
    // inital velocity
    vel = new Vector(random(0,2),-60,35);
    
    // initial color 
    rC = 110;
    gC = 200;
    bC = 255;
    opacity = 255;
  }
  
  void Update(float dt){
    // update position
    Vector dx = vel.mult(dt);
    pos = pos.add(dx);
    
    // update velocity 
    // add gravity
    vel.y += 9.8 * dt;
    
    rC += 1;
    gC += 1;
    opacity -= 1;
    //lifespan -=1;
  }
  
  boolean isDead(){
    if(opacity <= 0){
      return true;
    }else{
      return false;
    }
  }
  
  void Display(){
    noStroke();
    fill(rC, gC, bC,opacity);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    sphere(rD);
    popMatrix();
  }
}
