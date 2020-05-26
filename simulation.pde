PShape elephant, fire;
Vector oE; // location of elephant 
Vector oF; // location of fire
float rFG = 50; // radius of fire generator 
float rF  = 3; // radius of fire particle
float rWG = 10; // radius of water generator
float rD = 2; // radius of droplet
Fire fireSim;
Water waterSim;
Ball ball;
Camera camera;

void setup(){
  size(800,800,P3D);
  elephant = loadShape("elephantObj/elephant.obj");
  elephant.rotateX(PI);
  elephant.rotateY(-PI/2);
  fire = loadShape("campfireObj/campfire.obj");
  fire.rotateX(PI);
  oE = new Vector(400,700,0);
  oF = new Vector(400,700,600);
  
  fireSim = new Fire();
  waterSim = new Water();
  ball = new Ball();
  camera = new Camera();
}

void draw(){
  background(0);
  
  //draw elephant
  pushMatrix();
  translate(oE.x,oE.y,oE.z);
  scale(30);
  shape(elephant,0,0);
  popMatrix();
  
  //draw fire base
  pushMatrix();
  translate(oF.x,oF.y,oF.z);
  shape(fire,0,0);
  popMatrix();
  
  //x line (red)
  stroke(255,0,0);
  line(0,0,0,700,0,0);
  
  //y line(green)
  stroke(0,255,0);
  line(0,0,0,0,700,0);
  
  //z line(blue)
  stroke(0,0,255);
  line(0,0,0,0,0,700);
  
  camera.Update( 1.0/frameRate );
  println("x: ",camera.position.x,"y: ",camera.position.y,"z: ",camera.position.z);
  println("theta: ",camera.theta);
  
  //run fire simulation
  fireSim.run(0.1);
  
  //run water simulation
  waterSim.run(0.1);  
  
  ball.Display();
}




void keyPressed()
{
  camera.HandleKeyPressed();
}

void keyReleased()
{
  camera.HandleKeyReleased();
}

void mouseDragged(){
  ball.pos.x = mouseX;
  ball.pos.y = mouseY;
}
