class Ball{
  Vector pos;
  float radius;
  
  Ball(){
    pos = new Vector(400,700,250);
    radius = 50;
  }
    
  void Display(){
    noStroke();
    lights();
    fill(0, 0, 255);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    sphere(radius);
    popMatrix();
  }
  
}
