class Fire{
  ArrayList<Spark> sList = new ArrayList<Spark>(); // list of fire particle
  int numF = 10; // number of fire generated per time

  void addP(){
    for(int i=0;i < numF;i++){
      Spark s = new Spark();
      sList.add(s);
    }
  }
  
  void Display(){
    for(int i = sList.size()-1; i>=0; i--){
      Spark s = sList.get(i);
      s.Display();   
      
      if(s.isDead()){
        sList.remove(i);
      }
    }
  }
  
  void Update(float dt){
    for(int i = sList.size()-1; i>=0; i--){
      Spark s = sList.get(i);
      
      for(int j=0;j<waterSim.dList.size();j++){
        s.cooling(waterSim.dList.get(j));
      }
      
      s.Update(dt);   
      
      if(s.isDead()){
        sList.remove(i);
      }
    }
  }
  
  void run(float dt){
    addP();
    Update(dt);
    Display();
  }
}
