class Spark{
  Vector pos;
  Vector vel;
  float rC,gC,bC;
  float r;
  float theta;
  float temperature;
  float lifespan;
  float opacity;
  float aX,aZ,aN;
  
  Spark(){
    r = rFG*sqrt(random(1));
    theta = 2*PI*random(1);
    
    //intial position
    pos = new Vector(oF.x+r*sin(theta),oF.y,oF.z+r*cos(theta));
    
    //initial velocity 
    vel = new Vector(random(-10,10),random(-20,-13),random(-10,10));
    
    temperature = 100;
    lifespan = 300;
    opacity = 250;
    
    rC = 255;
    gC = 200;
    bC = 0;
  }
  
  void Update(float dt){
    //update position
    Vector dx = vel.mult(dt);
    pos = pos.add(dx);
    
    //update velocity
    aX = oF.x - pos.x;
    aZ = oF.z - pos.z;
    vel.x = aX*0.3;
    vel.z = aZ*0.3;
    
    gC -= 5; 
    
    // check if it is smoke and update life time 
    if(isSmoke()){
      rC = 128;
      gC = 128;
      bC = 128; 
      lifespan -=0.1;
    }else{
      //update life
      lifespan -=5;
    }
    
  }
  
  boolean isDead(){
    if(lifespan < 0 || opacity <= 0){
      return true;
    }else{
      return false;
    }
  }
  
  boolean isSmoke(){
    
    if(lifespan < 30 && lifespan > 25){
      opacity = 120;
      vel.x = random(-10,10);
      vel.z = random(-10,10);
    }
    
    if(lifespan < 30) {
      vel.y = -30;
      aX = oF.x - pos.x;
      aZ = oF.z - pos.z;
      vel.x += aX;
      vel.z += aZ;
      opacity -= 20;
      return true;
    } 
    else {
      return false;
    }
  }
  
  void cooling(Droplet drop){
    Vector dist = pos.sub(drop.pos);
    float d = dist.mag();
    
    if(d < rF+rD+4){
      lifespan = 27;
    }
  }
  
  void Display(){
    noStroke();
    fill(rC, gC, bC,opacity);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    sphere(rF);
    popMatrix();
  }
}
