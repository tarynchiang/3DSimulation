class Vector{
  float x;
  float y;
  float z;
  
  Vector(float x,float y,float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  // add function
  Vector add(Vector v){
    float newX,newY,newZ;
    
    newX = this.x + v.x;
    newY = this.y + v.y;
    newZ = this.z + v.z;
    
    return new Vector(newX,newY,newZ);
  }
  
  // subtraction function 
  Vector sub(Vector v){
    float newX,newY,newZ;
    
    newX = this.x - v.x;
    newY = this.y - v.y;
    newZ = this.z - v.z;
    
    return new Vector(newX,newY,newZ);
  }
  
  // multiplication function
  Vector mult(float scaler){
    float newX,newY,newZ;
    
    newX = this.x*scaler;
    newY = this.y*scaler;
    newZ = this.z*scaler;
    
    return new Vector(newX,newY,newZ);
  }
  
  
  Vector div(float scaler){
    float newX,newY,newZ;
    
    newX = this.x/scaler;
    newY = this.y/scaler;
    newZ = this.z/scaler;
    
    return new Vector(newX,newY,newZ);
  }
  
  Vector normalize(){
    float newX,newY,newZ;
    float len = mag();
    newX = this.x/len;
    newY = this.y/len;
    newZ = this.z/len;
    
    return new Vector(newX,newY,newZ);
  }
  
  // length of vector
  float mag(){
    return sqrt(pow(this.x,2)+pow(this.y,2)+pow(this.z,2));
  }
  
  // dot product 
  float dot(Vector v){
    return this.x*v.x + this.y*v.y + this.z*v.z; 
  }
  
  // cross product
  
  
}
