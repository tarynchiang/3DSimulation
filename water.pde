class Water{
  ArrayList<Droplet> dList = new ArrayList<Droplet>(); // list of water particle
  int numW = 10; // number of water generated per time

  void addP(){
    for(int i=0;i < numW;i++){
      Droplet d = new Droplet();
      dList.add(d);
    }
  }
  
  void Display(){
    for(int i = dList.size()-1; i>=0; i--){
      Droplet d = dList.get(i);
      d.Display();   
      
      if(d.isDead()){
        dList.remove(i);
      }
    }
  }
  
  void Update(float dt){
    for(int i = dList.size()-1; i>=0; i--){
      Droplet d = dList.get(i);
      d.Update(dt);   
      
      if(d.pos.y > 700){
        d.vel.y *= -0.55;
        d.vel.x *= random(-0.5, 0.5);
        d.vel.z *= random(-0.5, 0.5);
      }
      //detecting collision
      detectCollision();
      
      if(d.isDead()){
        dList.remove(i);
      }
    }
  }
  
  void detectCollision(){
    for(int i=0; i < dList.size();i++){
      Vector dist = dList.get(i).pos.sub(ball.pos);  
      float d = dist.mag();
      
      if(d < ball.radius + 0.9){
        Vector n = dist.mult(-1).normalize();
        float dotP = n.dot(dList.get(i).vel);
        Vector bounce = n.mult(dotP).mult(1.5);
        dList.get(i).vel = dList.get(i).vel.sub(bounce);
        dList.get(i).pos.add(n.mult(1+ball.radius-d));
      }
    }
  }
  
  void run(float dt){
    addP();
    Update(dt);
    Display();
  }
}
